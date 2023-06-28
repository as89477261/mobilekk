import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:oic_next_to_you/common/dependency_injection/dependency_injection.dart';
import 'package:oic_next_to_you/common/presentation/dialogs/round_corner_dialog.dart';
import 'package:oic_next_to_you/common/presentation/theme/app_buttons.dart';
import 'package:oic_next_to_you/common/presentation/utils.dart';
import 'package:oic_next_to_you/features/auth/presentation/providers/otp_provider.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

import '../routers/otp_router.dart';

void main() async {
  localWidgetInitForDebug(
      testWidget: const OtpScreen(phoneNumber: '0811111111'));
}

class OtpScreen extends StatelessWidget {
  final String phoneNumber;

  const OtpScreen({Key? key, required this.phoneNumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider.value(value: di<OtpScreenProvider>())],
      child: OtpWidget(phoneNumber: phoneNumber),
    );
  }
}

class OtpWidget extends StatelessWidget {
  final String phoneNumber;
  final OtpRouter router = di<OtpRouter>();

  OtpWidget({
    super.key,
    required this.phoneNumber,
  });

  static const _space = SizedBox(height: 24);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: RoundCornerDialog(
        child: Selector<OtpScreenProvider, bool>(
            selector: (_, provider) => provider.state.isOtpVerified,
            builder: (context, isOtpVerified, widget) {
              if (isOtpVerified) {
                afterRendered(() => router.navigateToTerms(context));
              }
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 32.0),
                  child: Column(
                    children: [
                      Text(
                        'ยืนยันตัวตน',
                        style: Theme.of(context).textTheme.headline1,
                        textAlign: TextAlign.center,
                      ),
                      _space,
                      _createPhoneNumberText(context),
                      _space,
                      _createOtpTextField(),
                      _createResendOtpRow(),
                      _space,
                      _createNextButton(),
                      _createVerifyOtpErrorText(),
                      _space,
                      _createChangeNumberButton(context)
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }

  Text _createPhoneNumberText(BuildContext context) {
    final maskFormatter = MaskTextInputFormatter(
      mask: '******####',
      filter: {"#": RegExp(r'[0-9]')},
    );
    final maskedText = maskFormatter.maskText(phoneNumber);
    return Text(
      'กรุณาระบุ OTP ที่ส่งไปยัง $maskedText',
      style: Theme.of(context).textTheme.bodyText2,
      textAlign: TextAlign.center,
    );
  }

  SecondaryButton _createChangeNumberButton(BuildContext context) {
    return SecondaryButton(
      child: const Text('เปลี่ยนเบอร์โทรศัพท์มือถือ'),
      onPressed: () {
        afterRendered(() => router.navigateToLogin(context));
      },
    );
  }

  Widget _createNextButton() {
    return Selector<OtpScreenProvider, NextButtonState>(
        selector: (_, provider) => provider.state.nextButtonState,
        builder: (context, buttonState, widget) {
          return PrimaryButton(
            onPressed: buttonState == NextButtonState.disabled
                ? null
                : () {
                    _getProvider(context).verifyOtp(phoneNumber: phoneNumber);
                  },
            isLoading: buttonState == NextButtonState.loading,
            child: const Text('ถัดไป'),
          );
        });
  }

  Widget _createResendOtpRow() {
    return Selector<OtpScreenProvider, ResendButtonState>(
        selector: (_, provider) => provider.state.resendButtonState,
        builder: (context, buttonState, widget) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'ฉันไม่ได้รับ OTP?',
                style: Theme.of(context).textTheme.bodyText2,
                textAlign: TextAlign.center,
              ),
              SecondaryButton(
                onPressed: buttonState == ResendButtonState.disabled
                    ? null
                    : () {
                        _getProvider(context).requestOtp(
                          phoneNumber: phoneNumber,
                        );
                      },
                child: const Text('ขออีกครั้ง'),
              ),
            ],
          );
        });
  }

  OtpScreenProvider _getProvider(BuildContext context) {
    return Provider.of<OtpScreenProvider>(context, listen: false);
  }

  Widget _createOtpTextField() {
    return Selector<OtpScreenProvider, OtpTextFormFieldState>(
        selector: (_, provider) => provider.state.otpTextFormFieldState,
        builder: (context, _, __) {
          const totalPadding = 32 * 4;
          final screenWidth = MediaQuery.of(context).size.width;

          const pinCodeLength = 6;
          final pinCodeWidth = screenWidth - totalPadding;

          const pinCodeTotalSpacing = 20; // percentage
          final pinCodeTotalFieldWidth =
              pinCodeWidth * ((100 - pinCodeTotalSpacing) / 100);

          final fieldWidth = pinCodeTotalFieldWidth / 6;
          final fieldHeight = fieldWidth * (50 / 40);

          return PinCodeTextField(
            appContext: context,
            length: pinCodeLength,
            onChanged: (updatedPin) {
              _getProvider(context).updateInputOtp(otp: updatedPin);
            },
            pinTheme: PinTheme.defaults(
              borderWidth: 3,
              fieldWidth: fieldWidth,
              fieldHeight: fieldHeight,
              shape: PinCodeFieldShape.box,
              activeColor: Theme.of(context).primaryColor,
              inactiveColor: Theme.of(context).primaryColor,
              activeFillColor: Theme.of(context).splashColor,
              inactiveFillColor: Theme.of(context).dialogBackgroundColor,
              selectedColor: Theme.of(context).primaryColor,
              selectedFillColor: Theme.of(context).dialogBackgroundColor,
            ),
            enableActiveFill: true,
            keyboardType: const TextInputType.numberWithOptions(
              signed: true,
              decimal: false,
            ),
          );
        });
  }

  _createVerifyOtpErrorText() {
    return Selector<OtpScreenProvider, String?>(
        selector: (_, provider) => provider.state.verifyOtpErrorMessage,
        builder: (context, errorMessage, widget) {
          return Text(
            errorMessage ?? '',
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: Theme.of(context).colorScheme.error),
          );
        });
  }
}
