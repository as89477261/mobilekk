// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'logged_in_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LoggedInUser _$LoggedInUserFromJson(Map<String, dynamic> json) {
  return _LoggedInUser.fromJson(json);
}

/// @nodoc
mixin _$LoggedInUser {
  String get id => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoggedInUserCopyWith<LoggedInUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoggedInUserCopyWith<$Res> {
  factory $LoggedInUserCopyWith(
          LoggedInUser value, $Res Function(LoggedInUser) then) =
      _$LoggedInUserCopyWithImpl<$Res, LoggedInUser>;
  @useResult
  $Res call({String id, String phoneNumber});
}

/// @nodoc
class _$LoggedInUserCopyWithImpl<$Res, $Val extends LoggedInUser>
    implements $LoggedInUserCopyWith<$Res> {
  _$LoggedInUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? phoneNumber = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LoggedInUserCopyWith<$Res>
    implements $LoggedInUserCopyWith<$Res> {
  factory _$$_LoggedInUserCopyWith(
          _$_LoggedInUser value, $Res Function(_$_LoggedInUser) then) =
      __$$_LoggedInUserCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String phoneNumber});
}

/// @nodoc
class __$$_LoggedInUserCopyWithImpl<$Res>
    extends _$LoggedInUserCopyWithImpl<$Res, _$_LoggedInUser>
    implements _$$_LoggedInUserCopyWith<$Res> {
  __$$_LoggedInUserCopyWithImpl(
      _$_LoggedInUser _value, $Res Function(_$_LoggedInUser) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? phoneNumber = null,
  }) {
    return _then(_$_LoggedInUser(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LoggedInUser implements _LoggedInUser {
  _$_LoggedInUser({required this.id, required this.phoneNumber});

  factory _$_LoggedInUser.fromJson(Map<String, dynamic> json) =>
      _$$_LoggedInUserFromJson(json);

  @override
  final String id;
  @override
  final String phoneNumber;

  @override
  String toString() {
    return 'LoggedInUser(id: $id, phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoggedInUser &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, phoneNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoggedInUserCopyWith<_$_LoggedInUser> get copyWith =>
      __$$_LoggedInUserCopyWithImpl<_$_LoggedInUser>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LoggedInUserToJson(
      this,
    );
  }
}

abstract class _LoggedInUser implements LoggedInUser {
  factory _LoggedInUser(
      {required final String id,
      required final String phoneNumber}) = _$_LoggedInUser;

  factory _LoggedInUser.fromJson(Map<String, dynamic> json) =
      _$_LoggedInUser.fromJson;

  @override
  String get id;
  @override
  String get phoneNumber;
  @override
  @JsonKey(ignore: true)
  _$$_LoggedInUserCopyWith<_$_LoggedInUser> get copyWith =>
      throw _privateConstructorUsedError;
}
