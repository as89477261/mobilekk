import 'package:oic_next_to_you/features/message/data/message_datasource.dart';
import 'package:oic_next_to_you/features/detail/models/res_detail_model.dart';
import 'package:oic_next_to_you/features/recording/data/models/record_detail/record_detail_request/record_detail_request.dart';
import 'package:oic_next_to_you/features/recording/data/models/record_detail/record_detail_response/record_detail_response.dart';
import 'package:oic_next_to_you/features/recording/data/models/start_record/request/start_record_request.dart';
import 'package:oic_next_to_you/features/recording/data/models/record_confirm/req_record_confirm.dart';
import 'package:oic_next_to_you/features/recording/data/models/record_confirm/res_record_confirm.dart';
import 'package:oic_next_to_you/common/utility/extension.dart';
import 'dart:convert';
import 'dart:core';

class MessageProvider {
  Future<List<resDetail>> getPersonalDetailRecordHistory(
      String sessionID) async {
    var response =
        await MessageDatasource().getPersonalDetailRecordHistory(sessionID);
    return response;
  }

  Future<List<RecordDetailResponse>> GetResultText(
      String text, String personalID, String sessionID) async {
    var lstResult = List<RecordDetailResponse>.filled(0, RecordDetailResponse(),
        growable: true);

    var lstText = GenerateTextList(text);
    var riskCount = 0;

    //GenerateRecordHeader(sessionID, personalID);
    for (var txt in lstText) {
      var result = await GenerateRecordDetail(sessionID, txt);
      if (result.oneMeansRisk != 0) {
        riskCount += 1;
      }
      lstResult.add(result);
    }

    //GenerateRecordConfirm(sessionID, personalID, text, riskCount);

    return lstResult;
  }

  List<String> GenerateTextList(String fullText) {
    LineSplitter ls = LineSplitter();
    List<String> _masForUsing = ls.convert(fullText);
    return _masForUsing;
  }

  void GenerateRecordHeader(String sessionID, String personalID) {
    var obj = StartRecordRequest(
      createdBy: "Mobile",
      sessionId: sessionID,
      userId: personalID,
    );
    MessageDatasource().setStartRecord(obj);
  }

  Future<RecordDetailResponse> GenerateRecordDetail(
      String sessionID, String rawText) {
    var obj = RecordDetailRequest(rawText: rawText, sessionId: sessionID);
    var result = MessageDatasource().sendRecordDetail(obj);
    return result;
  }

  void GenerateRecordConfirm(
      String sessionID, String personalID, String fulltext, int riskCount) {
    var obj = reqRecordConfirm();
    obj.iSFRUAD = "0";
    obj.risKCOUNT = riskCount;
    obj.raWTEXTRECORD = fulltext;
    obj.detecteDTEXTRECORD = fulltext;
    obj.latitude = "MESSAGE";

    MessageDatasource().setConfirmRecord(obj);
  }
}
