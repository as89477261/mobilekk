import 'package:flutter/cupertino.dart';
import 'package:oic_next_to_you/common/presentation/router/app_router.dart';
import 'package:oic_next_to_you/features/main/presentation/screens/main_screen.dart';
import 'package:oic_next_to_you/features/terms_and_consent/presentation/consent_screen/consent_screen.dart';

abstract class RecordRouter implements AppRouter {
  void navigateToMain(BuildContext context);
}

class RecordRouterImpl with LegacyRouter implements RecordRouter {
  @override
  void navigateToMain(BuildContext context) {
    replaceWithPage(context, MainScreen());
  }
}
