
import 'package:freezed_annotation/freezed_annotation.dart';

part 'updated_consent.freezed.dart';

part 'updated_consent.g.dart';

@freezed
class UpdatedConsent with _$UpdatedConsent {
  factory UpdatedConsent({String? consentString}) = _UpdatedConsent;

  factory UpdatedConsent.fromJson(Map<String, dynamic> json) =>
      _$UpdatedConsentFromJson(json);
}