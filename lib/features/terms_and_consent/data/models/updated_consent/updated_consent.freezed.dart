// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'updated_consent.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UpdatedConsent _$UpdatedConsentFromJson(Map<String, dynamic> json) {
  return _UpdatedConsent.fromJson(json);
}

/// @nodoc
mixin _$UpdatedConsent {
  String? get consentString => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UpdatedConsentCopyWith<UpdatedConsent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdatedConsentCopyWith<$Res> {
  factory $UpdatedConsentCopyWith(
          UpdatedConsent value, $Res Function(UpdatedConsent) then) =
      _$UpdatedConsentCopyWithImpl<$Res, UpdatedConsent>;
  @useResult
  $Res call({String? consentString});
}

/// @nodoc
class _$UpdatedConsentCopyWithImpl<$Res, $Val extends UpdatedConsent>
    implements $UpdatedConsentCopyWith<$Res> {
  _$UpdatedConsentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? consentString = freezed,
  }) {
    return _then(_value.copyWith(
      consentString: freezed == consentString
          ? _value.consentString
          : consentString // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UpdatedConsentCopyWith<$Res>
    implements $UpdatedConsentCopyWith<$Res> {
  factory _$$_UpdatedConsentCopyWith(
          _$_UpdatedConsent value, $Res Function(_$_UpdatedConsent) then) =
      __$$_UpdatedConsentCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? consentString});
}

/// @nodoc
class __$$_UpdatedConsentCopyWithImpl<$Res>
    extends _$UpdatedConsentCopyWithImpl<$Res, _$_UpdatedConsent>
    implements _$$_UpdatedConsentCopyWith<$Res> {
  __$$_UpdatedConsentCopyWithImpl(
      _$_UpdatedConsent _value, $Res Function(_$_UpdatedConsent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? consentString = freezed,
  }) {
    return _then(_$_UpdatedConsent(
      consentString: freezed == consentString
          ? _value.consentString
          : consentString // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UpdatedConsent implements _UpdatedConsent {
  _$_UpdatedConsent({this.consentString});

  factory _$_UpdatedConsent.fromJson(Map<String, dynamic> json) =>
      _$$_UpdatedConsentFromJson(json);

  @override
  final String? consentString;

  @override
  String toString() {
    return 'UpdatedConsent(consentString: $consentString)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdatedConsent &&
            (identical(other.consentString, consentString) ||
                other.consentString == consentString));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, consentString);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UpdatedConsentCopyWith<_$_UpdatedConsent> get copyWith =>
      __$$_UpdatedConsentCopyWithImpl<_$_UpdatedConsent>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UpdatedConsentToJson(
      this,
    );
  }
}

abstract class _UpdatedConsent implements UpdatedConsent {
  factory _UpdatedConsent({final String? consentString}) = _$_UpdatedConsent;

  factory _UpdatedConsent.fromJson(Map<String, dynamic> json) =
      _$_UpdatedConsent.fromJson;

  @override
  String? get consentString;
  @override
  @JsonKey(ignore: true)
  _$$_UpdatedConsentCopyWith<_$_UpdatedConsent> get copyWith =>
      throw _privateConstructorUsedError;
}
