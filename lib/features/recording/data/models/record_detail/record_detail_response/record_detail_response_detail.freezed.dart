// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'record_detail_response_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RecordDetailResponseDetail _$RecordDetailResponseDetailFromJson(
    Map<String, dynamic> json) {
  return _RecordDetailResponseDetail.fromJson(json);
}

/// @nodoc
mixin _$RecordDetailResponseDetail {
  @JsonKey(name: "whichClass")
  num? get classNum => throw _privateConstructorUsedError;
  @JsonKey(name: "probability")
  num? get probability => throw _privateConstructorUsedError;
  @JsonKey(name: "whichWord")
  String? get word => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecordDetailResponseDetailCopyWith<RecordDetailResponseDetail>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecordDetailResponseDetailCopyWith<$Res> {
  factory $RecordDetailResponseDetailCopyWith(RecordDetailResponseDetail value,
          $Res Function(RecordDetailResponseDetail) then) =
      _$RecordDetailResponseDetailCopyWithImpl<$Res,
          RecordDetailResponseDetail>;
  @useResult
  $Res call(
      {@JsonKey(name: "whichClass") num? classNum,
      @JsonKey(name: "probability") num? probability,
      @JsonKey(name: "whichWord") String? word});
}

/// @nodoc
class _$RecordDetailResponseDetailCopyWithImpl<$Res,
        $Val extends RecordDetailResponseDetail>
    implements $RecordDetailResponseDetailCopyWith<$Res> {
  _$RecordDetailResponseDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? classNum = freezed,
    Object? probability = freezed,
    Object? word = freezed,
  }) {
    return _then(_value.copyWith(
      classNum: freezed == classNum
          ? _value.classNum
          : classNum // ignore: cast_nullable_to_non_nullable
              as num?,
      probability: freezed == probability
          ? _value.probability
          : probability // ignore: cast_nullable_to_non_nullable
              as num?,
      word: freezed == word
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RecordDetailResponseDetailCopyWith<$Res>
    implements $RecordDetailResponseDetailCopyWith<$Res> {
  factory _$$_RecordDetailResponseDetailCopyWith(
          _$_RecordDetailResponseDetail value,
          $Res Function(_$_RecordDetailResponseDetail) then) =
      __$$_RecordDetailResponseDetailCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "whichClass") num? classNum,
      @JsonKey(name: "probability") num? probability,
      @JsonKey(name: "whichWord") String? word});
}

/// @nodoc
class __$$_RecordDetailResponseDetailCopyWithImpl<$Res>
    extends _$RecordDetailResponseDetailCopyWithImpl<$Res,
        _$_RecordDetailResponseDetail>
    implements _$$_RecordDetailResponseDetailCopyWith<$Res> {
  __$$_RecordDetailResponseDetailCopyWithImpl(
      _$_RecordDetailResponseDetail _value,
      $Res Function(_$_RecordDetailResponseDetail) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? classNum = freezed,
    Object? probability = freezed,
    Object? word = freezed,
  }) {
    return _then(_$_RecordDetailResponseDetail(
      classNum: freezed == classNum
          ? _value.classNum
          : classNum // ignore: cast_nullable_to_non_nullable
              as num?,
      probability: freezed == probability
          ? _value.probability
          : probability // ignore: cast_nullable_to_non_nullable
              as num?,
      word: freezed == word
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RecordDetailResponseDetail implements _RecordDetailResponseDetail {
  _$_RecordDetailResponseDetail(
      {@JsonKey(name: "whichClass") this.classNum,
      @JsonKey(name: "probability") this.probability,
      @JsonKey(name: "whichWord") this.word});

  factory _$_RecordDetailResponseDetail.fromJson(Map<String, dynamic> json) =>
      _$$_RecordDetailResponseDetailFromJson(json);

  @override
  @JsonKey(name: "whichClass")
  final num? classNum;
  @override
  @JsonKey(name: "probability")
  final num? probability;
  @override
  @JsonKey(name: "whichWord")
  final String? word;

  @override
  String toString() {
    return 'RecordDetailResponseDetail(classNum: $classNum, probability: $probability, word: $word)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RecordDetailResponseDetail &&
            (identical(other.classNum, classNum) ||
                other.classNum == classNum) &&
            (identical(other.probability, probability) ||
                other.probability == probability) &&
            (identical(other.word, word) || other.word == word));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, classNum, probability, word);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RecordDetailResponseDetailCopyWith<_$_RecordDetailResponseDetail>
      get copyWith => __$$_RecordDetailResponseDetailCopyWithImpl<
          _$_RecordDetailResponseDetail>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RecordDetailResponseDetailToJson(
      this,
    );
  }
}

abstract class _RecordDetailResponseDetail
    implements RecordDetailResponseDetail {
  factory _RecordDetailResponseDetail(
          {@JsonKey(name: "whichClass") final num? classNum,
          @JsonKey(name: "probability") final num? probability,
          @JsonKey(name: "whichWord") final String? word}) =
      _$_RecordDetailResponseDetail;

  factory _RecordDetailResponseDetail.fromJson(Map<String, dynamic> json) =
      _$_RecordDetailResponseDetail.fromJson;

  @override
  @JsonKey(name: "whichClass")
  num? get classNum;
  @override
  @JsonKey(name: "probability")
  num? get probability;
  @override
  @JsonKey(name: "whichWord")
  String? get word;
  @override
  @JsonKey(ignore: true)
  _$$_RecordDetailResponseDetailCopyWith<_$_RecordDetailResponseDetail>
      get copyWith => throw _privateConstructorUsedError;
}
