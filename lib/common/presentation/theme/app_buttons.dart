import 'package:flutter/material.dart';
import 'package:oic_next_to_you/common/presentation/theme/app_colors.dart';
import 'package:oic_next_to_you/common/presentation/theme/app_text_theme.dart';


class PrimaryButton extends ElevatedButton {
  PrimaryButton(
      {super.key,
      required void Function()? onPressed,
      bool isLoading = false,
      required Widget child})
      : super(
          child: isLoading ? _createLoadingWidget() : child,
          onPressed: isLoading ? null : onPressed,
          style: ElevatedButton.styleFrom(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(50)),
            ),
          ).copyWith(
            minimumSize: _State.all(const Size(200, 50)),
            elevation: _State.all(4),
            foregroundColor: _State.all<Color>(AppTextTheme.primaryButton.color!),
            textStyle: _State.all<TextStyle>(AppTextTheme.primaryButton),
            padding: _State.all<EdgeInsets>(
                const EdgeInsets.symmetric(vertical: 16, horizontal: 32)),
            backgroundColor: _State.resolveWith<Color>(
              (states) {
                if (isLoading || states.contains(MaterialState.disabled)) {
                  return AppColor.lightSilver;
                } else {
                  return AppColor.darkCerulean;
                }
              },
            ),
          ),
        );

  static SizedBox _createLoadingWidget() {
    return SizedBox(
          width: 24,
          height: 24,
          child: CircularProgressIndicator(
            color: AppTextTheme.primaryButton.color,
          ),
        );
  }
}

class SecondaryButton extends TextButton {
  SecondaryButton({
    required super.onPressed,
    required Widget child,
  }) : super(
            child: child,
            style: TextButton.styleFrom(
              foregroundColor: onPressed != null ? AppColor.darkCerulean : AppColor.black50,
                textStyle: AppTextTheme.main.bodyText1?.copyWith(
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
            )));
}

typedef _State = MaterialStateProperty;
