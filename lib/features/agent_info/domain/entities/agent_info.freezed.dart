// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'agent_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AgentInfo {
  String get licenseId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  AgentStatus get status => throw _privateConstructorUsedError;
  String get agentStatus => throw _privateConstructorUsedError;
  String get expireDate => throw _privateConstructorUsedError;
  String get licenseType => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AgentInfoCopyWith<AgentInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AgentInfoCopyWith<$Res> {
  factory $AgentInfoCopyWith(AgentInfo value, $Res Function(AgentInfo) then) =
      _$AgentInfoCopyWithImpl<$Res, AgentInfo>;
  @useResult
  $Res call(
      {String licenseId,
      String name,
      AgentStatus status,
      String agentStatus,
      String expireDate,
      String licenseType});
}

/// @nodoc
class _$AgentInfoCopyWithImpl<$Res, $Val extends AgentInfo>
    implements $AgentInfoCopyWith<$Res> {
  _$AgentInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? licenseId = null,
    Object? name = null,
    Object? status = null,
    Object? agentStatus = null,
    Object? expireDate = null,
    Object? licenseType = null,
  }) {
    return _then(_value.copyWith(
      licenseId: null == licenseId
          ? _value.licenseId
          : licenseId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AgentStatus,
      agentStatus: null == agentStatus
          ? _value.agentStatus
          : agentStatus // ignore: cast_nullable_to_non_nullable
              as String,
      expireDate: null == expireDate
          ? _value.expireDate
          : expireDate // ignore: cast_nullable_to_non_nullable
              as String,
      licenseType: null == licenseType
          ? _value.licenseType
          : licenseType // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AgentInfoCopyWith<$Res> implements $AgentInfoCopyWith<$Res> {
  factory _$$_AgentInfoCopyWith(
          _$_AgentInfo value, $Res Function(_$_AgentInfo) then) =
      __$$_AgentInfoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String licenseId,
      String name,
      AgentStatus status,
      String agentStatus,
      String expireDate,
      String licenseType});
}

/// @nodoc
class __$$_AgentInfoCopyWithImpl<$Res>
    extends _$AgentInfoCopyWithImpl<$Res, _$_AgentInfo>
    implements _$$_AgentInfoCopyWith<$Res> {
  __$$_AgentInfoCopyWithImpl(
      _$_AgentInfo _value, $Res Function(_$_AgentInfo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? licenseId = null,
    Object? name = null,
    Object? status = null,
    Object? agentStatus = null,
    Object? expireDate = null,
    Object? licenseType = null,
  }) {
    return _then(_$_AgentInfo(
      licenseId: null == licenseId
          ? _value.licenseId
          : licenseId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AgentStatus,
      agentStatus: null == agentStatus
          ? _value.agentStatus
          : agentStatus // ignore: cast_nullable_to_non_nullable
              as String,
      expireDate: null == expireDate
          ? _value.expireDate
          : expireDate // ignore: cast_nullable_to_non_nullable
              as String,
      licenseType: null == licenseType
          ? _value.licenseType
          : licenseType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_AgentInfo implements _AgentInfo {
  const _$_AgentInfo({
    required this.licenseId,
    required this.name,
    required this.status,
    required this.agentStatus,
    required this.expireDate,
    required this.licenseType,
  });

  @override
  final String licenseId;
  @override
  final String name;
  @override
  final AgentStatus status;
  @override
  final String agentStatus;
  @override
  final String expireDate;
  @override
  final String licenseType;

  @override
  String toString() {
    return 'AgentInfo(licenseId: $licenseId, name: $name, status: $status,agentStatus: $agentStatus,expireDate: $expireDate,licenseType: $licenseType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AgentInfo &&
            (identical(other.licenseId, licenseId) ||
                other.licenseId == licenseId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.agentStatus, agentStatus) ||
                other.agentStatus == agentStatus) &&
            (identical(other.expireDate, expireDate) ||
                other.expireDate == expireDate) &&
            (identical(other.licenseType, licenseType) ||
                other.licenseType == licenseType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, licenseId, name, status,
      agentStatus, expireDate, licenseType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AgentInfoCopyWith<_$_AgentInfo> get copyWith =>
      __$$_AgentInfoCopyWithImpl<_$_AgentInfo>(this, _$identity);
}

abstract class _AgentInfo implements AgentInfo {
  const factory _AgentInfo({
    required final String licenseId,
    required final String name,
    required final AgentStatus status,
    required String agentStatus,
    required String expireDate,
    required String licenseType,
  }) = _$_AgentInfo;

  @override
  String get licenseId;
  @override
  String get name;
  @override
  AgentStatus get status;
  @override
  String get agentStatus;
  @override
  String get expireDate;
  @override
  String get licenseType;
  @override
  @JsonKey(ignore: true)
  _$$_AgentInfoCopyWith<_$_AgentInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
