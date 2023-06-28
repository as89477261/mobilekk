// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'record_detail_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RecordDetailResponse _$RecordDetailResponseFromJson(Map<String, dynamic> json) {
  return _RecordDetailResponse.fromJson(json);
}

/// @nodoc
mixin _$RecordDetailResponse {
  @JsonKey(name: "id")
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "sessioN_ID")
  String? get sessionId => throw _privateConstructorUsedError;
  @JsonKey(name: "raW_TEXT_PHASE")
  String? get rawText => throw _privateConstructorUsedError;
  @JsonKey(name: "resulT_TEXT_PHASE")
  String? get resultText => throw _privateConstructorUsedError;
  @JsonKey(name: "iS_FRUAD")
  String? get oneMeansFraud => throw _privateConstructorUsedError;
  @JsonKey(name: "risK_LEVEL")
  String? get oneMeansRisk => throw _privateConstructorUsedError;
  @JsonKey(name: "status")
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: "creatE_DATE")
  String? get createdDate => throw _privateConstructorUsedError;
  @JsonKey(name: "creatE_BY")
  String? get createdBy => throw _privateConstructorUsedError;
  @JsonKey(name: "lisT_DETAIL")
  List<RecordDetailResponseDetail>? get details =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecordDetailResponseCopyWith<RecordDetailResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecordDetailResponseCopyWith<$Res> {
  factory $RecordDetailResponseCopyWith(RecordDetailResponse value,
          $Res Function(RecordDetailResponse) then) =
      _$RecordDetailResponseCopyWithImpl<$Res, RecordDetailResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: "id") String? id,
      @JsonKey(name: "sessioN_ID") String? sessionId,
      @JsonKey(name: "raW_TEXT_PHASE") String? rawText,
      @JsonKey(name: "resulT_TEXT_PHASE") String? resultText,
      @JsonKey(name: "iS_FRUAD") String? oneMeansFraud,
      @JsonKey(name: "risK_LEVEL") String? oneMeansRisk,
      @JsonKey(name: "status") String? status,
      @JsonKey(name: "creatE_DATE") String? createdDate,
      @JsonKey(name: "creatE_BY") String? createdBy,
      @JsonKey(name: "lisT_DETAIL") List<RecordDetailResponseDetail>? details});
}

/// @nodoc
class _$RecordDetailResponseCopyWithImpl<$Res,
        $Val extends RecordDetailResponse>
    implements $RecordDetailResponseCopyWith<$Res> {
  _$RecordDetailResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? sessionId = freezed,
    Object? rawText = freezed,
    Object? resultText = freezed,
    Object? oneMeansFraud = freezed,
    Object? oneMeansRisk = freezed,
    Object? status = freezed,
    Object? createdDate = freezed,
    Object? createdBy = freezed,
    Object? details = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      sessionId: freezed == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String?,
      rawText: freezed == rawText
          ? _value.rawText
          : rawText // ignore: cast_nullable_to_non_nullable
              as String?,
      resultText: freezed == resultText
          ? _value.resultText
          : resultText // ignore: cast_nullable_to_non_nullable
              as String?,
      oneMeansFraud: freezed == oneMeansFraud
          ? _value.oneMeansFraud
          : oneMeansFraud // ignore: cast_nullable_to_non_nullable
              as String?,
      oneMeansRisk: freezed == oneMeansRisk
          ? _value.oneMeansRisk
          : oneMeansRisk // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      details: freezed == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as List<RecordDetailResponseDetail>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RecordDetailResponseCopyWith<$Res>
    implements $RecordDetailResponseCopyWith<$Res> {
  factory _$$_RecordDetailResponseCopyWith(_$_RecordDetailResponse value,
          $Res Function(_$_RecordDetailResponse) then) =
      __$$_RecordDetailResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id") String? id,
      @JsonKey(name: "sessioN_ID") String? sessionId,
      @JsonKey(name: "raW_TEXT_PHASE") String? rawText,
      @JsonKey(name: "resulT_TEXT_PHASE") String? resultText,
      @JsonKey(name: "iS_FRUAD") String? oneMeansFraud,
      @JsonKey(name: "risK_LEVEL") String? oneMeansRisk,
      @JsonKey(name: "status") String? status,
      @JsonKey(name: "creatE_DATE") String? createdDate,
      @JsonKey(name: "creatE_BY") String? createdBy,
      @JsonKey(name: "lisT_DETAIL") List<RecordDetailResponseDetail>? details});
}

/// @nodoc
class __$$_RecordDetailResponseCopyWithImpl<$Res>
    extends _$RecordDetailResponseCopyWithImpl<$Res, _$_RecordDetailResponse>
    implements _$$_RecordDetailResponseCopyWith<$Res> {
  __$$_RecordDetailResponseCopyWithImpl(_$_RecordDetailResponse _value,
      $Res Function(_$_RecordDetailResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? sessionId = freezed,
    Object? rawText = freezed,
    Object? resultText = freezed,
    Object? oneMeansFraud = freezed,
    Object? oneMeansRisk = freezed,
    Object? status = freezed,
    Object? createdDate = freezed,
    Object? createdBy = freezed,
    Object? details = freezed,
  }) {
    return _then(_$_RecordDetailResponse(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      sessionId: freezed == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String?,
      rawText: freezed == rawText
          ? _value.rawText
          : rawText // ignore: cast_nullable_to_non_nullable
              as String?,
      resultText: freezed == resultText
          ? _value.resultText
          : resultText // ignore: cast_nullable_to_non_nullable
              as String?,
      oneMeansFraud: freezed == oneMeansFraud
          ? _value.oneMeansFraud
          : oneMeansFraud // ignore: cast_nullable_to_non_nullable
              as String?,
      oneMeansRisk: freezed == oneMeansRisk
          ? _value.oneMeansRisk
          : oneMeansRisk // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      details: freezed == details
          ? _value._details
          : details // ignore: cast_nullable_to_non_nullable
              as List<RecordDetailResponseDetail>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RecordDetailResponse implements _RecordDetailResponse {
  _$_RecordDetailResponse(
      {@JsonKey(name: "id")
          this.id,
      @JsonKey(name: "sessioN_ID")
          this.sessionId,
      @JsonKey(name: "raW_TEXT_PHASE")
          this.rawText,
      @JsonKey(name: "resulT_TEXT_PHASE")
          this.resultText,
      @JsonKey(name: "iS_FRUAD")
          this.oneMeansFraud,
      @JsonKey(name: "risK_LEVEL")
          this.oneMeansRisk,
      @JsonKey(name: "status")
          this.status,
      @JsonKey(name: "creatE_DATE")
          this.createdDate,
      @JsonKey(name: "creatE_BY")
          this.createdBy,
      @JsonKey(name: "lisT_DETAIL")
          final List<RecordDetailResponseDetail>? details})
      : _details = details;

  factory _$_RecordDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$$_RecordDetailResponseFromJson(json);

  @override
  @JsonKey(name: "id")
  final String? id;
  @override
  @JsonKey(name: "sessioN_ID")
  final String? sessionId;
  @override
  @JsonKey(name: "raW_TEXT_PHASE")
  final String? rawText;
  @override
  @JsonKey(name: "resulT_TEXT_PHASE")
  final String? resultText;
  @override
  @JsonKey(name: "iS_FRUAD")
  final String? oneMeansFraud;
  @override
  @JsonKey(name: "risK_LEVEL")
  final String? oneMeansRisk;
  @override
  @JsonKey(name: "status")
  final String? status;
  @override
  @JsonKey(name: "creatE_DATE")
  final String? createdDate;
  @override
  @JsonKey(name: "creatE_BY")
  final String? createdBy;
  final List<RecordDetailResponseDetail>? _details;
  @override
  @JsonKey(name: "lisT_DETAIL")
  List<RecordDetailResponseDetail>? get details {
    final value = _details;
    if (value == null) return null;
    if (_details is EqualUnmodifiableListView) return _details;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'RecordDetailResponse(id: $id, sessionId: $sessionId, rawText: $rawText, resultText: $resultText, oneMeansFraud: $oneMeansFraud, oneMeansRisk: $oneMeansRisk, status: $status, createdDate: $createdDate, createdBy: $createdBy, details: $details)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RecordDetailResponse &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.rawText, rawText) || other.rawText == rawText) &&
            (identical(other.resultText, resultText) ||
                other.resultText == resultText) &&
            (identical(other.oneMeansFraud, oneMeansFraud) ||
                other.oneMeansFraud == oneMeansFraud) &&
            (identical(other.oneMeansRisk, oneMeansRisk) ||
                other.oneMeansRisk == oneMeansRisk) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            const DeepCollectionEquality().equals(other._details, _details));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      sessionId,
      rawText,
      resultText,
      oneMeansFraud,
      oneMeansRisk,
      status,
      createdDate,
      createdBy,
      const DeepCollectionEquality().hash(_details));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RecordDetailResponseCopyWith<_$_RecordDetailResponse> get copyWith =>
      __$$_RecordDetailResponseCopyWithImpl<_$_RecordDetailResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RecordDetailResponseToJson(
      this,
    );
  }
}

abstract class _RecordDetailResponse implements RecordDetailResponse {
  factory _RecordDetailResponse(
          {@JsonKey(name: "id")
              final String? id,
          @JsonKey(name: "sessioN_ID")
              final String? sessionId,
          @JsonKey(name: "raW_TEXT_PHASE")
              final String? rawText,
          @JsonKey(name: "resulT_TEXT_PHASE")
              final String? resultText,
          @JsonKey(name: "iS_FRUAD")
              final String? oneMeansFraud,
          @JsonKey(name: "risK_LEVEL")
              final String? oneMeansRisk,
          @JsonKey(name: "status")
              final String? status,
          @JsonKey(name: "creatE_DATE")
              final String? createdDate,
          @JsonKey(name: "creatE_BY")
              final String? createdBy,
          @JsonKey(name: "lisT_DETAIL")
              final List<RecordDetailResponseDetail>? details}) =
      _$_RecordDetailResponse;

  factory _RecordDetailResponse.fromJson(Map<String, dynamic> json) =
      _$_RecordDetailResponse.fromJson;

  @override
  @JsonKey(name: "id")
  String? get id;
  @override
  @JsonKey(name: "sessioN_ID")
  String? get sessionId;
  @override
  @JsonKey(name: "raW_TEXT_PHASE")
  String? get rawText;
  @override
  @JsonKey(name: "resulT_TEXT_PHASE")
  String? get resultText;
  @override
  @JsonKey(name: "iS_FRUAD")
  String? get oneMeansFraud;
  @override
  @JsonKey(name: "risK_LEVEL")
  String? get oneMeansRisk;
  @override
  @JsonKey(name: "status")
  String? get status;
  @override
  @JsonKey(name: "creatE_DATE")
  String? get createdDate;
  @override
  @JsonKey(name: "creatE_BY")
  String? get createdBy;
  @override
  @JsonKey(name: "lisT_DETAIL")
  List<RecordDetailResponseDetail>? get details;
  @override
  @JsonKey(ignore: true)
  _$$_RecordDetailResponseCopyWith<_$_RecordDetailResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
