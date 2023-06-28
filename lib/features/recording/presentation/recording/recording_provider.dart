import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:oic_next_to_you/common/core/google_voice_recorder_impl.dart';
import 'package:oic_next_to_you/common/core/speech_to_text.dart';
import 'package:oic_next_to_you/features/recording/domain/entities/record_session.dart';
import 'package:oic_next_to_you/features/recording/domain/usecases/calculate_text_risk.dart';
import 'package:oic_next_to_you/features/recording/domain/usecases/check_agent_information.dart';
import 'package:oic_next_to_you/features/recording/domain/usecases/finish_recording.dart';
import 'package:oic_next_to_you/features/recording/data/datasources/record_datasource.dart';
import 'package:oic_next_to_you/features/recording/data/models/record_detail/record_detail_request/record_detail_request.dart';
import 'package:oic_next_to_you/features/recording/data/models/start_record/request/start_record_request.dart';
import 'package:oic_next_to_you/features/recording/data/models/record_confirm/req_record_confirm.dart';
import 'package:speech_to_text/speech_to_text.dart';

import '../../domain/entities/processed_text.dart';
import '../../domain/usecases/start_recording.dart';

part 'recording_provider.freezed.dart';

class RecordingProvider with ChangeNotifier {
  RecordingUiState _state;

  RecordingUiState get state => _state;

  RecordingDataStore _dataStore;

  RecordingDataStore get dataStore => _dataStore;

  final StartRecording startRecording;
  final CalculateTextRisk calculateTextRisk;
  final CheckAgentInformation checkAgentInformation;
  final FinishRecording finishRecording;
  final VoiceRecorder _recorder = GoogleVoiceRecorderImpl();
  //final VoiceRecorder _recorder = VoiceRecorderImpl(SpeechToText());

  Timer? _timer;
  Timer? _timerCheckWord;
  Timer? _timerReCheckWord;
  late String fullConversation = "";
  late int riskCount = 0;
  late String isFruad = "0";

  late int waitCount = 0;
  late int sameWordCount = 0;

  late int bufferTextLength = 0;
  late String bufferText = "";
  late String bufferRecheckText = "";

  late int previousVoiceTextLength = 0;
  late String previousVoiceText = "";

  RecordingProvider({
    RecordingUiState? initState,
    RecordingDataStore? initDatastore,
    required this.startRecording,
    required this.calculateTextRisk,
    required this.checkAgentInformation,
    required this.finishRecording,
  })  : _state = initState ?? RecordingUiState(),
        _dataStore = initDatastore ?? RecordingDataStore();

  void _onRecorderSilenceStop() {
    // print('onSilenceStop: ${_recorder.isListening}');

    _state = _state.copyWith(
      isRecording: _recorder.isListening,
    );
    notifyListeners();
  }

  Future initialStartRecord(String sessionID, String personalCode) async {
    riskCount = 0;
    isFruad = "0";
    await RecordDatasourceImpl().setStartRecord(StartRecordRequest(
        createdBy: 'Mobile', sessionId: sessionID, userId: personalCode));
    _state = _state.copyWith(isRecording: false);
    notifyListeners();
  }

  Future initialStopRecord(reqRecordConfirm obj) async {
    await RecordDatasourceImpl().setConfirmRecord(obj);

    _state = _state.copyWith(isRecording: false);
    notifyListeners();
  }

  Future startRecord(String sessionID) async {
    String textData = "";
    _timer?.cancel();

    await _recorder.recordVoiceToString(
      // locale: "th"
      locale: "th_TH",
      onResult: (result) {
        final value = result.value ?? '';
        if (value.trim().isNotEmpty) {
          updateText(value);
        }
      },
      onSilenceStop: _onRecorderSilenceStop,
    );

    // _timerCheckWord = Timer.periodic(const Duration(seconds: 1), (timer) {
    //   if (previousVoiceTextLength > 0 &&
    //       CheckBySeparate(bufferText, previousVoiceText)) {
    //     if (previousVoiceText.contains(bufferText) == true) {
    //       bufferText = previousVoiceText;
    //       bufferTextLength = previousVoiceText.length;
    //     } else {
    //       bufferText += previousVoiceText;
    //       bufferTextLength = bufferTextLength + previousVoiceTextLength;
    //     }

    //     previousVoiceText = "";
    //     previousVoiceTextLength = 0;

    //     _dataStore = _dataStore.copyWith(allSpokenText: bufferText);
    //     _state = _state.copyWith(toProcessText: bufferText);

    //     notifyListeners();
    //   }
    // });

    _timer = Timer.periodic(const Duration(seconds: 7), (timer) {
      //waitCount += 1;

      final toCalculate = _state.toProcessText;
      if (toCalculate.isNotEmpty) {
        calculateRisk(toCalculate, sessionID);
      }
      // bufferText = "";
      // bufferTextLength = 0;
      // _dataStore = _dataStore.copyWith(allSpokenText: "");
      // _state = _state.copyWith(toProcessText: "");
    });

    _state = _state.copyWith(isRecording: true);
    notifyListeners();
  }

  bool CheckBySeparate(String a, String b) {
    var oldText = a.trim().replaceAll(" ", "");
    var newText = b.trim().replaceAll(" ", "");

    if (oldText != "") {
      var oldLength = oldText.length;
      var oldRound = (oldLength / 3).round();
      var resultCount = 0;
      for (var i = 0; i < oldRound; i++) {
        var buffContain = oldText.substring(i * 3,
            ((i * 3) + 3) > oldText.length ? oldText.length : ((i * 3) + 3));
        var resultCheck = newText.contains(buffContain);
        if (resultCheck) {
          resultCount += 1;
        }
      }
      var result = (((resultCount / oldRound).round()) * 100) > 90;
      return result;
    } else {
      return true;
    }
  }

  Future stopRecord(reqRecordConfirm obj) async {
    _timer?.cancel();
    _timer = null;
    obj.iSFRUAD = isFruad;
    obj.risKCOUNT = riskCount;
    obj.raWTEXTRECORD = fullConversation;
    obj.detecteDTEXTRECORD = fullConversation;
    obj.latitude = "RECORD";

    initialStopRecord(obj);

    _recorder.stopRecord();
    _state = _state.copyWith(isRecording: false);
    notifyListeners();
  }

  void updateText(String spokenText) {
    if (spokenText.trim().isNotEmpty) {
      var toProcessText = spokenText;
      try {
        final processedText =
            _state.processedTexts.map((e) => e.original).join();
        final prevTextLength = processedText.length;
        toProcessText = prevTextLength == 0
            ? spokenText
            : spokenText.substring(prevTextLength);
      } catch (_) {}
      _dataStore = _dataStore.copyWith(allSpokenText: spokenText);
      _state = _state.copyWith(toProcessText: toProcessText);
      notifyListeners();
    }
    waitCount = 0;
  }

  Future calculateRisk(String textToCalculate, String sessionID) async {
    fullConversation += textToCalculate;

    _state = _state.copyWith(toProcessText: '');
    final processedText = await calculateTextRisk(textToCalculate, sessionID);

    var newProcessTexts = [processedText] + _state.processedTexts;
    _state = _state.copyWith(processedTexts: newProcessTexts);
    notifyListeners();
  }

  Future checkAgentInfo(String agentId) async {}
}

@freezed
class RecordingUiState with _$RecordingUiState {
  factory RecordingUiState({
    @Default('') String toProcessText,
    @Default([]) List<ProcessedText> processedTexts,
    @Default(false) bool isRecording,
    @Default(null) String? errorMessage,
  }) = $RecordingUiState;
}

@freezed
class RecordingDataStore with _$RecordingDataStore {
  factory RecordingDataStore({
    @Default(null) RecordSession? currentSession,
    @Default('') String allSpokenText,
  }) = $RecordingDataStore;
}
