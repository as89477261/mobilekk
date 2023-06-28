import 'package:flutter/material.dart';
import 'package:oic_next_to_you/common/presentation/router/app_router.dart';
import 'package:oic_next_to_you/features/auth/presentation/screens/login_screen.dart';
import 'package:oic_next_to_you/features/history/presentation/history_page.dart';

abstract class MainRouter implements AppRouter {
  void navigateToLogin(BuildContext context);
  void navigateToHistory(BuildContext context);
}

class MainRouterImpl with LegacyRouter implements MainRouter {
  @override
  void navigateToLogin(BuildContext context) {
    replaceWithPage(context, LoginScreen());
  }

  @override
  void navigateToHistory(BuildContext context) {
    replaceWithPage(context, HistoryPage());
  }
}
