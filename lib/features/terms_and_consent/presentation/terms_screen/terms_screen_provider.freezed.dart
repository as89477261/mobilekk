// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'terms_screen_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TermsScreenDataStore {
  Terms? get terms => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TermsScreenDataStoreCopyWith<TermsScreenDataStore> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TermsScreenDataStoreCopyWith<$Res> {
  factory $TermsScreenDataStoreCopyWith(TermsScreenDataStore value,
          $Res Function(TermsScreenDataStore) then) =
      _$TermsScreenDataStoreCopyWithImpl<$Res, TermsScreenDataStore>;
  @useResult
  $Res call({Terms? terms});

  $TermsCopyWith<$Res>? get terms;
}

/// @nodoc
class _$TermsScreenDataStoreCopyWithImpl<$Res,
        $Val extends TermsScreenDataStore>
    implements $TermsScreenDataStoreCopyWith<$Res> {
  _$TermsScreenDataStoreCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? terms = freezed,
  }) {
    return _then(_value.copyWith(
      terms: freezed == terms
          ? _value.terms
          : terms // ignore: cast_nullable_to_non_nullable
              as Terms?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TermsCopyWith<$Res>? get terms {
    if (_value.terms == null) {
      return null;
    }

    return $TermsCopyWith<$Res>(_value.terms!, (value) {
      return _then(_value.copyWith(terms: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_TermsScreenDataStoreCopyWith<$Res>
    implements $TermsScreenDataStoreCopyWith<$Res> {
  factory _$$_TermsScreenDataStoreCopyWith(_$_TermsScreenDataStore value,
          $Res Function(_$_TermsScreenDataStore) then) =
      __$$_TermsScreenDataStoreCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Terms? terms});

  @override
  $TermsCopyWith<$Res>? get terms;
}

/// @nodoc
class __$$_TermsScreenDataStoreCopyWithImpl<$Res>
    extends _$TermsScreenDataStoreCopyWithImpl<$Res, _$_TermsScreenDataStore>
    implements _$$_TermsScreenDataStoreCopyWith<$Res> {
  __$$_TermsScreenDataStoreCopyWithImpl(_$_TermsScreenDataStore _value,
      $Res Function(_$_TermsScreenDataStore) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? terms = freezed,
  }) {
    return _then(_$_TermsScreenDataStore(
      terms: freezed == terms
          ? _value.terms
          : terms // ignore: cast_nullable_to_non_nullable
              as Terms?,
    ));
  }
}

/// @nodoc

class _$_TermsScreenDataStore implements _TermsScreenDataStore {
  _$_TermsScreenDataStore({this.terms = null});

  @override
  @JsonKey()
  final Terms? terms;

  @override
  String toString() {
    return 'TermsScreenDataStore(terms: $terms)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TermsScreenDataStore &&
            (identical(other.terms, terms) || other.terms == terms));
  }

  @override
  int get hashCode => Object.hash(runtimeType, terms);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TermsScreenDataStoreCopyWith<_$_TermsScreenDataStore> get copyWith =>
      __$$_TermsScreenDataStoreCopyWithImpl<_$_TermsScreenDataStore>(
          this, _$identity);
}

abstract class _TermsScreenDataStore implements TermsScreenDataStore {
  factory _TermsScreenDataStore({final Terms? terms}) = _$_TermsScreenDataStore;

  @override
  Terms? get terms;
  @override
  @JsonKey(ignore: true)
  _$$_TermsScreenDataStoreCopyWith<_$_TermsScreenDataStore> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TermsScreenUIState {
  GetTermsState get getTermsState => throw _privateConstructorUsedError;
  String? get getTermsError => throw _privateConstructorUsedError;
  String? get termString => throw _privateConstructorUsedError;
  NextButtonState get nextButtonState => throw _privateConstructorUsedError;
  bool get isTermsAcceptSuccess => throw _privateConstructorUsedError;
  String? get acceptTermsError => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TermsScreenUIStateCopyWith<TermsScreenUIState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TermsScreenUIStateCopyWith<$Res> {
  factory $TermsScreenUIStateCopyWith(
          TermsScreenUIState value, $Res Function(TermsScreenUIState) then) =
      _$TermsScreenUIStateCopyWithImpl<$Res, TermsScreenUIState>;
  @useResult
  $Res call(
      {GetTermsState getTermsState,
      String? getTermsError,
      String? termString,
      NextButtonState nextButtonState,
      bool isTermsAcceptSuccess,
      String? acceptTermsError});
}

/// @nodoc
class _$TermsScreenUIStateCopyWithImpl<$Res, $Val extends TermsScreenUIState>
    implements $TermsScreenUIStateCopyWith<$Res> {
  _$TermsScreenUIStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? getTermsState = null,
    Object? getTermsError = freezed,
    Object? termString = freezed,
    Object? nextButtonState = null,
    Object? isTermsAcceptSuccess = null,
    Object? acceptTermsError = freezed,
  }) {
    return _then(_value.copyWith(
      getTermsState: null == getTermsState
          ? _value.getTermsState
          : getTermsState // ignore: cast_nullable_to_non_nullable
              as GetTermsState,
      getTermsError: freezed == getTermsError
          ? _value.getTermsError
          : getTermsError // ignore: cast_nullable_to_non_nullable
              as String?,
      termString: freezed == termString
          ? _value.termString
          : termString // ignore: cast_nullable_to_non_nullable
              as String?,
      nextButtonState: null == nextButtonState
          ? _value.nextButtonState
          : nextButtonState // ignore: cast_nullable_to_non_nullable
              as NextButtonState,
      isTermsAcceptSuccess: null == isTermsAcceptSuccess
          ? _value.isTermsAcceptSuccess
          : isTermsAcceptSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      acceptTermsError: freezed == acceptTermsError
          ? _value.acceptTermsError
          : acceptTermsError // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TermsScreenUIStateCopyWith<$Res>
    implements $TermsScreenUIStateCopyWith<$Res> {
  factory _$$_TermsScreenUIStateCopyWith(_$_TermsScreenUIState value,
          $Res Function(_$_TermsScreenUIState) then) =
      __$$_TermsScreenUIStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {GetTermsState getTermsState,
      String? getTermsError,
      String? termString,
      NextButtonState nextButtonState,
      bool isTermsAcceptSuccess,
      String? acceptTermsError});
}

/// @nodoc
class __$$_TermsScreenUIStateCopyWithImpl<$Res>
    extends _$TermsScreenUIStateCopyWithImpl<$Res, _$_TermsScreenUIState>
    implements _$$_TermsScreenUIStateCopyWith<$Res> {
  __$$_TermsScreenUIStateCopyWithImpl(
      _$_TermsScreenUIState _value, $Res Function(_$_TermsScreenUIState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? getTermsState = null,
    Object? getTermsError = freezed,
    Object? termString = freezed,
    Object? nextButtonState = null,
    Object? isTermsAcceptSuccess = null,
    Object? acceptTermsError = freezed,
  }) {
    return _then(_$_TermsScreenUIState(
      getTermsState: null == getTermsState
          ? _value.getTermsState
          : getTermsState // ignore: cast_nullable_to_non_nullable
              as GetTermsState,
      getTermsError: freezed == getTermsError
          ? _value.getTermsError
          : getTermsError // ignore: cast_nullable_to_non_nullable
              as String?,
      termString: freezed == termString
          ? _value.termString
          : termString // ignore: cast_nullable_to_non_nullable
              as String?,
      nextButtonState: null == nextButtonState
          ? _value.nextButtonState
          : nextButtonState // ignore: cast_nullable_to_non_nullable
              as NextButtonState,
      isTermsAcceptSuccess: null == isTermsAcceptSuccess
          ? _value.isTermsAcceptSuccess
          : isTermsAcceptSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      acceptTermsError: freezed == acceptTermsError
          ? _value.acceptTermsError
          : acceptTermsError // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_TermsScreenUIState implements _TermsScreenUIState {
  _$_TermsScreenUIState(
      {this.getTermsState = GetTermsState.started,
      this.getTermsError = null,
      this.termString = null,
      this.nextButtonState = NextButtonState.enabled,
      this.isTermsAcceptSuccess = false,
      this.acceptTermsError = null});

  @override
  @JsonKey()
  final GetTermsState getTermsState;
  @override
  @JsonKey()
  final String? getTermsError;
  @override
  @JsonKey()
  final String? termString;
  @override
  @JsonKey()
  final NextButtonState nextButtonState;
  @override
  @JsonKey()
  final bool isTermsAcceptSuccess;
  @override
  @JsonKey()
  final String? acceptTermsError;

  @override
  String toString() {
    return 'TermsScreenUIState(getTermsState: $getTermsState, getTermsError: $getTermsError, termString: $termString, nextButtonState: $nextButtonState, isTermsAcceptSuccess: $isTermsAcceptSuccess, acceptTermsError: $acceptTermsError)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TermsScreenUIState &&
            (identical(other.getTermsState, getTermsState) ||
                other.getTermsState == getTermsState) &&
            (identical(other.getTermsError, getTermsError) ||
                other.getTermsError == getTermsError) &&
            (identical(other.termString, termString) ||
                other.termString == termString) &&
            (identical(other.nextButtonState, nextButtonState) ||
                other.nextButtonState == nextButtonState) &&
            (identical(other.isTermsAcceptSuccess, isTermsAcceptSuccess) ||
                other.isTermsAcceptSuccess == isTermsAcceptSuccess) &&
            (identical(other.acceptTermsError, acceptTermsError) ||
                other.acceptTermsError == acceptTermsError));
  }

  @override
  int get hashCode => Object.hash(runtimeType, getTermsState, getTermsError,
      termString, nextButtonState, isTermsAcceptSuccess, acceptTermsError);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TermsScreenUIStateCopyWith<_$_TermsScreenUIState> get copyWith =>
      __$$_TermsScreenUIStateCopyWithImpl<_$_TermsScreenUIState>(
          this, _$identity);
}

abstract class _TermsScreenUIState implements TermsScreenUIState {
  factory _TermsScreenUIState(
      {final GetTermsState getTermsState,
      final String? getTermsError,
      final String? termString,
      final NextButtonState nextButtonState,
      final bool isTermsAcceptSuccess,
      final String? acceptTermsError}) = _$_TermsScreenUIState;

  @override
  GetTermsState get getTermsState;
  @override
  String? get getTermsError;
  @override
  String? get termString;
  @override
  NextButtonState get nextButtonState;
  @override
  bool get isTermsAcceptSuccess;
  @override
  String? get acceptTermsError;
  @override
  @JsonKey(ignore: true)
  _$$_TermsScreenUIStateCopyWith<_$_TermsScreenUIState> get copyWith =>
      throw _privateConstructorUsedError;
}
