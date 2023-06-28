// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verify_otp_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$VerifyOtpRequest {
  String get verificationCode => throw _privateConstructorUsedError;
  String get otp => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $VerifyOtpRequestCopyWith<VerifyOtpRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerifyOtpRequestCopyWith<$Res> {
  factory $VerifyOtpRequestCopyWith(
          VerifyOtpRequest value, $Res Function(VerifyOtpRequest) then) =
      _$VerifyOtpRequestCopyWithImpl<$Res, VerifyOtpRequest>;
  @useResult
  $Res call({String verificationCode, String otp});
}

/// @nodoc
class _$VerifyOtpRequestCopyWithImpl<$Res, $Val extends VerifyOtpRequest>
    implements $VerifyOtpRequestCopyWith<$Res> {
  _$VerifyOtpRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? verificationCode = null,
    Object? otp = null,
  }) {
    return _then(_value.copyWith(
      verificationCode: null == verificationCode
          ? _value.verificationCode
          : verificationCode // ignore: cast_nullable_to_non_nullable
              as String,
      otp: null == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_VerifyOtpRequestCopyWith<$Res>
    implements $VerifyOtpRequestCopyWith<$Res> {
  factory _$$_VerifyOtpRequestCopyWith(
          _$_VerifyOtpRequest value, $Res Function(_$_VerifyOtpRequest) then) =
      __$$_VerifyOtpRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String verificationCode, String otp});
}

/// @nodoc
class __$$_VerifyOtpRequestCopyWithImpl<$Res>
    extends _$VerifyOtpRequestCopyWithImpl<$Res, _$_VerifyOtpRequest>
    implements _$$_VerifyOtpRequestCopyWith<$Res> {
  __$$_VerifyOtpRequestCopyWithImpl(
      _$_VerifyOtpRequest _value, $Res Function(_$_VerifyOtpRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? verificationCode = null,
    Object? otp = null,
  }) {
    return _then(_$_VerifyOtpRequest(
      verificationCode: null == verificationCode
          ? _value.verificationCode
          : verificationCode // ignore: cast_nullable_to_non_nullable
              as String,
      otp: null == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_VerifyOtpRequest implements _VerifyOtpRequest {
  _$_VerifyOtpRequest({required this.verificationCode, required this.otp});

  @override
  final String verificationCode;
  @override
  final String otp;

  @override
  String toString() {
    return 'VerifyOtpRequest(verificationCode: $verificationCode, otp: $otp)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_VerifyOtpRequest &&
            (identical(other.verificationCode, verificationCode) ||
                other.verificationCode == verificationCode) &&
            (identical(other.otp, otp) || other.otp == otp));
  }

  @override
  int get hashCode => Object.hash(runtimeType, verificationCode, otp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_VerifyOtpRequestCopyWith<_$_VerifyOtpRequest> get copyWith =>
      __$$_VerifyOtpRequestCopyWithImpl<_$_VerifyOtpRequest>(this, _$identity);
}

abstract class _VerifyOtpRequest implements VerifyOtpRequest {
  factory _VerifyOtpRequest(
      {required final String verificationCode,
      required final String otp}) = _$_VerifyOtpRequest;

  @override
  String get verificationCode;
  @override
  String get otp;
  @override
  @JsonKey(ignore: true)
  _$$_VerifyOtpRequestCopyWith<_$_VerifyOtpRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
