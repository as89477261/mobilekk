// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'accept_consent_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AcceptConsentRequest _$AcceptConsentRequestFromJson(Map<String, dynamic> json) {
  return _AcceptConsentRequest.fromJson(json);
}

/// @nodoc
mixin _$AcceptConsentRequest {
  @JsonKey(name: "personaL_CODE")
  String? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: "iS_CONSENT_1")
  String? get oneMeansAccept => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AcceptConsentRequestCopyWith<AcceptConsentRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AcceptConsentRequestCopyWith<$Res> {
  factory $AcceptConsentRequestCopyWith(AcceptConsentRequest value,
          $Res Function(AcceptConsentRequest) then) =
      _$AcceptConsentRequestCopyWithImpl<$Res, AcceptConsentRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: "personaL_CODE") String? userId,
      @JsonKey(name: "iS_CONSENT_1") String? oneMeansAccept});
}

/// @nodoc
class _$AcceptConsentRequestCopyWithImpl<$Res,
        $Val extends AcceptConsentRequest>
    implements $AcceptConsentRequestCopyWith<$Res> {
  _$AcceptConsentRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? oneMeansAccept = freezed,
  }) {
    return _then(_value.copyWith(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      oneMeansAccept: freezed == oneMeansAccept
          ? _value.oneMeansAccept
          : oneMeansAccept // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AcceptConsentRequestCopyWith<$Res>
    implements $AcceptConsentRequestCopyWith<$Res> {
  factory _$$_AcceptConsentRequestCopyWith(_$_AcceptConsentRequest value,
          $Res Function(_$_AcceptConsentRequest) then) =
      __$$_AcceptConsentRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "personaL_CODE") String? userId,
      @JsonKey(name: "iS_CONSENT_1") String? oneMeansAccept});
}

/// @nodoc
class __$$_AcceptConsentRequestCopyWithImpl<$Res>
    extends _$AcceptConsentRequestCopyWithImpl<$Res, _$_AcceptConsentRequest>
    implements _$$_AcceptConsentRequestCopyWith<$Res> {
  __$$_AcceptConsentRequestCopyWithImpl(_$_AcceptConsentRequest _value,
      $Res Function(_$_AcceptConsentRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? oneMeansAccept = freezed,
  }) {
    return _then(_$_AcceptConsentRequest(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      oneMeansAccept: freezed == oneMeansAccept
          ? _value.oneMeansAccept
          : oneMeansAccept // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AcceptConsentRequest implements _AcceptConsentRequest {
  _$_AcceptConsentRequest(
      {@JsonKey(name: "personaL_CODE") this.userId,
      @JsonKey(name: "iS_CONSENT_1") this.oneMeansAccept});

  factory _$_AcceptConsentRequest.fromJson(Map<String, dynamic> json) =>
      _$$_AcceptConsentRequestFromJson(json);

  @override
  @JsonKey(name: "personaL_CODE")
  final String? userId;
  @override
  @JsonKey(name: "iS_CONSENT_1")
  final String? oneMeansAccept;

  @override
  String toString() {
    return 'AcceptConsentRequest(userId: $userId, oneMeansAccept: $oneMeansAccept)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AcceptConsentRequest &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.oneMeansAccept, oneMeansAccept) ||
                other.oneMeansAccept == oneMeansAccept));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userId, oneMeansAccept);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AcceptConsentRequestCopyWith<_$_AcceptConsentRequest> get copyWith =>
      __$$_AcceptConsentRequestCopyWithImpl<_$_AcceptConsentRequest>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AcceptConsentRequestToJson(
      this,
    );
  }
}

abstract class _AcceptConsentRequest implements AcceptConsentRequest {
  factory _AcceptConsentRequest(
          {@JsonKey(name: "personaL_CODE") final String? userId,
          @JsonKey(name: "iS_CONSENT_1") final String? oneMeansAccept}) =
      _$_AcceptConsentRequest;

  factory _AcceptConsentRequest.fromJson(Map<String, dynamic> json) =
      _$_AcceptConsentRequest.fromJson;

  @override
  @JsonKey(name: "personaL_CODE")
  String? get userId;
  @override
  @JsonKey(name: "iS_CONSENT_1")
  String? get oneMeansAccept;
  @override
  @JsonKey(ignore: true)
  _$$_AcceptConsentRequestCopyWith<_$_AcceptConsentRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
