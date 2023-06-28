import 'package:oic_next_to_you/features/recording/domain/repositories/record_repository.dart';

import '../entities/processed_text.dart';

class CalculateTextRisk {
  final RecordRepository repository;

  CalculateTextRisk({required this.repository});

  Future<ProcessedText> call(String toProcessText, String sessionID) async {
    //TODO: implement properly
    final response =
        await repository.calculateTextRisk(toProcessText, sessionID);
    final value = response.value;
    if (value != null) {
      return value;
    } else {
      return ProcessedText(
        original: toProcessText,
        processedTime: DateTime.now(),
        riskRatio: 0,
        violatedRule: null,
        whichWord: null,
      );
    }
  }
}
