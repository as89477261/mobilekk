import 'package:flutter/cupertino.dart';
import 'package:oic_next_to_you/common/presentation/router/app_router.dart';
import 'package:oic_next_to_you/common/presentation/router/app_router.dart';
import 'package:oic_next_to_you/features/auth/presentation/screens/login_screen.dart';
import 'package:oic_next_to_you/features/terms_and_consent/presentation/terms_screen/terms_screen.dart';

abstract class OtpRouter implements AppRouter {
  void navigateToLogin(BuildContext context);
  void navigateToTerms(BuildContext context);
}

class OtpRouterImpl with LegacyRouter implements OtpRouter  {
  @override
  void navigateToLogin(BuildContext context) {
    replaceWithPage(context, LoginScreen());
  }

  @override
  void navigateToTerms(BuildContext context) {
    replaceWithPage(context, TermsScreen());
  }
}