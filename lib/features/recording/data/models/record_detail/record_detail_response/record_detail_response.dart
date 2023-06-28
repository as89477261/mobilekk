import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

import 'record_detail_response_detail.dart';

part 'record_detail_response.g.dart';
part 'record_detail_response.freezed.dart';

@freezed
class RecordDetailResponse with _$RecordDetailResponse {
  factory RecordDetailResponse({
    @JsonKey(name: "id") String? id,
    @JsonKey(name: "sessioN_ID") String? sessionId,
    @JsonKey(name: "raW_TEXT_PHASE") String? rawText,
    @JsonKey(name: "resulT_TEXT_PHASE") String? resultText,
    @JsonKey(name: "iS_FRUAD") String? oneMeansFraud,
    @JsonKey(name: "risK_LEVEL") String? oneMeansRisk,
    @JsonKey(name: "status") String? status,
    @JsonKey(name: "creatE_DATE") String? createdDate,
    @JsonKey(name: "creatE_BY") String? createdBy,
    @JsonKey(name: "lisT_DETAIL") List<RecordDetailResponseDetail>? details,
  }) = _RecordDetailResponse;

  factory RecordDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$RecordDetailResponseFromJson(json);
}

