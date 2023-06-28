import 'dart:core';
import 'package:oic_next_to_you/common/data/services/api_service.dart';
import 'package:oic_next_to_you/features/detail/models/res_detail_model.dart';
import 'package:oic_next_to_you/common/data/models/genericResponse.dart';

import 'package:oic_next_to_you/features/recording/data/models/record_detail/record_detail_request/record_detail_request.dart';
import 'package:oic_next_to_you/features/recording/data/models/record_detail/record_detail_response/record_detail_response.dart';
import 'package:oic_next_to_you/features/recording/data/models/start_record/request/start_record_request.dart';
import 'package:oic_next_to_you/features/recording/data/models/record_confirm/req_record_confirm.dart';
import 'package:oic_next_to_you/features/recording/data/models/record_confirm/res_record_confirm.dart';

import 'package:oic_next_to_you/features/recording/data/models/start_record/response/start_record_response.dart';

class MessageDatasource {
  late ApiService _apiService;

  MessageDatasource() {
    _apiService = new ApiService();
  }

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

  Future<List<resDetail>> getPersonalDetailRecordHistory(
      String sessionID) async {
    try {
      List<resDetail> result = [];

      await _apiService
          .getHttp(endpoint: 'record/history/detail/' + sessionID)
          .then((responseData) {
        var buffer = GenericResponse.fromJson(responseData.data);
        if (buffer.resulTSTATUS == "OK" &&
            buffer.resulTOBJ.toString() != "" &&
            buffer.resulTOBJ.toString() != "[]") {
          result = resDetail.fromJsonToList(buffer.resulTOBJ!);
          return result;
        } else {
          return [];
        }
      });

      return result;
    } catch (_) {
      throw _;
    }
  }
}
