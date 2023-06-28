import 'package:flutter/material.dart';
import 'package:oic_next_to_you/common/presentation/router/app_router.dart';
import 'package:oic_next_to_you/features/auth/presentation/screens/otp_screen.dart';

abstract class LoginRouter implements AppRouter {
  void navigateToOtp(BuildContext context, {required String phoneNumber});
}

class LoginRouterImpl with LegacyRouter implements LoginRouter {
  @override
  void navigateToOtp(BuildContext context, {required String phoneNumber}) {
    replaceWithPage(context, OtpScreen(phoneNumber: phoneNumber));
  }
}