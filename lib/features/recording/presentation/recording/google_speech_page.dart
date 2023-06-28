// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:google_speech/google_speech.dart';
// import 'package:intl/intl.dart';
// import 'package:oic_next_to_you/common/core/app_response.dart';
// import 'package:sound_stream/sound_stream.dart';

// typedef VoiceRecorderResult = Function(AppResponse<String>);

// class POCGoogleSpeechWidget extends StatefulWidget {
//   const POCGoogleSpeechWidget({Key? key}) : super(key: key);

//   @override
//   State<POCGoogleSpeechWidget> createState() => _POCGoogleSpeechWidgetState();
// }

// class _POCGoogleSpeechWidgetState extends State<POCGoogleSpeechWidget> {
//   static const _jsonCredentials = '<service-account-credentials-json>';

//   final RecorderStream _recorder = RecorderStream();

//   StreamSubscription<List<int>>? _audioStreamSubscription;
//   StreamController<List<int>>? _audioStreamController;

//   bool _isInitialized = false;
//   bool _isRecognizing = false;

//   String _text = '';
//   int _elapsedTime = 0;

//   RecognitionConfig _getConfig() => RecognitionConfig(
//         encoding: AudioEncoding.LINEAR16,
//         model: RecognitionModel.basic,
//         enableAutomaticPunctuation: true,
//         sampleRateHertz: 16000,
//         languageCode: 'th-TH',
//       );

//   bool get isListening => _isInitialized && _isRecognizing;

//   String get _currentElapsedTime {
//     final time = DateTime.fromMillisecondsSinceEpoch(_elapsedTime * 1000);
//     return DateFormat('HH:mm:ss').format(time.toUtc());
//   }

//   recordVoiceToString({
//     String initialText = '',
//     int initialElapsedTime = 0,
//   }) async {
//     if (!_isInitialized) {
//       await _recorder.initialize();
//       _isInitialized = true;
//     }

//     print('recordVoiceToString');

//     _audioStreamController = StreamController<List<int>>();
//     _audioStreamSubscription = _recorder.audioStream.listen((event) {
//       _audioStreamController?.add(event);
//     });

//     await _recorder.start();

//     setState(() {
//       _isRecognizing = true;
//       _elapsedTime = initialElapsedTime;
//     });

//     final serviceAccount = ServiceAccount.fromString(_jsonCredentials);
//     final speechToText = SpeechToText.viaServiceAccount(serviceAccount);
//     final config = _getConfig();

//     final responseStream = speechToText.streamingRecognize(
//       StreamingRecognitionConfig(
//         config: config,
//         interimResults: true,
//       ),
//       _audioStreamController!.stream,
//     );

//     var responseText = initialText;
//     responseStream.listen(
//       (data) {
//         final currentText =
//             data.results.map((e) => e.alternatives.first.transcript).join('\n');

//         if (!data.hasError()) {
//           if (data.results.first.isFinal) {
//             responseText += '\n$currentText';
//             setState(() => _text = responseText);
//           } else {
//             setState(() => _text = '$responseText\n$currentText');
//           }

//           // onResult(
//           //   AppResponse(
//           //     value: text,
//           //     error: null,
//           //   ),
//           // );
//         }
//       },
//       onError: (error) {
//         print('onError: $error');
//         stopAndReRecordVoiceToString(
//           lastResponseText: responseText,
//           lastElapsedTime: _elapsedTime,
//         );
//       },
//       onDone: () {
//         print('onDone POCGoogleSpeech');
//         setState(() => _isRecognizing = false);
//       },
//     );
//   }

//   stopRecord() async {
//     print('stopRecord');
//     await _recorder.stop();
//     await _audioStreamSubscription?.cancel();
//     await _audioStreamController?.close();
//     _audioStreamController = null;
//     setState(() => _isRecognizing = false);
//   }

//   void stopAndReRecordVoiceToString({
//     required String lastResponseText,
//     required int lastElapsedTime,
//   }) async {
//     await stopRecord();
//     await recordVoiceToString(
//       initialText: lastResponseText,
//       initialElapsedTime: lastElapsedTime,
//     );
//   }

//   @override
//   void initState() {
//     super.initState();
//     Timer.periodic(const Duration(seconds: 1), (timer) {
//       if (_isRecognizing) {
//         setState(() => _elapsedTime++);
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Google Speech Sample'),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         child: Center(
//           child: Column(
//             children: [
//               ElevatedButton(
//                 onPressed: _isRecognizing ? stopRecord : recordVoiceToString,
//                 child: _isRecognizing
//                     ? const Text('Stop recording')
//                     : const Text('Start Streaming from mic'),
//               ),
//               Text(_currentElapsedTime),
//               Text(_text),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Audio File Example',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: const POCGoogleSpeechWidget(),
//       // home: const AudioRecognize(),
//     );
//   }
// }

// // class AudioRecognize extends StatefulWidget {
// //   const AudioRecognize({super.key});
// //
// //   @override
// //   State<StatefulWidget> createState() => _AudioRecognizeState();
// // }
// //
// // class _AudioRecognizeState extends State<AudioRecognize> {
// //   bool recognizing = false;
// //   bool recognizeFinished = false;
// //   String text = '';
// //
// //   RecorderStream _recorder = RecorderStream();
// //
// //   late StreamSubscription _recorderStatus;
// //   late StreamSubscription _playerStatus;
// //   late StreamSubscription _audioStream;
// //
// //   List<Uint8List> _micChunks = [];
// //   bool _isRecording = false;
// //   bool _isPlaying = false;
// //
// //   @override
// //   void initState() {
// //     initPlugin();
// //     super.initState();
// //   }
// //
// //   Future<void> initPlugin() async {
// //     _recorderStatus = _recorder.status.listen((status) {
// //       if (mounted)
// //         setState(() {
// //           _isRecording = status == SoundStreamStatus.Playing;
// //         });
// //     });
// //
// //     _audioStream = _recorder.audioStream.listen((data) {
// //       // print("data $data");
// //       // if (_isPlaying) {
// //       //   _player.writeChunk(data);
// //       // } else {
// //       //   _micChunks.add(data);
// //       // }
// //     });
// //
// //     // _playerStatus = _player.status.listen((status) {
// //     // if (mounted)
// //     //   setState(() {
// //     //     _isPlaying = status == SoundStreamStatus.Playing;
// //     //   });
// //     // });
// //
// //     await _recorder.initialize();
// //     streamingRecognize();
// //   }
// //
// //   void recognize() async {
// //     setState(() {
// //       recognizing = true;
// //     });
// //     final serviceAccount = ServiceAccount.fromString(_jsonCredentials);
// //     final speechToText = SpeechToText.viaServiceAccount(serviceAccount);
// //     final config = _getConfig();
// //     final audio = await _getAudioContent('test.wav');
// //
// //     await speechToText.recognize(config, audio).then((value) {
// //       setState(() {
// //         text = value.results
// //             .map((e) => e.alternatives.first.transcript)
// //             .join('\n');
// //       });
// //     }).whenComplete(() => setState(() {
// //           recognizeFinished = true;
// //           recognizing = false;
// //         }));
// //   }
// //
// //   void streamingRecognize() async {
// //     setState(() {
// //       recognizing = true;
// //     });
// //     final serviceAccount = ServiceAccount.fromString(_jsonCredentials);
// //     final speechToText = SpeechToText.viaServiceAccount(serviceAccount);
// //     final config = _getConfig();
// //
// //     final responseStream = speechToText.streamingRecognize(
// //         StreamingRecognitionConfig(config: config, interimResults: true),
// //         _recorder.audioStream);
// //
// //     responseStream.listen((data) {
// //       setState(() {
// //         print("data: results ${data.results}");
// //         print("data: error ${data.error}");
// //         text =
// //             data.results.map((e) => e.alternatives.first.transcript).join('\n');
// //         recognizeFinished = true;
// //       });
// //     }, onDone: () {
// //       setState(() {
// //         recognizing = false;
// //       });
// //     });
// //   }
// //
// //   RecognitionConfig _getConfig() => RecognitionConfig(
// //       encoding: AudioEncoding.LINEAR16,
// //       model: RecognitionModel.basic,
// //       enableAutomaticPunctuation: true,
// //       sampleRateHertz: 16000,
// //       languageCode: 'th-TH');
// //
// //   Future<void> _copyFileFromAssets(String name) async {
// //     var data = await rootBundle.load('assets/$name');
// //     final directory = await getApplicationDocumentsDirectory();
// //     final path = directory.path + '/$name';
// //     await File(path).writeAsBytes(
// //         data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes));
// //   }
// //
// //   Future<List<int>> _getAudioContent(String name) async {
// //     final directory = await getApplicationDocumentsDirectory();
// //     final path = directory.path + '/$name';
// //     if (!File(path).existsSync()) {
// //       await _copyFileFromAssets(name);
// //     }
// //     return File(path).readAsBytesSync().toList();
// //   }
// //
// //   Future<Stream<List<int>>> _getAudioStream(String name) async {
// //     final directory = await getApplicationDocumentsDirectory();
// //     final path = directory.path + '/$name';
// //     if (!File(path).existsSync()) {
// //       await _copyFileFromAssets(name);
// //     }
// //     return File(path).openRead();
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       home: Scaffold(
// //         appBar: AppBar(
// //           title: const Text('Plugin example app'),
// //         ),
// //         body: Column(
// //           children: [
// //             Row(
// //               mainAxisAlignment: MainAxisAlignment.spaceAround,
// //               children: [
// //                 IconButton(
// //                   iconSize: 96.0,
// //                   icon: Icon(_isRecording ? Icons.mic_off : Icons.mic),
// //                   onPressed: _isRecording ? _recorder.stop : _recorder.start,
// //                 ),
// //               ],
// //             ),
// //             Text(text)
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
