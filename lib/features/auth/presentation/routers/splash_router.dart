import 'package:flutter/material.dart';
import 'package:oic_next_to_you/common/presentation/router/app_router.dart';
import 'package:oic_next_to_you/features/main/presentation/screens/main_screen.dart';

import '../screens/login_screen.dart';

abstract class SplashRouter implements AppRouter {
  void navigateToLogin(BuildContext context);
  void navigateToMain(BuildContext context);
}

class SplashRouterImpl with LegacyRouter implements SplashRouter {
  @override
  void navigateToLogin(BuildContext context) {
    replaceWithPage(context, LoginScreen());
  }

  @override
  void navigateToMain(BuildContext context) {
    replaceWithPage(context, const MainScreen());
  }
}