// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'updated_terms.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UpdatedTerms _$UpdatedTermsFromJson(Map<String, dynamic> json) {
  return _UpdatedTerms.fromJson(json);
}

/// @nodoc
mixin _$UpdatedTerms {
  String? get termsString => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UpdatedTermsCopyWith<UpdatedTerms> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdatedTermsCopyWith<$Res> {
  factory $UpdatedTermsCopyWith(
          UpdatedTerms value, $Res Function(UpdatedTerms) then) =
      _$UpdatedTermsCopyWithImpl<$Res, UpdatedTerms>;
  @useResult
  $Res call({String? termsString});
}

/// @nodoc
class _$UpdatedTermsCopyWithImpl<$Res, $Val extends UpdatedTerms>
    implements $UpdatedTermsCopyWith<$Res> {
  _$UpdatedTermsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? termsString = freezed,
  }) {
    return _then(_value.copyWith(
      termsString: freezed == termsString
          ? _value.termsString
          : termsString // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UpdatedTermsCopyWith<$Res>
    implements $UpdatedTermsCopyWith<$Res> {
  factory _$$_UpdatedTermsCopyWith(
          _$_UpdatedTerms value, $Res Function(_$_UpdatedTerms) then) =
      __$$_UpdatedTermsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? termsString});
}

/// @nodoc
class __$$_UpdatedTermsCopyWithImpl<$Res>
    extends _$UpdatedTermsCopyWithImpl<$Res, _$_UpdatedTerms>
    implements _$$_UpdatedTermsCopyWith<$Res> {
  __$$_UpdatedTermsCopyWithImpl(
      _$_UpdatedTerms _value, $Res Function(_$_UpdatedTerms) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? termsString = freezed,
  }) {
    return _then(_$_UpdatedTerms(
      termsString: freezed == termsString
          ? _value.termsString
          : termsString // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UpdatedTerms implements _UpdatedTerms {
  _$_UpdatedTerms({this.termsString});

  factory _$_UpdatedTerms.fromJson(Map<String, dynamic> json) =>
      _$$_UpdatedTermsFromJson(json);

  @override
  final String? termsString;

  @override
  String toString() {
    return 'UpdatedTerms(termsString: $termsString)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdatedTerms &&
            (identical(other.termsString, termsString) ||
                other.termsString == termsString));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, termsString);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UpdatedTermsCopyWith<_$_UpdatedTerms> get copyWith =>
      __$$_UpdatedTermsCopyWithImpl<_$_UpdatedTerms>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UpdatedTermsToJson(
      this,
    );
  }
}

abstract class _UpdatedTerms implements UpdatedTerms {
  factory _UpdatedTerms({final String? termsString}) = _$_UpdatedTerms;

  factory _UpdatedTerms.fromJson(Map<String, dynamic> json) =
      _$_UpdatedTerms.fromJson;

  @override
  String? get termsString;
  @override
  @JsonKey(ignore: true)
  _$$_UpdatedTermsCopyWith<_$_UpdatedTerms> get copyWith =>
      throw _privateConstructorUsedError;
}
