import 'package:freezed_annotation/freezed_annotation.dart';
part 'accept_consent_request.g.dart';
part 'accept_consent_request.freezed.dart';

@freezed
class AcceptConsentRequest with _$AcceptConsentRequest{
  factory AcceptConsentRequest({
    @JsonKey(name: "personaL_CODE") String? userId,
    @JsonKey(name: "iS_CONSENT_1") String? oneMeansAccept,
  }) = _AcceptConsentRequest;

  factory AcceptConsentRequest.fromJson(Map<String, dynamic> json) => _$AcceptConsentRequestFromJson(json);
}