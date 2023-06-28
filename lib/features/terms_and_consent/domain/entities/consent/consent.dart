import 'package:freezed_annotation/freezed_annotation.dart';
part 'consent.freezed.dart';

@freezed
class Consent with _$Consent {
  factory Consent({required String consent, required bool isAllowed}) =
      _Consent;
}
