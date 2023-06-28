// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'store_user_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StoreUserRequest _$StoreUserRequestFromJson(Map<String, dynamic> json) {
  return _StoreUserRequest.fromJson(json);
}

/// @nodoc
mixin _$StoreUserRequest {
  @JsonKey(name: "phonE_NUMBER")
  String? get phoneNumber => throw _privateConstructorUsedError;
  @JsonKey(name: "personaL_CODE")
  String? get userId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StoreUserRequestCopyWith<StoreUserRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoreUserRequestCopyWith<$Res> {
  factory $StoreUserRequestCopyWith(
          StoreUserRequest value, $Res Function(StoreUserRequest) then) =
      _$StoreUserRequestCopyWithImpl<$Res, StoreUserRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: "phonE_NUMBER") String? phoneNumber,
      @JsonKey(name: "personaL_CODE") String? userId});
}

/// @nodoc
class _$StoreUserRequestCopyWithImpl<$Res, $Val extends StoreUserRequest>
    implements $StoreUserRequestCopyWith<$Res> {
  _$StoreUserRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneNumber = freezed,
    Object? userId = freezed,
  }) {
    return _then(_value.copyWith(
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StoreUserRequestCopyWith<$Res>
    implements $StoreUserRequestCopyWith<$Res> {
  factory _$$_StoreUserRequestCopyWith(
          _$_StoreUserRequest value, $Res Function(_$_StoreUserRequest) then) =
      __$$_StoreUserRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "phonE_NUMBER") String? phoneNumber,
      @JsonKey(name: "personaL_CODE") String? userId});
}

/// @nodoc
class __$$_StoreUserRequestCopyWithImpl<$Res>
    extends _$StoreUserRequestCopyWithImpl<$Res, _$_StoreUserRequest>
    implements _$$_StoreUserRequestCopyWith<$Res> {
  __$$_StoreUserRequestCopyWithImpl(
      _$_StoreUserRequest _value, $Res Function(_$_StoreUserRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneNumber = freezed,
    Object? userId = freezed,
  }) {
    return _then(_$_StoreUserRequest(
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StoreUserRequest implements _StoreUserRequest {
  _$_StoreUserRequest(
      {@JsonKey(name: "phonE_NUMBER") this.phoneNumber,
      @JsonKey(name: "personaL_CODE") this.userId});

  factory _$_StoreUserRequest.fromJson(Map<String, dynamic> json) =>
      _$$_StoreUserRequestFromJson(json);

  @override
  @JsonKey(name: "phonE_NUMBER")
  final String? phoneNumber;
  @override
  @JsonKey(name: "personaL_CODE")
  final String? userId;

  @override
  String toString() {
    return 'StoreUserRequest(phoneNumber: $phoneNumber, userId: $userId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StoreUserRequest &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, phoneNumber, userId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StoreUserRequestCopyWith<_$_StoreUserRequest> get copyWith =>
      __$$_StoreUserRequestCopyWithImpl<_$_StoreUserRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StoreUserRequestToJson(
      this,
    );
  }
}

abstract class _StoreUserRequest implements StoreUserRequest {
  factory _StoreUserRequest(
          {@JsonKey(name: "phonE_NUMBER") final String? phoneNumber,
          @JsonKey(name: "personaL_CODE") final String? userId}) =
      _$_StoreUserRequest;

  factory _StoreUserRequest.fromJson(Map<String, dynamic> json) =
      _$_StoreUserRequest.fromJson;

  @override
  @JsonKey(name: "phonE_NUMBER")
  String? get phoneNumber;
  @override
  @JsonKey(name: "personaL_CODE")
  String? get userId;
  @override
  @JsonKey(ignore: true)
  _$$_StoreUserRequestCopyWith<_$_StoreUserRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
