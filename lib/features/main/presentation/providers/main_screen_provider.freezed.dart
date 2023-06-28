// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'main_screen_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MainScreenUIState {
  String? get userNumber => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get loggedOut => throw _privateConstructorUsedError;
  List<HistoryUIState> get histories => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MainScreenUIStateCopyWith<MainScreenUIState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainScreenUIStateCopyWith<$Res> {
  factory $MainScreenUIStateCopyWith(
          MainScreenUIState value, $Res Function(MainScreenUIState) then) =
      _$MainScreenUIStateCopyWithImpl<$Res, MainScreenUIState>;
  @useResult
  $Res call(
      {String? userNumber,
      bool isLoading,
      bool loggedOut,
      List<HistoryUIState> histories});
}

/// @nodoc
class _$MainScreenUIStateCopyWithImpl<$Res, $Val extends MainScreenUIState>
    implements $MainScreenUIStateCopyWith<$Res> {
  _$MainScreenUIStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userNumber = freezed,
    Object? isLoading = null,
    Object? loggedOut = null,
    Object? histories = null,
  }) {
    return _then(_value.copyWith(
      userNumber: freezed == userNumber
          ? _value.userNumber
          : userNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      loggedOut: null == loggedOut
          ? _value.loggedOut
          : loggedOut // ignore: cast_nullable_to_non_nullable
              as bool,
      histories: null == histories
          ? _value.histories
          : histories // ignore: cast_nullable_to_non_nullable
              as List<HistoryUIState>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MainScreenUIStateCopyWith<$Res>
    implements $MainScreenUIStateCopyWith<$Res> {
  factory _$$_MainScreenUIStateCopyWith(_$_MainScreenUIState value,
          $Res Function(_$_MainScreenUIState) then) =
      __$$_MainScreenUIStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? userNumber,
      bool isLoading,
      bool loggedOut,
      List<HistoryUIState> histories});
}

/// @nodoc
class __$$_MainScreenUIStateCopyWithImpl<$Res>
    extends _$MainScreenUIStateCopyWithImpl<$Res, _$_MainScreenUIState>
    implements _$$_MainScreenUIStateCopyWith<$Res> {
  __$$_MainScreenUIStateCopyWithImpl(
      _$_MainScreenUIState _value, $Res Function(_$_MainScreenUIState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userNumber = freezed,
    Object? isLoading = null,
    Object? loggedOut = null,
    Object? histories = null,
  }) {
    return _then(_$_MainScreenUIState(
      userNumber: freezed == userNumber
          ? _value.userNumber
          : userNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      loggedOut: null == loggedOut
          ? _value.loggedOut
          : loggedOut // ignore: cast_nullable_to_non_nullable
              as bool,
      histories: null == histories
          ? _value._histories
          : histories // ignore: cast_nullable_to_non_nullable
              as List<HistoryUIState>,
    ));
  }
}

/// @nodoc

class _$_MainScreenUIState implements _MainScreenUIState {
  _$_MainScreenUIState(
      {this.userNumber = null,
      this.isLoading = false,
      this.loggedOut = false,
      final List<HistoryUIState> histories = const []})
      : _histories = histories;

  @override
  @JsonKey()
  final String? userNumber;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool loggedOut;
  final List<HistoryUIState> _histories;
  @override
  @JsonKey()
  List<HistoryUIState> get histories {
    if (_histories is EqualUnmodifiableListView) return _histories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_histories);
  }

  @override
  String toString() {
    return 'MainScreenUIState(userNumber: $userNumber, isLoading: $isLoading, loggedOut: $loggedOut, histories: $histories)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MainScreenUIState &&
            (identical(other.userNumber, userNumber) ||
                other.userNumber == userNumber) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.loggedOut, loggedOut) ||
                other.loggedOut == loggedOut) &&
            const DeepCollectionEquality()
                .equals(other._histories, _histories));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userNumber, isLoading, loggedOut,
      const DeepCollectionEquality().hash(_histories));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MainScreenUIStateCopyWith<_$_MainScreenUIState> get copyWith =>
      __$$_MainScreenUIStateCopyWithImpl<_$_MainScreenUIState>(
          this, _$identity);
}

abstract class _MainScreenUIState implements MainScreenUIState {
  factory _MainScreenUIState(
      {final String? userNumber,
      final bool isLoading,
      final bool loggedOut,
      final List<HistoryUIState> histories}) = _$_MainScreenUIState;

  @override
  String? get userNumber;
  @override
  bool get isLoading;
  @override
  bool get loggedOut;
  @override
  List<HistoryUIState> get histories;
  @override
  @JsonKey(ignore: true)
  _$$_MainScreenUIStateCopyWith<_$_MainScreenUIState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$HistoryUIState {
  String get formattedDate => throw _privateConstructorUsedError;
  String get agentName => throw _privateConstructorUsedError;
  String get transcribedText => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HistoryUIStateCopyWith<HistoryUIState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HistoryUIStateCopyWith<$Res> {
  factory $HistoryUIStateCopyWith(
          HistoryUIState value, $Res Function(HistoryUIState) then) =
      _$HistoryUIStateCopyWithImpl<$Res, HistoryUIState>;
  @useResult
  $Res call({String formattedDate, String agentName, String transcribedText});
}

/// @nodoc
class _$HistoryUIStateCopyWithImpl<$Res, $Val extends HistoryUIState>
    implements $HistoryUIStateCopyWith<$Res> {
  _$HistoryUIStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? formattedDate = null,
    Object? agentName = null,
    Object? transcribedText = null,
  }) {
    return _then(_value.copyWith(
      formattedDate: null == formattedDate
          ? _value.formattedDate
          : formattedDate // ignore: cast_nullable_to_non_nullable
              as String,
      agentName: null == agentName
          ? _value.agentName
          : agentName // ignore: cast_nullable_to_non_nullable
              as String,
      transcribedText: null == transcribedText
          ? _value.transcribedText
          : transcribedText // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HistoryUIStateCopyWith<$Res>
    implements $HistoryUIStateCopyWith<$Res> {
  factory _$$_HistoryUIStateCopyWith(
          _$_HistoryUIState value, $Res Function(_$_HistoryUIState) then) =
      __$$_HistoryUIStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String formattedDate, String agentName, String transcribedText});
}

/// @nodoc
class __$$_HistoryUIStateCopyWithImpl<$Res>
    extends _$HistoryUIStateCopyWithImpl<$Res, _$_HistoryUIState>
    implements _$$_HistoryUIStateCopyWith<$Res> {
  __$$_HistoryUIStateCopyWithImpl(
      _$_HistoryUIState _value, $Res Function(_$_HistoryUIState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? formattedDate = null,
    Object? agentName = null,
    Object? transcribedText = null,
  }) {
    return _then(_$_HistoryUIState(
      formattedDate: null == formattedDate
          ? _value.formattedDate
          : formattedDate // ignore: cast_nullable_to_non_nullable
              as String,
      agentName: null == agentName
          ? _value.agentName
          : agentName // ignore: cast_nullable_to_non_nullable
              as String,
      transcribedText: null == transcribedText
          ? _value.transcribedText
          : transcribedText // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_HistoryUIState implements _HistoryUIState {
  _$_HistoryUIState(
      {this.formattedDate = '',
      this.agentName = '',
      this.transcribedText = ''});

  @override
  @JsonKey()
  final String formattedDate;
  @override
  @JsonKey()
  final String agentName;
  @override
  @JsonKey()
  final String transcribedText;

  @override
  String toString() {
    return 'HistoryUIState(formattedDate: $formattedDate, agentName: $agentName, transcribedText: $transcribedText)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HistoryUIState &&
            (identical(other.formattedDate, formattedDate) ||
                other.formattedDate == formattedDate) &&
            (identical(other.agentName, agentName) ||
                other.agentName == agentName) &&
            (identical(other.transcribedText, transcribedText) ||
                other.transcribedText == transcribedText));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, formattedDate, agentName, transcribedText);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HistoryUIStateCopyWith<_$_HistoryUIState> get copyWith =>
      __$$_HistoryUIStateCopyWithImpl<_$_HistoryUIState>(this, _$identity);
}

abstract class _HistoryUIState implements HistoryUIState {
  factory _HistoryUIState(
      {final String formattedDate,
      final String agentName,
      final String transcribedText}) = _$_HistoryUIState;

  @override
  String get formattedDate;
  @override
  String get agentName;
  @override
  String get transcribedText;
  @override
  @JsonKey(ignore: true)
  _$$_HistoryUIStateCopyWith<_$_HistoryUIState> get copyWith =>
      throw _privateConstructorUsedError;
}
