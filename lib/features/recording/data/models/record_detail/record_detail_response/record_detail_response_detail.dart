import 'package:freezed_annotation/freezed_annotation.dart';

part 'record_detail_response_detail.g.dart';
part 'record_detail_response_detail.freezed.dart';

@freezed
class RecordDetailResponseDetail with _$RecordDetailResponseDetail {
  factory RecordDetailResponseDetail({
    @JsonKey(name: "whichClass") num? classNum,
    @JsonKey(name: "probability") num? probability,
    @JsonKey(name: "whichWord") String? word,
  }) =
  _RecordDetailResponseDetail;

  factory RecordDetailResponseDetail.fromJson(Map<String, dynamic> json) =>
      _$RecordDetailResponseDetailFromJson(json);
}