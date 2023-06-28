import 'package:freezed_annotation/freezed_annotation.dart';

part 'start_record_request.g.dart';
part 'start_record_request.freezed.dart';

@freezed
class StartRecordRequest with _$StartRecordRequest {
  factory StartRecordRequest({
    @JsonKey(name: "creatE_BY") required String createdBy,
    @JsonKey(name: "sessioN_ID") required String sessionId,
    @JsonKey(name: "personaL_CODE") required String userId,
  }) = _StartRecordRequest;
  factory StartRecordRequest.fromJson(Map<String, dynamic> json) => _$StartRecordRequestFromJson(json);
}