import 'package:flutter/cupertino.dart';
import 'package:oic_next_to_you/common/presentation/router/app_router.dart';
import 'package:oic_next_to_you/features/terms_and_consent/presentation/consent_screen/consent_screen.dart';

abstract class TermsRouter implements AppRouter {
  void navigateToConsent(BuildContext context);
}

class TermsRouterImpl extends TermsRouter with LegacyRouter {
  @override
  void navigateToConsent(BuildContext context) {
    replaceWithPage(context, ConsentScreen());
  }
}