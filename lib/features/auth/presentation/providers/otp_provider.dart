import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:oic_next_to_you/features/auth/data/datasources/oic_otp_datasource.dart';
import 'package:oic_next_to_you/features/auth/data/models/verify_otp/reqVerifyOTPModel.dart';
import 'package:oic_next_to_you/common/core/session.dart';
import 'package:oic_next_to_you/common/utility/extension.dart';

import '../../domain/usecases/request_otp_with_phone_number.dart';
import '../../domain/usecases/verify_otp_of_phone_number.dart';

part 'otp_provider.freezed.dart';

class OtpScreenProvider with ChangeNotifier {
  OtpUIState _state;

  OtpUIState get state => _state;
  final RequestOtpWithPhoneNumber requestOtpWithPhoneNumber;
  final VerifyOtpAndGetUserFromPhoneNumber verifyOtpAndGetUserFromPhoneNumber;

  OtpScreenProvider(
    this._state, {
    required this.requestOtpWithPhoneNumber,
    required this.verifyOtpAndGetUserFromPhoneNumber,
  });

  Future<void> updateInputOtp({required String otp}) async {
    final nextButtonState = _state.nextButtonState == NextButtonState.loading
        ? NextButtonState.loading
        : _isOtpUnFilled(otp)
            ? NextButtonState.disabled
            : NextButtonState.enabled;
    final otpTextFormFieldState = _isOtpUnFilled(otp)
        ? OtpTextFormFieldState.unfilled
        : OtpTextFormFieldState.filled;

    _state = _state.copyWith(
        otpTextFormFieldState: otpTextFormFieldState,
        nextButtonState: nextButtonState,
        otpText: otp);
    notifyListeners();
  }

  bool _isOtpUnFilled(String otp) => otp.length < 6;

  Future<void> verifyOtp({required String phoneNumber}) async {
    if (_state.nextButtonState == NextButtonState.loading) {
      return;
    }
    _state = _state.copyWith(nextButtonState: NextButtonState.loading);
    notifyListeners();

    var currentOTP = await Session().GetCurrentOTP();
    var result = false;
    if (_state.otpText == currentOTP) {
      result = true;
    }

    final response = await verifyOtpAndGetUserFromPhoneNumber(
      phoneNumber: phoneNumber,
      inputOtp: _state.otpText,
    );
    _state = state.copyWith(
      nextButtonState: NextButtonState.enabled,
      isOtpVerified: result, //response.value != null,
      verifyOtpErrorMessage: result == false
          ? "OTP ไม่ถูกต้อง "
          : "", //response.error?.errorMessage,
    );
    notifyListeners();
  }

  Future<void> requestOtp({required String phoneNumber}) async {
    if (_state.resendButtonState == ResendButtonState.disabled) {
      return;
    }
    _state = _state.copyWith(resendButtonState: ResendButtonState.disabled);
    notifyListeners();

    var otpNumber = Extension().getRandomNumber(6);
    var refNumber = Extension().getRandomNumber(4);
    var obj = reqVerifyOTPModel();
    obj.phonENUMBER = phoneNumber;
    obj.regisTOTP =
        "รหัส OTP ของท่านคือ " + otpNumber + " (Ref:" + refNumber + ")";

    var resultOTP = await OICOTP().setRegisterOTP(obj);
    Session().SetCurrentOTP(otpNumber);

    final response = await requestOtpWithPhoneNumber(phoneNumber);
    _state = _state.copyWith(
      resendButtonState: ResendButtonState.enabled,
      resendOtpErrorMessage: response.error?.errorMessage,
    );
    notifyListeners();
  }
}

@freezed
class OtpUIState with _$OtpUIState {
  factory OtpUIState({
    @Default(OtpTextFormFieldState.unfilled)
        OtpTextFormFieldState otpTextFormFieldState,
    @Default('') String otpText,
    @Default(ResendButtonState.enabled) ResendButtonState resendButtonState,
    @Default(NextButtonState.disabled) NextButtonState nextButtonState,
    @Default(false) bool isOtpVerified,
    @Default(null) String? verifyOtpErrorMessage,
    @Default(null) String? resendOtpErrorMessage,
  }) = _OtpUIState;
}

enum OtpTextFormFieldState { unfilled, filled }

enum ResendButtonState { enabled, disabled }

enum NextButtonState { enabled, disabled, loading }
