import 'package:freezed_annotation/freezed_annotation.dart';
part 'store_user_request.freezed.dart';
part 'store_user_request.g.dart';

@freezed
class StoreUserRequest with _$StoreUserRequest{
  factory StoreUserRequest({
    @JsonKey(name: "phonE_NUMBER") String? phoneNumber,
    @JsonKey(name: "personaL_CODE") String? userId,
  }) = _StoreUserRequest;

  factory StoreUserRequest.fromJson(Map<String, dynamic> json) => _$StoreUserRequestFromJson(json);
}