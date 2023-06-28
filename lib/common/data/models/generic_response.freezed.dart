// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'generic_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GenericResponse _$GenericResponseFromJson(Map<String, dynamic> json) {
  return _GenericResponse.fromJson(json);
}

/// @nodoc
mixin _$GenericResponse {
  @JsonKey(name: "resulT_OBJ")
  String? get resultObj => throw _privateConstructorUsedError;
  @JsonKey(name: "resulT_STATUS")
  String? get resultStatus => throw _privateConstructorUsedError;
  @JsonKey(name: "resulT_CODE")
  String? get resultCode => throw _privateConstructorUsedError;
  @JsonKey(name: "resulT_MESSAGE")
  String? get resultMessage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GenericResponseCopyWith<GenericResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenericResponseCopyWith<$Res> {
  factory $GenericResponseCopyWith(
          GenericResponse value, $Res Function(GenericResponse) then) =
      _$GenericResponseCopyWithImpl<$Res, GenericResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: "resulT_OBJ") String? resultObj,
      @JsonKey(name: "resulT_STATUS") String? resultStatus,
      @JsonKey(name: "resulT_CODE") String? resultCode,
      @JsonKey(name: "resulT_MESSAGE") String? resultMessage});
}

/// @nodoc
class _$GenericResponseCopyWithImpl<$Res, $Val extends GenericResponse>
    implements $GenericResponseCopyWith<$Res> {
  _$GenericResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? resultObj = freezed,
    Object? resultStatus = freezed,
    Object? resultCode = freezed,
    Object? resultMessage = freezed,
  }) {
    return _then(_value.copyWith(
      resultObj: freezed == resultObj
          ? _value.resultObj
          : resultObj // ignore: cast_nullable_to_non_nullable
              as String?,
      resultStatus: freezed == resultStatus
          ? _value.resultStatus
          : resultStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      resultCode: freezed == resultCode
          ? _value.resultCode
          : resultCode // ignore: cast_nullable_to_non_nullable
              as String?,
      resultMessage: freezed == resultMessage
          ? _value.resultMessage
          : resultMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GenericResponseCopyWith<$Res>
    implements $GenericResponseCopyWith<$Res> {
  factory _$$_GenericResponseCopyWith(
          _$_GenericResponse value, $Res Function(_$_GenericResponse) then) =
      __$$_GenericResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "resulT_OBJ") String? resultObj,
      @JsonKey(name: "resulT_STATUS") String? resultStatus,
      @JsonKey(name: "resulT_CODE") String? resultCode,
      @JsonKey(name: "resulT_MESSAGE") String? resultMessage});
}

/// @nodoc
class __$$_GenericResponseCopyWithImpl<$Res>
    extends _$GenericResponseCopyWithImpl<$Res, _$_GenericResponse>
    implements _$$_GenericResponseCopyWith<$Res> {
  __$$_GenericResponseCopyWithImpl(
      _$_GenericResponse _value, $Res Function(_$_GenericResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? resultObj = freezed,
    Object? resultStatus = freezed,
    Object? resultCode = freezed,
    Object? resultMessage = freezed,
  }) {
    return _then(_$_GenericResponse(
      resultObj: freezed == resultObj
          ? _value.resultObj
          : resultObj // ignore: cast_nullable_to_non_nullable
              as String?,
      resultStatus: freezed == resultStatus
          ? _value.resultStatus
          : resultStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      resultCode: freezed == resultCode
          ? _value.resultCode
          : resultCode // ignore: cast_nullable_to_non_nullable
              as String?,
      resultMessage: freezed == resultMessage
          ? _value.resultMessage
          : resultMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GenericResponse implements _GenericResponse {
  _$_GenericResponse(
      {@JsonKey(name: "resulT_OBJ") this.resultObj,
      @JsonKey(name: "resulT_STATUS") this.resultStatus,
      @JsonKey(name: "resulT_CODE") this.resultCode,
      @JsonKey(name: "resulT_MESSAGE") this.resultMessage});

  factory _$_GenericResponse.fromJson(Map<String, dynamic> json) =>
      _$$_GenericResponseFromJson(json);

  @override
  @JsonKey(name: "resulT_OBJ")
  final String? resultObj;
  @override
  @JsonKey(name: "resulT_STATUS")
  final String? resultStatus;
  @override
  @JsonKey(name: "resulT_CODE")
  final String? resultCode;
  @override
  @JsonKey(name: "resulT_MESSAGE")
  final String? resultMessage;

  @override
  String toString() {
    return 'GenericResponse(resultObj: $resultObj, resultStatus: $resultStatus, resultCode: $resultCode, resultMessage: $resultMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GenericResponse &&
            (identical(other.resultObj, resultObj) ||
                other.resultObj == resultObj) &&
            (identical(other.resultStatus, resultStatus) ||
                other.resultStatus == resultStatus) &&
            (identical(other.resultCode, resultCode) ||
                other.resultCode == resultCode) &&
            (identical(other.resultMessage, resultMessage) ||
                other.resultMessage == resultMessage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, resultObj, resultStatus, resultCode, resultMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GenericResponseCopyWith<_$_GenericResponse> get copyWith =>
      __$$_GenericResponseCopyWithImpl<_$_GenericResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GenericResponseToJson(
      this,
    );
  }
}

abstract class _GenericResponse implements GenericResponse {
  factory _GenericResponse(
          {@JsonKey(name: "resulT_OBJ") final String? resultObj,
          @JsonKey(name: "resulT_STATUS") final String? resultStatus,
          @JsonKey(name: "resulT_CODE") final String? resultCode,
          @JsonKey(name: "resulT_MESSAGE") final String? resultMessage}) =
      _$_GenericResponse;

  factory _GenericResponse.fromJson(Map<String, dynamic> json) =
      _$_GenericResponse.fromJson;

  @override
  @JsonKey(name: "resulT_OBJ")
  String? get resultObj;
  @override
  @JsonKey(name: "resulT_STATUS")
  String? get resultStatus;
  @override
  @JsonKey(name: "resulT_CODE")
  String? get resultCode;
  @override
  @JsonKey(name: "resulT_MESSAGE")
  String? get resultMessage;
  @override
  @JsonKey(ignore: true)
  _$$_GenericResponseCopyWith<_$_GenericResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
