// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'record_detail_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RecordDetailRequest _$RecordDetailRequestFromJson(Map<String, dynamic> json) {
  return _RecordDetailRequest.fromJson(json);
}

/// @nodoc
mixin _$RecordDetailRequest {
  @JsonKey(name: "sessioN_ID")
  String get sessionId => throw _privateConstructorUsedError;
  @JsonKey(name: "raW_TEXT_PHASE")
  String get rawText => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecordDetailRequestCopyWith<RecordDetailRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecordDetailRequestCopyWith<$Res> {
  factory $RecordDetailRequestCopyWith(
          RecordDetailRequest value, $Res Function(RecordDetailRequest) then) =
      _$RecordDetailRequestCopyWithImpl<$Res, RecordDetailRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: "sessioN_ID") String sessionId,
      @JsonKey(name: "raW_TEXT_PHASE") String rawText});
}

/// @nodoc
class _$RecordDetailRequestCopyWithImpl<$Res, $Val extends RecordDetailRequest>
    implements $RecordDetailRequestCopyWith<$Res> {
  _$RecordDetailRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionId = null,
    Object? rawText = null,
  }) {
    return _then(_value.copyWith(
      sessionId: null == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String,
      rawText: null == rawText
          ? _value.rawText
          : rawText // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RecordDetailRequestCopyWith<$Res>
    implements $RecordDetailRequestCopyWith<$Res> {
  factory _$$_RecordDetailRequestCopyWith(_$_RecordDetailRequest value,
          $Res Function(_$_RecordDetailRequest) then) =
      __$$_RecordDetailRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "sessioN_ID") String sessionId,
      @JsonKey(name: "raW_TEXT_PHASE") String rawText});
}

/// @nodoc
class __$$_RecordDetailRequestCopyWithImpl<$Res>
    extends _$RecordDetailRequestCopyWithImpl<$Res, _$_RecordDetailRequest>
    implements _$$_RecordDetailRequestCopyWith<$Res> {
  __$$_RecordDetailRequestCopyWithImpl(_$_RecordDetailRequest _value,
      $Res Function(_$_RecordDetailRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionId = null,
    Object? rawText = null,
  }) {
    return _then(_$_RecordDetailRequest(
      sessionId: null == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String,
      rawText: null == rawText
          ? _value.rawText
          : rawText // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RecordDetailRequest implements _RecordDetailRequest {
  _$_RecordDetailRequest(
      {@JsonKey(name: "sessioN_ID") required this.sessionId,
      @JsonKey(name: "raW_TEXT_PHASE") required this.rawText});

  factory _$_RecordDetailRequest.fromJson(Map<String, dynamic> json) =>
      _$$_RecordDetailRequestFromJson(json);

  @override
  @JsonKey(name: "sessioN_ID")
  final String sessionId;
  @override
  @JsonKey(name: "raW_TEXT_PHASE")
  final String rawText;

  @override
  String toString() {
    return 'RecordDetailRequest(sessionId: $sessionId, rawText: $rawText)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RecordDetailRequest &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.rawText, rawText) || other.rawText == rawText));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, sessionId, rawText);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RecordDetailRequestCopyWith<_$_RecordDetailRequest> get copyWith =>
      __$$_RecordDetailRequestCopyWithImpl<_$_RecordDetailRequest>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RecordDetailRequestToJson(
      this,
    );
  }
}

abstract class _RecordDetailRequest implements RecordDetailRequest {
  factory _RecordDetailRequest(
          {@JsonKey(name: "sessioN_ID") required final String sessionId,
          @JsonKey(name: "raW_TEXT_PHASE") required final String rawText}) =
      _$_RecordDetailRequest;

  factory _RecordDetailRequest.fromJson(Map<String, dynamic> json) =
      _$_RecordDetailRequest.fromJson;

  @override
  @JsonKey(name: "sessioN_ID")
  String get sessionId;
  @override
  @JsonKey(name: "raW_TEXT_PHASE")
  String get rawText;
  @override
  @JsonKey(ignore: true)
  _$$_RecordDetailRequestCopyWith<_$_RecordDetailRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
