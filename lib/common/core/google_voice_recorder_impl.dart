import 'dart:async';
import 'dart:ui';

import 'package:google_speech/google_speech.dart';
import 'package:oic_next_to_you/common/core/app_response.dart';
import 'package:oic_next_to_you/common/core/speech_to_text.dart';
import 'package:sound_stream/sound_stream.dart';

class GoogleVoiceRecorderImpl extends VoiceRecorder {
  static const _jsonCredentials = r'''
  {
    "type": "service_account",
    "project_id": "oic-next-to-you-dev",
    "private_key_id": "5beb1cd210a5809059fcdac06ea0b322bb31eef6",
    "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQC2D5kzE96KxSVo\nSuX59Z/JUoufjcaX7nfMjHEAEyGdWWDeTD0rrDYveJAogYo9FNO8ewxwASo8CC2w\no9Zz+GD3NLC7ZwetZwH+dxEmtZkMRxiqaSC/xCnpObJTnxjeadpGchHZbnJLRPsu\n2x/0yYlGKx5po4QAwh3GvLE2wyPoXqsVmTDIxnFQQMo6pZpZOrFLHuAs9LmeApWK\nyOUex7GMYVd6khBlhEztGWrG8soJ4zWNaadqNaRWHkwumNGUOBlS0FY7e+PCUk9a\n2H75wQ9f4olFktFqengyVVByz0Y9ePtz2belFVcTOKtNJiWj7zugVYoGNidDvBig\nMj/c2Vn9AgMBAAECggEAB1o0NjIaX2SZTC/HWSCAgLI28pO+6w7sFlEvCHeW6+J6\nmgrRpv3oKhaDTRBE+46bA2y9T2U/DHGwtXmHjrzl3sd2G+DyccZsBL42h0EeFzcX\nnNz5TKbfIdMc65AZNY6bf3mzu1U6XX+BnL5bX5JNzlng7n3pdfKUHpArU8CuZn/U\ns2hpcmnYEBg1iy4oZSp1XZNgzBPf8DKxwfoSna3CQ+R4dHqPKJH9QGd9kUiBxene\new5kblsqRGgrsEpOOpWI9pDiWgdXKnsOzaITRdxQB7MtEtZhrvckcgiP62rbUN3R\nzcNC4Lu1BBR7hLLEeVNm/VO0wgD7YlvdjPbTedQs0QKBgQDuyjdlQ7EpYuSj7h60\n8dRxPusItBQ2RAEk0X2NwoAthc3XKLOS7ST91sXHU9K7ZjCyNlzcmTopveFKikDi\nFgmy8Yy0nSKUFcyNAh5ZRpZoiRw+r1jfVxxSX/Mun4u3mQ1fQJ1IMuSOM0rAS+3v\nTnD0T9DZ9hVDGKYQh0B7ukWyzQKBgQDDLrTS/U9FQPo9Y3IvQb0gYY8cNITB2VKu\nEzjvWwswMquNa+HXyQmGe5v8ydZ3pya0rXQAC3pQQWxKl3mDGkk8oMeUFdhRYQt8\nBxK1hLNoo1hA5zqlFP6+7BF1HPntFVW9ClRFANHFT8YbD2QtSmzfCUK6FTZhUDgf\nLt6exPIj8QKBgCm2OSb/RBsuozHfjo2dELcXfoburfkst+ZukbgJmcpZ7TMAcR3h\nPuz4b2P6SH1jxG3dASunuHlCKfCTZfIYV2liuGl0aW3kwO6AyDxgEDYCfWSVzLh2\nxwO8rwYd6JIRsjxJVTAfc71DSHN+z/lVgnWq25i3W890ps2MUr9KMpKhAoGAThOY\n8e2ykBl2AKiPPKgnZ5SfEsFPedvdXxUBaX4Z86XRSjkllpQs40b/FxgGWsbajNv1\n0y7ENuZ000HUscUKFt6Z93rllWgkl/CcY1A6FFmDLDNTGkZTwTvdn+N/dn9aVMyU\n+SVixHMs5BY8FIH5Gx8xOg7SOgtE5/RvyUMvOYECgYEA37CVAeuswWJWHf9b6i3e\nOcP5T+inXCkcfHXxXNRbcSPd6INZMbZoHkx6aah8WzFXGoGB+UWLNijhUrilrXfh\n9Zd0YFPLq3drTJhNbk8uLxp9AdSeS1XJg7kevOIDqUXqbTnJwc2EecvLLNPl/tMt\nq/y4eHEJjWKdwrnvWMaGrjE=\n-----END PRIVATE KEY-----\n",
    "client_email": "oic-next-to-you-dev@appspot.gserviceaccount.com",
    "client_id": "113485099996843862408",
    "auth_uri": "https://accounts.google.com/o/oauth2/auth",
    "token_uri": "https://oauth2.googleapis.com/token",
    "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
    "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/oic-next-to-you-dev%40appspot.gserviceaccount.com"
  }
  ''';

  final RecorderStream _recorder = RecorderStream();

  StreamSubscription<List<int>>? _audioStreamSubscription;
  StreamController<List<int>>? _audioStreamController;

  bool _isInitialized = false;
  bool _isRecognizing = false;

  String? _tempLocale;
  String? _tempResponseText;
  VoiceRecorderResult? _tempOnResult;

  RecognitionConfig _getConfig(String langCode) => RecognitionConfig(
        encoding: AudioEncoding.LINEAR16,
        model: RecognitionModel.basic,
        enableAutomaticPunctuation: true,
        sampleRateHertz: 16000,
        languageCode: langCode,
      );

  @override
  bool get isListening => _isInitialized && _isRecognizing;

  @override
  Future<void> recordVoiceToString({
    required String locale,
    required VoiceRecorderResult onResult,
    VoidCallback? onSilenceStop,
  }) async {
    if (!_isInitialized) {
      await _recorder.initialize();
      _isInitialized = true;
    }

    _audioStreamController = StreamController<List<int>>();
    _audioStreamSubscription = _recorder.audioStream.listen((event) {
      _audioStreamController?.add(event);
    });

    await _recorder.start();
    _isRecognizing = true;

    final serviceAccount = ServiceAccount.fromString(_jsonCredentials);
    final speechToText = SpeechToText.viaServiceAccount(serviceAccount);
    final config = _getConfig(locale);

    final responseStream = speechToText.streamingRecognize(
      StreamingRecognitionConfig(
        config: config,
        interimResults: true,
      ),
      _audioStreamController!.stream,
    );

    _tempLocale = locale;
    _tempOnResult = onResult;

    var responseText = _tempResponseText ?? '';
    responseStream.listen(
      (data) {
        final currentText =
            data.results.map((e) => e.alternatives.first.transcript).join('\n');
        if (!data.hasError()) {
          if (data.results.first.isFinal) {
            // print('[GoogleVoiceRecorderImpl] recordVoiceToString recognize text isFinal: true');
            // print('[GoogleVoiceRecorderImpl] currentText: $currentText');
            // responseText = responseText.isNotEmpty ? '$responseText\n$currentText' : currentText;
            // _tempOnResult?.call(
            //   AppResponse(
            //     value: responseText,
            //     error: null,
            //   ),
            // );
          } else {
            // print('[GoogleVoiceRecorderImpl] recordVoiceToString recognize text isFinal: false');
            // print('[GoogleVoiceRecorderImpl] currentText: $currentText');
            _tempOnResult?.call(
              AppResponse(
                value: responseText.isNotEmpty
                    ? '$responseText\n$currentText'
                    : currentText,
                error: null,
              ),
            );
          }
        }
      },
      onError: (error) {
        // print('[GoogleVoiceRecorderImpl] onError: $error');
        _stopAndReRecordVoiceToString(lastResponseText: responseText);
      },
      onDone: () {
        _isRecognizing = false;
      },
    );
  }

  @override
  stopRecord() async {
    // print('[GoogleVoiceRecorderImpl] stopRecord');
    await _silenceStop();

    _tempLocale = null;
    _tempOnResult = null;
    _tempResponseText = null;
  }

  _silenceStop() async {
    // print('[GoogleVoiceRecorderImpl] _silenceStop');
    await _recorder.stop();
    await _audioStreamSubscription?.cancel();
    await _audioStreamController?.close();
    _audioStreamController = null;
    _isRecognizing = false;
  }

  _stopAndReRecordVoiceToString({required String lastResponseText}) async {
    // print('[GoogleVoiceRecorderImpl] stopAndReRecordVoiceToString with lastResponseText: $lastResponseText');
    _tempResponseText = lastResponseText;
    await _silenceStop();
    await recordVoiceToString(
      locale: _tempLocale ?? 'th',
      onResult: _tempOnResult ?? (_) {},
    );
  }
}
