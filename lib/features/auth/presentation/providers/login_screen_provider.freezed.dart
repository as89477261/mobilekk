// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_screen_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LoginScreenUIState {
  NextButtonState get nextButtonState => throw _privateConstructorUsedError;
  String get inputPhoneNumber => throw _privateConstructorUsedError;
  PhoneNumberTextFormFieldState get phoneNumberTextFormFieldState =>
      throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  bool get isPhoneNumberValidated => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginScreenUIStateCopyWith<LoginScreenUIState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginScreenUIStateCopyWith<$Res> {
  factory $LoginScreenUIStateCopyWith(
          LoginScreenUIState value, $Res Function(LoginScreenUIState) then) =
      _$LoginScreenUIStateCopyWithImpl<$Res, LoginScreenUIState>;
  @useResult
  $Res call(
      {NextButtonState nextButtonState,
      String inputPhoneNumber,
      PhoneNumberTextFormFieldState phoneNumberTextFormFieldState,
      String? errorMessage,
      bool isPhoneNumberValidated});
}

/// @nodoc
class _$LoginScreenUIStateCopyWithImpl<$Res, $Val extends LoginScreenUIState>
    implements $LoginScreenUIStateCopyWith<$Res> {
  _$LoginScreenUIStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nextButtonState = null,
    Object? inputPhoneNumber = null,
    Object? phoneNumberTextFormFieldState = null,
    Object? errorMessage = freezed,
    Object? isPhoneNumberValidated = null,
  }) {
    return _then(_value.copyWith(
      nextButtonState: null == nextButtonState
          ? _value.nextButtonState
          : nextButtonState // ignore: cast_nullable_to_non_nullable
              as NextButtonState,
      inputPhoneNumber: null == inputPhoneNumber
          ? _value.inputPhoneNumber
          : inputPhoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumberTextFormFieldState: null == phoneNumberTextFormFieldState
          ? _value.phoneNumberTextFormFieldState
          : phoneNumberTextFormFieldState // ignore: cast_nullable_to_non_nullable
              as PhoneNumberTextFormFieldState,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      isPhoneNumberValidated: null == isPhoneNumberValidated
          ? _value.isPhoneNumberValidated
          : isPhoneNumberValidated // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LoginScreenUIStateCopyWith<$Res>
    implements $LoginScreenUIStateCopyWith<$Res> {
  factory _$$_LoginScreenUIStateCopyWith(_$_LoginScreenUIState value,
          $Res Function(_$_LoginScreenUIState) then) =
      __$$_LoginScreenUIStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {NextButtonState nextButtonState,
      String inputPhoneNumber,
      PhoneNumberTextFormFieldState phoneNumberTextFormFieldState,
      String? errorMessage,
      bool isPhoneNumberValidated});
}

/// @nodoc
class __$$_LoginScreenUIStateCopyWithImpl<$Res>
    extends _$LoginScreenUIStateCopyWithImpl<$Res, _$_LoginScreenUIState>
    implements _$$_LoginScreenUIStateCopyWith<$Res> {
  __$$_LoginScreenUIStateCopyWithImpl(
      _$_LoginScreenUIState _value, $Res Function(_$_LoginScreenUIState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nextButtonState = null,
    Object? inputPhoneNumber = null,
    Object? phoneNumberTextFormFieldState = null,
    Object? errorMessage = freezed,
    Object? isPhoneNumberValidated = null,
  }) {
    return _then(_$_LoginScreenUIState(
      nextButtonState: null == nextButtonState
          ? _value.nextButtonState
          : nextButtonState // ignore: cast_nullable_to_non_nullable
              as NextButtonState,
      inputPhoneNumber: null == inputPhoneNumber
          ? _value.inputPhoneNumber
          : inputPhoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumberTextFormFieldState: null == phoneNumberTextFormFieldState
          ? _value.phoneNumberTextFormFieldState
          : phoneNumberTextFormFieldState // ignore: cast_nullable_to_non_nullable
              as PhoneNumberTextFormFieldState,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      isPhoneNumberValidated: null == isPhoneNumberValidated
          ? _value.isPhoneNumberValidated
          : isPhoneNumberValidated // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_LoginScreenUIState
    with DiagnosticableTreeMixin
    implements _LoginScreenUIState {
  _$_LoginScreenUIState(
      {this.nextButtonState = NextButtonState.disabled,
      this.inputPhoneNumber = '',
      this.phoneNumberTextFormFieldState =
          PhoneNumberTextFormFieldState.unfilled,
      this.errorMessage = null,
      this.isPhoneNumberValidated = false});

  @override
  @JsonKey()
  final NextButtonState nextButtonState;
  @override
  @JsonKey()
  final String inputPhoneNumber;
  @override
  @JsonKey()
  final PhoneNumberTextFormFieldState phoneNumberTextFormFieldState;
  @override
  @JsonKey()
  final String? errorMessage;
  @override
  @JsonKey()
  final bool isPhoneNumberValidated;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LoginScreenUIState(nextButtonState: $nextButtonState, inputPhoneNumber: $inputPhoneNumber, phoneNumberTextFormFieldState: $phoneNumberTextFormFieldState, errorMessage: $errorMessage, isPhoneNumberValidated: $isPhoneNumberValidated)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LoginScreenUIState'))
      ..add(DiagnosticsProperty('nextButtonState', nextButtonState))
      ..add(DiagnosticsProperty('inputPhoneNumber', inputPhoneNumber))
      ..add(DiagnosticsProperty(
          'phoneNumberTextFormFieldState', phoneNumberTextFormFieldState))
      ..add(DiagnosticsProperty('errorMessage', errorMessage))
      ..add(DiagnosticsProperty(
          'isPhoneNumberValidated', isPhoneNumberValidated));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoginScreenUIState &&
            (identical(other.nextButtonState, nextButtonState) ||
                other.nextButtonState == nextButtonState) &&
            (identical(other.inputPhoneNumber, inputPhoneNumber) ||
                other.inputPhoneNumber == inputPhoneNumber) &&
            (identical(other.phoneNumberTextFormFieldState,
                    phoneNumberTextFormFieldState) ||
                other.phoneNumberTextFormFieldState ==
                    phoneNumberTextFormFieldState) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.isPhoneNumberValidated, isPhoneNumberValidated) ||
                other.isPhoneNumberValidated == isPhoneNumberValidated));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      nextButtonState,
      inputPhoneNumber,
      phoneNumberTextFormFieldState,
      errorMessage,
      isPhoneNumberValidated);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoginScreenUIStateCopyWith<_$_LoginScreenUIState> get copyWith =>
      __$$_LoginScreenUIStateCopyWithImpl<_$_LoginScreenUIState>(
          this, _$identity);
}

abstract class _LoginScreenUIState implements LoginScreenUIState {
  factory _LoginScreenUIState(
      {final NextButtonState nextButtonState,
      final String inputPhoneNumber,
      final PhoneNumberTextFormFieldState phoneNumberTextFormFieldState,
      final String? errorMessage,
      final bool isPhoneNumberValidated}) = _$_LoginScreenUIState;

  @override
  NextButtonState get nextButtonState;
  @override
  String get inputPhoneNumber;
  @override
  PhoneNumberTextFormFieldState get phoneNumberTextFormFieldState;
  @override
  String? get errorMessage;
  @override
  bool get isPhoneNumberValidated;
  @override
  @JsonKey(ignore: true)
  _$$_LoginScreenUIStateCopyWith<_$_LoginScreenUIState> get copyWith =>
      throw _privateConstructorUsedError;
}
