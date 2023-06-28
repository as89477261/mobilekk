import 'dart:async';
import 'dart:ui';

import 'package:oic_next_to_you/common/core/app_error.dart';
import 'package:oic_next_to_you/common/core/app_response.dart';
import 'package:speech_to_text/speech_to_text.dart';

typedef VoiceRecorderResult = Function(AppResponse<String>);

abstract class VoiceRecorder {
  Future<void> recordVoiceToString({
    required String locale,
    required VoiceRecorderResult onResult,
    VoidCallback? onSilenceStop,
  });

  bool get isListening;

  stopRecord();
}

class VoiceRecorderImpl extends VoiceRecorder {
  final SpeechToText _speechToText;
  bool? _speechEnabled;

  // String? _tempLocale;
  // VoiceRecorderResult? _tempOnResult;

  VoiceRecorderImpl(this._speechToText);

  Future<bool> _init({VoidCallback? onSilenceStop}) async {
    final enabled = await _speechToText.initialize(
      onStatus: (status) {
        print('status: $status');

        if (status.toLowerCase() == 'done') {
          onSilenceStop?.call();
        }

        // if (status.toLowerCase() == 'done') {
        //   final locale = _tempLocale;
        //   final onResult = _tempOnResult;
        //
        //   if (locale != null && onResult != null) {
        //     recordVoiceToString(
        //       locale: locale,
        //       onResult: onResult,
        //     );
        //   }
        // }
      },
      // onError: (error) => print('error: $error'),
    );

    _speechEnabled = enabled;
    return enabled;
  }

  var storedString = "";
  var count = 1;
  var stop = false;

  @override
  Future<void> recordVoiceToString({
    required String locale,
    required VoiceRecorderResult onResult,
    VoidCallback? onSilenceStop,
  }) async {
    // Timer.periodic(Duration(seconds: 1), (timer) {
    //   if (stop) {
    //     timer.cancel();
    //     stop = false;
    //   }
    //   storedString += 'ข้อความที่ ${count++} ';
    //   onResult(AppResponse(value: storedString, error: null));
    // });

    // _tempLocale = locale;
    // _tempOnResult = onResult;

    print('_speechEnabled: $_speechEnabled');

    final enabled = _speechEnabled ?? await _init(onSilenceStop: onSilenceStop);

    if (enabled) {
      print('SpeechToText: start');

      await _speechToText.listen(
        onResult: (result) {
          if (!result.finalResult) {
            final words = result.recognizedWords;
            if (words.isNotEmpty) {
              onResult(
                AppResponse(
                  value: result.recognizedWords,
                  error: null,
                ),
              );
            }
          }
        },
        listenMode: ListenMode.confirmation,
        localeId: locale,
      );
    } else {
      onResult(
        AppResponse(
          value: null,
          error: cannotRecordError,
        ),
      );
    }
  }

  @override
  bool get isListening => _speechToText.isListening;

  @override
  stopRecord() {
    print('SpeechToText: end');
    _speechToText.stop();

    // stop = true;
    // _tempLocale = null;
    // _tempOnResult = null;
  }

  static const cannotRecordError =
      AppError(errorMessage: "ไม่สามารถใช้การอัดเสียงได้");
}
