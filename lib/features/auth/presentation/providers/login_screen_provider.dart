import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:oic_next_to_you/features/auth/domain/usecases/request_otp_with_phone_number.dart';
import 'package:oic_next_to_you/features/auth/data/datasources/oic_otp_datasource.dart';
import 'package:oic_next_to_you/features/auth/data/models/verify_otp/reqVerifyOTPModel.dart';
import 'package:oic_next_to_you/common/core/session.dart';
import 'package:oic_next_to_you/common/utility/extension.dart';

part 'login_screen_provider.freezed.dart';

class LoginScreenProvider with ChangeNotifier {
  LoginScreenUIState _state;

  LoginScreenUIState get state => _state;
  final RequestOtpWithPhoneNumber requestOtpWithPhoneNumber;

  LoginScreenProvider(this._state, {required this.requestOtpWithPhoneNumber});

  Future<void> updatePhoneNumber(String phoneNumber) async {
    final newTextFieldState = _isPhoneNumberUnFilled(phoneNumber)
        ? PhoneNumberTextFormFieldState.unfilled
        : PhoneNumberTextFormFieldState.filled;

    final newNextButtonState = _state.nextButtonState == NextButtonState.loading
        ? _state.nextButtonState
        : _isPhoneNumberUnFilled(phoneNumber)
            ? NextButtonState.disabled
            : NextButtonState.enabled;

    _state = _state.copyWith(
        phoneNumberTextFormFieldState: newTextFieldState,
        inputPhoneNumber: phoneNumber,
        nextButtonState: newNextButtonState);
    notifyListeners();
  }

  bool _isPhoneNumberUnFilled(String phoneNumber) => phoneNumber.length < 10;

  Future<void> requestOtp() async {
    if (_state.nextButtonState == NextButtonState.loading) {
      return;
    }
    _state = _state.copyWith(nextButtonState: NextButtonState.loading);
    notifyListeners();

    var otpNumber = Extension().getRandomNumber(6);
    var refNumber = Extension().getRandomNumber(4);
    var obj = reqVerifyOTPModel();
    obj.phonENUMBER = _state.inputPhoneNumber;
    obj.regisTOTP =
        "รหัส OTP ของท่านคือ " + otpNumber + " (Ref:" + refNumber + ")";

    var resultOTP = await OICOTP().setRegisterOTP(obj);
    Session().SetCurrentOTP(otpNumber);

    final response = await requestOtpWithPhoneNumber(_state.inputPhoneNumber);
    _state = _state.copyWith(
      nextButtonState: NextButtonState.enabled,
      errorMessage: "", //response.error?.errorMessage,
      isPhoneNumberValidated: true, //response.value ?? false,
    );
    notifyListeners();
  }
}

@freezed
class LoginScreenUIState with _$LoginScreenUIState {
  factory LoginScreenUIState({
    @Default(NextButtonState.disabled) NextButtonState nextButtonState,
    @Default('') String inputPhoneNumber,
    @Default(PhoneNumberTextFormFieldState.unfilled)
        PhoneNumberTextFormFieldState phoneNumberTextFormFieldState,
    @Default(null) String? errorMessage,
    @Default(false) bool isPhoneNumberValidated,
  }) = _LoginScreenUIState;
}

enum PhoneNumberTextFormFieldState { unfilled, filled }

enum NextButtonState { enabled, disabled, loading }
