import 'package:oic_next_to_you/common/core/app_response.dart';
import 'package:oic_next_to_you/features/recording/domain/entities/processed_text.dart';
import 'package:oic_next_to_you/features/recording/domain/entities/record_session.dart';

abstract class RecordRepository {
  Future<AppResponse<ProcessedText>> calculateTextRisk(
      String toProcessText, String sessionID);
}
