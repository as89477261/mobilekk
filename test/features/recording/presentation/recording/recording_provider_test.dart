import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:oic_next_to_you/features/recording/domain/entities/processed_text.dart';
import 'package:oic_next_to_you/features/recording/domain/usecases/calculate_text_risk.dart';
import 'package:oic_next_to_you/features/recording/domain/usecases/check_agent_information.dart';
import 'package:oic_next_to_you/features/recording/domain/usecases/finish_recording.dart';
import 'package:oic_next_to_you/features/recording/domain/usecases/start_recording.dart';
import 'package:oic_next_to_you/features/recording/presentation/recording/recording_provider.dart';

import '../../../../utils/random_value.dart';
import 'recording_provider_test.mocks.dart';

@GenerateMocks([CalculateTextRisk])
void main() {
  late MockCalculateTextRisk calculateTextRisk;
  late RecordingProvider provider;

  setUp(() {
    calculateTextRisk = MockCalculateTextRisk();
    provider = RecordingProvider(
        startRecording: StartRecording(),
        calculateTextRisk: calculateTextRisk,
        checkAgentInformation: CheckAgentInformation(),
        finishRecording: FinishRecording());
  });

  group('calculateRisk', () {
    test('should call calculateTextRisk with correct text', () async {
      // arrange
      final spokenText = getRandomString(100);
      provider = RecordingProvider(
          startRecording: StartRecording(),
          calculateTextRisk: calculateTextRisk,
          checkAgentInformation: CheckAgentInformation(),
          finishRecording: FinishRecording(),
          initDatastore: RecordingDataStore(allSpokenText: spokenText));

      when(calculateTextRisk(any, ""))
          .thenAnswer((_) => Future.value(ProcessedText(
                original: getRandomString(10),
                processedTime: DateTime.now(),
                riskRatio: 0,
                violatedRule: null,
                whichWord: getRandomString(20),
              )));

      final input = getRandomString(100);
      // act
      await provider.calculateRisk(spokenText + input, "");

      // assert
      verify(calculateTextRisk(input, ""));
    });

    test(
        'should concat output from usecases with the previous list and notify listeners',
        () async {
      // arrange
      final previousProcessedTexts = List.generate(
          Random().nextInt(10),
          (index) => ProcessedText(
                original: getRandomString(20),
                processedTime: DateTime.now(),
                riskRatio: Random().nextDouble(),
                violatedRule: null,
                whichWord: getRandomString(20),
              )).toList();

      provider = RecordingProvider(
          initState: RecordingUiState(processedTexts: previousProcessedTexts),
          startRecording: StartRecording(),
          calculateTextRisk: calculateTextRisk,
          checkAgentInformation: CheckAgentInformation(),
          finishRecording: FinishRecording());

      final processedOutput = ProcessedText(
        original: getRandomString(10),
        processedTime: DateTime.now(),
        riskRatio: Random().nextDouble(),
        violatedRule: ViolatedRule(
          number: getRandomString(3),
          description: getRandomString(20),
        ),
        whichWord: getRandomString(20),
      );
      when(calculateTextRisk(any, "")).thenAnswer((_) async => processedOutput);

      var receivedStates = <RecordingUiState>[];
      provider.addListener(() {
        receivedStates.add(provider.state);
      });

      // act
      await provider.calculateRisk(getRandomString(100), "");

      // assert
      // processed text should be trigger once and add the new one to the end
      expect(receivedStates.length, 1);
      final processedTexts = receivedStates.last.processedTexts;
      expect(processedTexts.length, previousProcessedTexts.length + 1);
      expect(processedTexts.last, processedOutput);
      for (var i = 0; i < previousProcessedTexts.length; i++) {
        expect(processedTexts[i], previousProcessedTexts[i]);
      }
    });
  });

  group('updateText', () {
    test('should update toProcessText with new Text and concat it to dataStore',
        () async {
      // arrange
      final spokenText = getRandomString(34);
      final output = ProcessedText(
        original: getRandomString(20),
        processedTime: DateTime.now(),
        riskRatio: 1,
        violatedRule: null,
        whichWord: getRandomString(20),
      );
      final processedText =
          List.generate(Random().nextInt(10), (index) => output);

      provider = RecordingProvider(
          startRecording: StartRecording(),
          calculateTextRisk: calculateTextRisk,
          checkAgentInformation: CheckAgentInformation(),
          finishRecording: FinishRecording(),
          initDatastore: RecordingDataStore(allSpokenText: spokenText),
          initState: RecordingUiState(
            processedTexts: processedText.toList(),
          ));

      var storedData = <RecordingDataStore>[];
      var storedUiState = <RecordingUiState>[];

      provider.addListener(() {
        storedData.add(provider.dataStore);
        storedUiState.add(provider.state);
      });

      // act
      final toUpdateText = getRandomString(100);
      //await provider.updateText(toUpdateText);

      // assert
      expect(
          storedUiState.last,
          RecordingUiState(
            toProcessText: toUpdateText.substring(spokenText.length),
            processedTexts: processedText,
          ));
      expect(storedData.last, RecordingDataStore(allSpokenText: toUpdateText));
    });
  });
}
