// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'request_otp_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RequestOtpResponse {
  PhoneAuthCredential? get credential => throw _privateConstructorUsedError;
  String? get verificationId => throw _privateConstructorUsedError;
  int? get resendToken => throw _privateConstructorUsedError;
  FirebaseAuthException? get exception => throw _privateConstructorUsedError;
  bool get isTimeout => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RequestOtpResponseCopyWith<RequestOtpResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestOtpResponseCopyWith<$Res> {
  factory $RequestOtpResponseCopyWith(
          RequestOtpResponse value, $Res Function(RequestOtpResponse) then) =
      _$RequestOtpResponseCopyWithImpl<$Res, RequestOtpResponse>;
  @useResult
  $Res call(
      {PhoneAuthCredential? credential,
      String? verificationId,
      int? resendToken,
      FirebaseAuthException? exception,
      bool isTimeout});
}

/// @nodoc
class _$RequestOtpResponseCopyWithImpl<$Res, $Val extends RequestOtpResponse>
    implements $RequestOtpResponseCopyWith<$Res> {
  _$RequestOtpResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? credential = freezed,
    Object? verificationId = freezed,
    Object? resendToken = freezed,
    Object? exception = freezed,
    Object? isTimeout = null,
  }) {
    return _then(_value.copyWith(
      credential: freezed == credential
          ? _value.credential
          : credential // ignore: cast_nullable_to_non_nullable
              as PhoneAuthCredential?,
      verificationId: freezed == verificationId
          ? _value.verificationId
          : verificationId // ignore: cast_nullable_to_non_nullable
              as String?,
      resendToken: freezed == resendToken
          ? _value.resendToken
          : resendToken // ignore: cast_nullable_to_non_nullable
              as int?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as FirebaseAuthException?,
      isTimeout: null == isTimeout
          ? _value.isTimeout
          : isTimeout // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RequestOtpResponseCopyWith<$Res>
    implements $RequestOtpResponseCopyWith<$Res> {
  factory _$$_RequestOtpResponseCopyWith(_$_RequestOtpResponse value,
          $Res Function(_$_RequestOtpResponse) then) =
      __$$_RequestOtpResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {PhoneAuthCredential? credential,
      String? verificationId,
      int? resendToken,
      FirebaseAuthException? exception,
      bool isTimeout});
}

/// @nodoc
class __$$_RequestOtpResponseCopyWithImpl<$Res>
    extends _$RequestOtpResponseCopyWithImpl<$Res, _$_RequestOtpResponse>
    implements _$$_RequestOtpResponseCopyWith<$Res> {
  __$$_RequestOtpResponseCopyWithImpl(
      _$_RequestOtpResponse _value, $Res Function(_$_RequestOtpResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? credential = freezed,
    Object? verificationId = freezed,
    Object? resendToken = freezed,
    Object? exception = freezed,
    Object? isTimeout = null,
  }) {
    return _then(_$_RequestOtpResponse(
      credential: freezed == credential
          ? _value.credential
          : credential // ignore: cast_nullable_to_non_nullable
              as PhoneAuthCredential?,
      verificationId: freezed == verificationId
          ? _value.verificationId
          : verificationId // ignore: cast_nullable_to_non_nullable
              as String?,
      resendToken: freezed == resendToken
          ? _value.resendToken
          : resendToken // ignore: cast_nullable_to_non_nullable
              as int?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as FirebaseAuthException?,
      isTimeout: null == isTimeout
          ? _value.isTimeout
          : isTimeout // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_RequestOtpResponse implements _RequestOtpResponse {
  _$_RequestOtpResponse(
      {this.credential,
      this.verificationId,
      this.resendToken,
      this.exception,
      this.isTimeout = false});

  @override
  final PhoneAuthCredential? credential;
  @override
  final String? verificationId;
  @override
  final int? resendToken;
  @override
  final FirebaseAuthException? exception;
  @override
  @JsonKey()
  final bool isTimeout;

  @override
  String toString() {
    return 'RequestOtpResponse(credential: $credential, verificationId: $verificationId, resendToken: $resendToken, exception: $exception, isTimeout: $isTimeout)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RequestOtpResponse &&
            (identical(other.credential, credential) ||
                other.credential == credential) &&
            (identical(other.verificationId, verificationId) ||
                other.verificationId == verificationId) &&
            (identical(other.resendToken, resendToken) ||
                other.resendToken == resendToken) &&
            (identical(other.exception, exception) ||
                other.exception == exception) &&
            (identical(other.isTimeout, isTimeout) ||
                other.isTimeout == isTimeout));
  }

  @override
  int get hashCode => Object.hash(runtimeType, credential, verificationId,
      resendToken, exception, isTimeout);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RequestOtpResponseCopyWith<_$_RequestOtpResponse> get copyWith =>
      __$$_RequestOtpResponseCopyWithImpl<_$_RequestOtpResponse>(
          this, _$identity);
}

abstract class _RequestOtpResponse implements RequestOtpResponse {
  factory _RequestOtpResponse(
      {final PhoneAuthCredential? credential,
      final String? verificationId,
      final int? resendToken,
      final FirebaseAuthException? exception,
      final bool isTimeout}) = _$_RequestOtpResponse;

  @override
  PhoneAuthCredential? get credential;
  @override
  String? get verificationId;
  @override
  int? get resendToken;
  @override
  FirebaseAuthException? get exception;
  @override
  bool get isTimeout;
  @override
  @JsonKey(ignore: true)
  _$$_RequestOtpResponseCopyWith<_$_RequestOtpResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
