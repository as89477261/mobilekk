import 'package:freezed_annotation/freezed_annotation.dart';

part 'record_detail_request.g.dart';
part 'record_detail_request.freezed.dart';

@freezed
class RecordDetailRequest with _$RecordDetailRequest {
  factory RecordDetailRequest(
          {@JsonKey(name: "sessioN_ID") required String sessionId,
          @JsonKey(name: "raW_TEXT_PHASE") required String rawText}) =
      _RecordDetailRequest;

  factory RecordDetailRequest.fromJson(Map<String, dynamic> json) =>
      _$RecordDetailRequestFromJson(json);
}
