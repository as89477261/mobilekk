// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'consent.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Consent {
  String get consent => throw _privateConstructorUsedError;
  bool get isAllowed => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ConsentCopyWith<Consent> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConsentCopyWith<$Res> {
  factory $ConsentCopyWith(Consent value, $Res Function(Consent) then) =
      _$ConsentCopyWithImpl<$Res, Consent>;
  @useResult
  $Res call({String consent, bool isAllowed});
}

/// @nodoc
class _$ConsentCopyWithImpl<$Res, $Val extends Consent>
    implements $ConsentCopyWith<$Res> {
  _$ConsentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? consent = null,
    Object? isAllowed = null,
  }) {
    return _then(_value.copyWith(
      consent: null == consent
          ? _value.consent
          : consent // ignore: cast_nullable_to_non_nullable
              as String,
      isAllowed: null == isAllowed
          ? _value.isAllowed
          : isAllowed // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ConsentCopyWith<$Res> implements $ConsentCopyWith<$Res> {
  factory _$$_ConsentCopyWith(
          _$_Consent value, $Res Function(_$_Consent) then) =
      __$$_ConsentCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String consent, bool isAllowed});
}

/// @nodoc
class __$$_ConsentCopyWithImpl<$Res>
    extends _$ConsentCopyWithImpl<$Res, _$_Consent>
    implements _$$_ConsentCopyWith<$Res> {
  __$$_ConsentCopyWithImpl(_$_Consent _value, $Res Function(_$_Consent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? consent = null,
    Object? isAllowed = null,
  }) {
    return _then(_$_Consent(
      consent: null == consent
          ? _value.consent
          : consent // ignore: cast_nullable_to_non_nullable
              as String,
      isAllowed: null == isAllowed
          ? _value.isAllowed
          : isAllowed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_Consent implements _Consent {
  _$_Consent({required this.consent, required this.isAllowed});

  @override
  final String consent;
  @override
  final bool isAllowed;

  @override
  String toString() {
    return 'Consent(consent: $consent, isAllowed: $isAllowed)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Consent &&
            (identical(other.consent, consent) || other.consent == consent) &&
            (identical(other.isAllowed, isAllowed) ||
                other.isAllowed == isAllowed));
  }

  @override
  int get hashCode => Object.hash(runtimeType, consent, isAllowed);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ConsentCopyWith<_$_Consent> get copyWith =>
      __$$_ConsentCopyWithImpl<_$_Consent>(this, _$identity);
}

abstract class _Consent implements Consent {
  factory _Consent(
      {required final String consent,
      required final bool isAllowed}) = _$_Consent;

  @override
  String get consent;
  @override
  bool get isAllowed;
  @override
  @JsonKey(ignore: true)
  _$$_ConsentCopyWith<_$_Consent> get copyWith =>
      throw _privateConstructorUsedError;
}
