// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recording_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RecordingUiState {
  String get toProcessText => throw _privateConstructorUsedError;
  List<ProcessedText> get processedTexts => throw _privateConstructorUsedError;
  bool get isRecording => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RecordingUiStateCopyWith<RecordingUiState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecordingUiStateCopyWith<$Res> {
  factory $RecordingUiStateCopyWith(
          RecordingUiState value, $Res Function(RecordingUiState) then) =
      _$RecordingUiStateCopyWithImpl<$Res, RecordingUiState>;
  @useResult
  $Res call(
      {String toProcessText,
      List<ProcessedText> processedTexts,
      bool isRecording,
      String? errorMessage});
}

/// @nodoc
class _$RecordingUiStateCopyWithImpl<$Res, $Val extends RecordingUiState>
    implements $RecordingUiStateCopyWith<$Res> {
  _$RecordingUiStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? toProcessText = null,
    Object? processedTexts = null,
    Object? isRecording = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      toProcessText: null == toProcessText
          ? _value.toProcessText
          : toProcessText // ignore: cast_nullable_to_non_nullable
              as String,
      processedTexts: null == processedTexts
          ? _value.processedTexts
          : processedTexts // ignore: cast_nullable_to_non_nullable
              as List<ProcessedText>,
      isRecording: null == isRecording
          ? _value.isRecording
          : isRecording // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$$RecordingUiStateCopyWith<$Res>
    implements $RecordingUiStateCopyWith<$Res> {
  factory _$$$RecordingUiStateCopyWith(
          _$$RecordingUiState value, $Res Function(_$$RecordingUiState) then) =
      __$$$RecordingUiStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String toProcessText,
      List<ProcessedText> processedTexts,
      bool isRecording,
      String? errorMessage});
}

/// @nodoc
class __$$$RecordingUiStateCopyWithImpl<$Res>
    extends _$RecordingUiStateCopyWithImpl<$Res, _$$RecordingUiState>
    implements _$$$RecordingUiStateCopyWith<$Res> {
  __$$$RecordingUiStateCopyWithImpl(
      _$$RecordingUiState _value, $Res Function(_$$RecordingUiState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? toProcessText = null,
    Object? processedTexts = null,
    Object? isRecording = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$$RecordingUiState(
      toProcessText: null == toProcessText
          ? _value.toProcessText
          : toProcessText // ignore: cast_nullable_to_non_nullable
              as String,
      processedTexts: null == processedTexts
          ? _value._processedTexts
          : processedTexts // ignore: cast_nullable_to_non_nullable
              as List<ProcessedText>,
      isRecording: null == isRecording
          ? _value.isRecording
          : isRecording // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$$RecordingUiState implements $RecordingUiState {
  _$$RecordingUiState(
      {this.toProcessText = '',
      final List<ProcessedText> processedTexts = const [],
      this.isRecording = false,
      this.errorMessage = null})
      : _processedTexts = processedTexts;

  @override
  @JsonKey()
  final String toProcessText;
  final List<ProcessedText> _processedTexts;
  @override
  @JsonKey()
  List<ProcessedText> get processedTexts {
    if (_processedTexts is EqualUnmodifiableListView) return _processedTexts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_processedTexts);
  }

  @override
  @JsonKey()
  final bool isRecording;
  @override
  @JsonKey()
  final String? errorMessage;

  @override
  String toString() {
    return 'RecordingUiState(toProcessText: $toProcessText, processedTexts: $processedTexts, isRecording: $isRecording, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$$RecordingUiState &&
            (identical(other.toProcessText, toProcessText) ||
                other.toProcessText == toProcessText) &&
            const DeepCollectionEquality()
                .equals(other._processedTexts, _processedTexts) &&
            (identical(other.isRecording, isRecording) ||
                other.isRecording == isRecording) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      toProcessText,
      const DeepCollectionEquality().hash(_processedTexts),
      isRecording,
      errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$$RecordingUiStateCopyWith<_$$RecordingUiState> get copyWith =>
      __$$$RecordingUiStateCopyWithImpl<_$$RecordingUiState>(this, _$identity);
}

abstract class $RecordingUiState implements RecordingUiState {
  factory $RecordingUiState(
      {final String toProcessText,
      final List<ProcessedText> processedTexts,
      final bool isRecording,
      final String? errorMessage}) = _$$RecordingUiState;

  @override
  String get toProcessText;
  @override
  List<ProcessedText> get processedTexts;
  @override
  bool get isRecording;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$$RecordingUiStateCopyWith<_$$RecordingUiState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$RecordingDataStore {
  RecordSession? get currentSession => throw _privateConstructorUsedError;
  String get allSpokenText => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RecordingDataStoreCopyWith<RecordingDataStore> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecordingDataStoreCopyWith<$Res> {
  factory $RecordingDataStoreCopyWith(
          RecordingDataStore value, $Res Function(RecordingDataStore) then) =
      _$RecordingDataStoreCopyWithImpl<$Res, RecordingDataStore>;
  @useResult
  $Res call({RecordSession? currentSession, String allSpokenText});
}

/// @nodoc
class _$RecordingDataStoreCopyWithImpl<$Res, $Val extends RecordingDataStore>
    implements $RecordingDataStoreCopyWith<$Res> {
  _$RecordingDataStoreCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentSession = freezed,
    Object? allSpokenText = null,
  }) {
    return _then(_value.copyWith(
      currentSession: freezed == currentSession
          ? _value.currentSession
          : currentSession // ignore: cast_nullable_to_non_nullable
              as RecordSession?,
      allSpokenText: null == allSpokenText
          ? _value.allSpokenText
          : allSpokenText // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$$RecordingDataStoreCopyWith<$Res>
    implements $RecordingDataStoreCopyWith<$Res> {
  factory _$$$RecordingDataStoreCopyWith(_$$RecordingDataStore value,
          $Res Function(_$$RecordingDataStore) then) =
      __$$$RecordingDataStoreCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({RecordSession? currentSession, String allSpokenText});
}

/// @nodoc
class __$$$RecordingDataStoreCopyWithImpl<$Res>
    extends _$RecordingDataStoreCopyWithImpl<$Res, _$$RecordingDataStore>
    implements _$$$RecordingDataStoreCopyWith<$Res> {
  __$$$RecordingDataStoreCopyWithImpl(
      _$$RecordingDataStore _value, $Res Function(_$$RecordingDataStore) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentSession = freezed,
    Object? allSpokenText = null,
  }) {
    return _then(_$$RecordingDataStore(
      currentSession: freezed == currentSession
          ? _value.currentSession
          : currentSession // ignore: cast_nullable_to_non_nullable
              as RecordSession?,
      allSpokenText: null == allSpokenText
          ? _value.allSpokenText
          : allSpokenText // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$$RecordingDataStore implements $RecordingDataStore {
  _$$RecordingDataStore({this.currentSession = null, this.allSpokenText = ''});

  @override
  @JsonKey()
  final RecordSession? currentSession;
  @override
  @JsonKey()
  final String allSpokenText;

  @override
  String toString() {
    return 'RecordingDataStore(currentSession: $currentSession, allSpokenText: $allSpokenText)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$$RecordingDataStore &&
            (identical(other.currentSession, currentSession) ||
                other.currentSession == currentSession) &&
            (identical(other.allSpokenText, allSpokenText) ||
                other.allSpokenText == allSpokenText));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currentSession, allSpokenText);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$$RecordingDataStoreCopyWith<_$$RecordingDataStore> get copyWith =>
      __$$$RecordingDataStoreCopyWithImpl<_$$RecordingDataStore>(
          this, _$identity);
}

abstract class $RecordingDataStore implements RecordingDataStore {
  factory $RecordingDataStore(
      {final RecordSession? currentSession,
      final String allSpokenText}) = _$$RecordingDataStore;

  @override
  RecordSession? get currentSession;
  @override
  String get allSpokenText;
  @override
  @JsonKey(ignore: true)
  _$$$RecordingDataStoreCopyWith<_$$RecordingDataStore> get copyWith =>
      throw _privateConstructorUsedError;
}
