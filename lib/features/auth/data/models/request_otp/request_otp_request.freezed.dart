// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'request_otp_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RequestOtpRequest {
  String get phoneNumber => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RequestOtpRequestCopyWith<RequestOtpRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestOtpRequestCopyWith<$Res> {
  factory $RequestOtpRequestCopyWith(
          RequestOtpRequest value, $Res Function(RequestOtpRequest) then) =
      _$RequestOtpRequestCopyWithImpl<$Res, RequestOtpRequest>;
  @useResult
  $Res call({String phoneNumber});
}

/// @nodoc
class _$RequestOtpRequestCopyWithImpl<$Res, $Val extends RequestOtpRequest>
    implements $RequestOtpRequestCopyWith<$Res> {
  _$RequestOtpRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneNumber = null,
  }) {
    return _then(_value.copyWith(
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RequestOtpRequestCopyWith<$Res>
    implements $RequestOtpRequestCopyWith<$Res> {
  factory _$$_RequestOtpRequestCopyWith(_$_RequestOtpRequest value,
          $Res Function(_$_RequestOtpRequest) then) =
      __$$_RequestOtpRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String phoneNumber});
}

/// @nodoc
class __$$_RequestOtpRequestCopyWithImpl<$Res>
    extends _$RequestOtpRequestCopyWithImpl<$Res, _$_RequestOtpRequest>
    implements _$$_RequestOtpRequestCopyWith<$Res> {
  __$$_RequestOtpRequestCopyWithImpl(
      _$_RequestOtpRequest _value, $Res Function(_$_RequestOtpRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneNumber = null,
  }) {
    return _then(_$_RequestOtpRequest(
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_RequestOtpRequest implements _RequestOtpRequest {
  _$_RequestOtpRequest({required this.phoneNumber});

  @override
  final String phoneNumber;

  @override
  String toString() {
    return 'RequestOtpRequest(phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RequestOtpRequest &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber));
  }

  @override
  int get hashCode => Object.hash(runtimeType, phoneNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RequestOtpRequestCopyWith<_$_RequestOtpRequest> get copyWith =>
      __$$_RequestOtpRequestCopyWithImpl<_$_RequestOtpRequest>(
          this, _$identity);
}

abstract class _RequestOtpRequest implements RequestOtpRequest {
  factory _RequestOtpRequest({required final String phoneNumber}) =
      _$_RequestOtpRequest;

  @override
  String get phoneNumber;
  @override
  @JsonKey(ignore: true)
  _$$_RequestOtpRequestCopyWith<_$_RequestOtpRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
