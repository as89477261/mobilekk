// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'agent_info_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AgentInfoModel _$AgentInfoModelFromJson(Map<String, dynamic> json) {
  return _AgentInfoModel.fromJson(json);
}

/// @nodoc
mixin _$AgentInfoModel {
  @JsonKey(name: 'licenseID')
  String? get licenseId => throw _privateConstructorUsedError;
  String? get firstName => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get expireDate => throw _privateConstructorUsedError;
  String? get licenseType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AgentInfoModelCopyWith<AgentInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AgentInfoModelCopyWith<$Res> {
  factory $AgentInfoModelCopyWith(
          AgentInfoModel value, $Res Function(AgentInfoModel) then) =
      _$AgentInfoModelCopyWithImpl<$Res, AgentInfoModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'licenseID') String? licenseId,
      String? firstName,
      String? lastName,
      String? status,
      String? expireDate,
      String? licenseType});
}

/// @nodoc
class _$AgentInfoModelCopyWithImpl<$Res, $Val extends AgentInfoModel>
    implements $AgentInfoModelCopyWith<$Res> {
  _$AgentInfoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? licenseId = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? status = freezed,
    Object? expireDate = freezed,
    Object? licenseType = freezed,
  }) {
    return _then(_value.copyWith(
      licenseId: freezed == licenseId
          ? _value.licenseId
          : licenseId // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      expireDate: freezed == expireDate
          ? _value.expireDate
          : expireDate // ignore: cast_nullable_to_non_nullable
              as String?,
      licenseType: freezed == licenseType
          ? _value.licenseType
          : licenseType // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AgentInfoModelCopyWith<$Res>
    implements $AgentInfoModelCopyWith<$Res> {
  factory _$$_AgentInfoModelCopyWith(
          _$_AgentInfoModel value, $Res Function(_$_AgentInfoModel) then) =
      __$$_AgentInfoModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'licenseID') String? licenseId,
      String? firstName,
      String? lastName,
      String? status,
      String? expireDate,
      String? licenseType});
}

/// @nodoc
class __$$_AgentInfoModelCopyWithImpl<$Res>
    extends _$AgentInfoModelCopyWithImpl<$Res, _$_AgentInfoModel>
    implements _$$_AgentInfoModelCopyWith<$Res> {
  __$$_AgentInfoModelCopyWithImpl(
      _$_AgentInfoModel _value, $Res Function(_$_AgentInfoModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? licenseId = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? status = freezed,
    Object? expireDate = freezed,
    Object? licenseType = freezed,
  }) {
    return _then(_$_AgentInfoModel(
      licenseId: freezed == licenseId
          ? _value.licenseId
          : licenseId // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      expireDate: freezed == expireDate
          ? _value.expireDate
          : expireDate // ignore: cast_nullable_to_non_nullable
              as String?,
      licenseType: freezed == licenseType
          ? _value.licenseType
          : licenseType // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AgentInfoModel implements _AgentInfoModel {
  const _$_AgentInfoModel(
      {@JsonKey(name: 'licenseID') required this.licenseId,
      required this.firstName,
      required this.lastName,
      required this.status,
      required this.expireDate,
      required this.licenseType});

  factory _$_AgentInfoModel.fromJson(Map<String, dynamic> json) =>
      _$$_AgentInfoModelFromJson(json);

  @override
  @JsonKey(name: 'licenseID')
  final String? licenseId;
  @override
  final String? firstName;
  @override
  final String? lastName;
  @override
  final String? status;
  @override
  final String? expireDate;
  @override
  final String? licenseType;

  @override
  String toString() {
    return 'AgentInfoModel(licenseId: $licenseId, firstName: $firstName, lastName: $lastName, status: $status, expireDate: $expireDate, licenseType: $licenseType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AgentInfoModel &&
            (identical(other.licenseId, licenseId) ||
                other.licenseId == licenseId) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.expireDate, expireDate) ||
                other.expireDate == expireDate) &&
            (identical(other.licenseType, licenseType) ||
                other.licenseType == licenseType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, licenseId, firstName, lastName,
      status, expireDate, licenseType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AgentInfoModelCopyWith<_$_AgentInfoModel> get copyWith =>
      __$$_AgentInfoModelCopyWithImpl<_$_AgentInfoModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AgentInfoModelToJson(
      this,
    );
  }
}

abstract class _AgentInfoModel implements AgentInfoModel {
  const factory _AgentInfoModel(
      {@JsonKey(name: 'licenseID') required final String? licenseId,
      required final String? firstName,
      required final String? lastName,
      required final String? status,
      required final String? expireDate,
      required final String? licenseType}) = _$_AgentInfoModel;

  factory _AgentInfoModel.fromJson(Map<String, dynamic> json) =
      _$_AgentInfoModel.fromJson;

  @override
  @JsonKey(name: 'licenseID')
  String? get licenseId;
  @override
  String? get firstName;
  @override
  String? get lastName;
  @override
  String? get status;
  @override
  String? get expireDate;
  @override
  String? get licenseType;
  @override
  @JsonKey(ignore: true)
  _$$_AgentInfoModelCopyWith<_$_AgentInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}
