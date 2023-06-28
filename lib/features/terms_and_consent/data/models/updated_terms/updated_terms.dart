import 'package:freezed_annotation/freezed_annotation.dart';

part 'updated_terms.freezed.dart';

part 'updated_terms.g.dart';

@freezed
class UpdatedTerms with _$UpdatedTerms {
  factory UpdatedTerms({String? termsString}) = _UpdatedTerms;

  factory UpdatedTerms.fromJson(Map<String, dynamic> json) =>
      _$UpdatedTermsFromJson(json);
}
