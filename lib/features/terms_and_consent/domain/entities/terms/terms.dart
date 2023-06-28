import 'package:freezed_annotation/freezed_annotation.dart';
part 'terms.freezed.dart';

@freezed
class Terms with _$Terms {
  factory Terms({required String terms})
  = _Terms;
}