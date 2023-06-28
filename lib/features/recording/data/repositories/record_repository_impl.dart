import 'package:oic_next_to_you/common/core/app_response.dart';
import 'package:oic_next_to_you/features/recording/data/datasources/record_datasource.dart';
import 'package:oic_next_to_you/features/recording/data/models/record_detail/record_detail_request/record_detail_request.dart';
import 'package:oic_next_to_you/features/recording/data/models/start_record/request/start_record_request.dart';
import 'package:oic_next_to_you/features/recording/domain/entities/processed_text.dart';
import 'package:oic_next_to_you/features/recording/domain/entities/record_session.dart';
import 'package:oic_next_to_you/features/recording/domain/repositories/record_repository.dart';

class RecordRepositoryImpl implements RecordRepository {
  final RecordDatasource datasource;

  RecordRepositoryImpl({required this.datasource});

  @override
  Future<AppResponse<ProcessedText>> calculateTextRisk(
      String toProcessText, String sessionID) async {
    //TODO: implement properly
    final response = await datasource.sendRecordDetail(
      RecordDetailRequest(
        sessionId: sessionID,
        rawText: toProcessText,
      ),
    );
    final detail = response.details?.first;

    var rule;
    var ListDetail;
    final classNum = detail?.classNum;
    if (classNum != null) {
      rule = ViolatedRule(number: classNum.toString(), description: "");
    }

    final processedText = ProcessedText(
      original: toProcessText,
      processedTime: DateTime.now(),
      riskRatio: (detail?.probability ?? 0).toDouble(),
      violatedRule: rule,
      whichWord: detail?.word,
    );
    return AppResponse(value: processedText, error: null);
  }
}
