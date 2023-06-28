import 'package:oic_next_to_you/common/data/services/api_service.dart';
import 'package:oic_next_to_you/features/recording/data/models/record_detail/record_detail_request/record_detail_request.dart';
import 'package:oic_next_to_you/features/recording/data/models/record_detail/record_detail_response/record_detail_response.dart';
import 'package:oic_next_to_you/features/recording/data/models/start_record/request/start_record_request.dart';
import 'package:oic_next_to_you/features/recording/data/models/record_confirm/req_record_confirm.dart';
import 'package:oic_next_to_you/features/recording/data/models/record_confirm/res_record_confirm.dart';
import '../models/start_record/response/start_record_response.dart';

abstract class RecordDatasource {
  Future<StartRecordResponse> setStartRecord(StartRecordRequest request);
  Future<RecordDetailResponse> sendRecordDetail(RecordDetailRequest request);
  Future<resRecordConfirm> setConfirmRecord(reqRecordConfirm request);
}

class RecordDatasourceImpl implements RecordDatasource {
  late ApiService _apiService;

  RecordDatasourceImpl() {
    _apiService = ApiService();
  }

  @override
  Future<StartRecordResponse> setStartRecord(StartRecordRequest request) async {
    try {
      final response = await _apiService.postHttp(
          endpoint: 'record/start', parameters: request.toJson());
      return StartRecordResponse.fromJson(response.data);
    } catch (_) {
      // do nothing
    }
    return StartRecordResponse();
  }

  @override
  Future<RecordDetailResponse> sendRecordDetail(
      RecordDetailRequest request) async {
    try {
      final response = await _apiService.postHttp(
        endpoint: 'record/detail',
        parameters: {
          'sessioN_ID': request.sessionId,
          'raW_TEXT_PHASE': request.rawText,
        },
      );
      return RecordDetailResponse.fromJson(response.data);
    } catch (_) {
      return RecordDetailResponse();
    }
  }

  @override
  Future<resRecordConfirm> setConfirmRecord(reqRecordConfirm request) async {
    try {
      final response = await _apiService.postHttp(
          endpoint: 'record/confirm', parameters: request.toJson());
      return resRecordConfirm.fromJson(response.data);
    } catch (_) {
      // do nothing
    }
    return resRecordConfirm();
  }
}
