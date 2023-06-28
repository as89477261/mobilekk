import 'package:freezed_annotation/freezed_annotation.dart';
part 'generic_response.g.dart';
part 'generic_response.freezed.dart';

@freezed
class GenericResponse with _$GenericResponse{
  factory GenericResponse({
    @JsonKey(name: "resulT_OBJ") String? resultObj,
    @JsonKey(name: "resulT_STATUS") String? resultStatus,
    @JsonKey(name: "resulT_CODE") String? resultCode,
    @JsonKey(name: "resulT_MESSAGE") String? resultMessage,
  }) = _GenericResponse;
  factory GenericResponse.fromJson(Map<String, dynamic> json) => _$GenericResponseFromJson(json);
}