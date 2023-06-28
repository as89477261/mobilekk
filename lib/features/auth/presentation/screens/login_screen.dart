import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:oic_next_to_you/common/dependency_injection/dependency_injection.dart';
import 'package:oic_next_to_you/common/presentation/dialogs/round_corner_dialog.dart';
import 'package:oic_next_to_you/common/presentation/theme/app_buttons.dart';
import 'package:oic_next_to_you/common/presentation/utils.dart';
import 'package:oic_next_to_you/features/auth/presentation/routers/login_router.dart';
import 'package:provider/provider.dart';

import '../providers/login_screen_provider.dart';

void main() async {
  localWidgetInitForDebug(testWidget: LoginScreen());
}

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: di<LoginScreenProvider>())
      ],
      child: LoginWidget(),
    );
  }
}

class LoginWidget extends StatelessWidget {
  LoginWidget({Key? key}) : super(key: key);

  final _maskFormatter = MaskTextInputFormatter(
      mask: '###-###-####',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: RoundCornerDialog(
        child: Selector<LoginScreenProvider, bool>(
            selector: (_, provider) => provider.state.isPhoneNumberValidated,
            builder: (context, isPhoneNumberValidated, widget) {
              if (isPhoneNumberValidated) {
                afterRendered(() {
                  final phoneNumber =
                      _getProvider(context).state.inputPhoneNumber;
                  di<LoginRouter>()
                      .navigateToOtp(context, phoneNumber: phoneNumber);
                });
              }
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'เข้าสู่ระบบ /\nสร้างบัญชีผู้ใช้',
                    style: Theme.of(context).textTheme.headline1,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  _createPhoneTextInput(),
                  _createErrorText(),
                  const SizedBox(
                    height: 24,
                  ),
                  _createNextButton(),
                ],
              );
            }),
      ),
    );
  }

  Widget _createErrorText() {
    return Selector<LoginScreenProvider, String?>(
        selector: (_, provider) => provider.state.errorMessage,
        builder: (context, errorMessage, widget) {
          return Text(
            errorMessage ?? '',
            style: Theme.of(context)
                .textTheme
                .caption
                ?.copyWith(color: Theme.of(context).errorColor),
          );
        });
  }

  Widget _createNextButton() {
    return Selector<LoginScreenProvider, NextButtonState>(
        selector: (_, provider) => provider.state.nextButtonState,
        builder: (context, buttonState, widget) {
          return PrimaryButton(
              onPressed: buttonState == NextButtonState.enabled
                  ? () {
                      _getProvider(context).requestOtp();
                    }
                  : null,
              isLoading: buttonState == NextButtonState.loading,
              child: const Text('ถัดไป'));
        });
  }

  LoginScreenProvider _getProvider(BuildContext context) =>
      Provider.of<LoginScreenProvider>(context, listen: false);

  Widget _createPhoneTextInput() {
    return Selector<LoginScreenProvider, PhoneNumberTextFormFieldState>(
        selector: (_, provider) => provider.state.phoneNumberTextFormFieldState,
        builder: (context, state, widget) {
          final provider = _getProvider(context);
          return TextFormField(
            inputFormatters: [_maskFormatter],
            onChanged: (_) {
              provider.updatePhoneNumber(_maskFormatter.getUnmaskedText());
            },
            keyboardType: const TextInputType.numberWithOptions(
                signed: true, decimal: true),
            decoration: InputDecoration(
                filled: state == PhoneNumberTextFormFieldState.filled,
                fillColor: Theme.of(context).splashColor,
                border: const OutlineInputBorder(),
                label: Text(
                  'เบอร์โทรศัพท์มือถือ',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                hintText: '08x-xxx-xxxx'),
          );
        });
  }
}
