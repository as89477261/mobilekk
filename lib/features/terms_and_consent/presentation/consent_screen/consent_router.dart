import 'package:flutter/cupertino.dart';
import 'package:oic_next_to_you/common/presentation/router/app_router.dart';
import 'package:oic_next_to_you/features/main/presentation/screens/main_screen.dart';

abstract class ConsentRouter implements AppRouter {
  void navigateToMain(BuildContext context);
}

class ConsentRouterImpl extends ConsentRouter with LegacyRouter {
  @override
  void navigateToMain(BuildContext context) {
    replaceWithPage(context, MainScreen());
  }
}