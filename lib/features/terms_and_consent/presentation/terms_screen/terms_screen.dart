import 'package:flutter/material.dart';
import 'package:oic_next_to_you/common/dependency_injection/dependency_injection.dart';
import 'package:oic_next_to_you/common/presentation/dialogs/round_corner_dialog.dart';
import 'package:oic_next_to_you/common/presentation/theme/app_buttons.dart';
import 'package:oic_next_to_you/common/presentation/theme/loading_animation.dart';
import 'package:oic_next_to_you/common/presentation/utils.dart';
import 'package:oic_next_to_you/features/terms_and_consent/presentation/terms_screen/terms_router.dart';
import 'package:oic_next_to_you/features/terms_and_consent/presentation/terms_screen/terms_screen_provider.dart';
import 'package:oic_next_to_you/common/core/session.dart';
import 'package:oic_next_to_you/common/utility/extension.dart';

import 'package:provider/provider.dart';

void main() async {
  localWidgetInitForDebug(testWidget: TermsScreen());
}

class TermsScreen extends StatelessWidget {
  const TermsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: di<TermsScreenProvider>())
      ],
      child: TermsWidget(),
    );
  }
}

class TermsWidget extends StatelessWidget {
  TermsWidget({Key? key}) : super(key: key);

  final router = di<TermsRouter>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: RoundCornerDialog(
        child: Selector<TermsScreenProvider, bool>(
            selector: (_, provider) => provider.state.isTermsAcceptSuccess,
            builder: (context, isAcceptTermsSuccess, widget) {
              if (isAcceptTermsSuccess) {
                afterRendered(() {
                  router.navigateToConsent(context);
                });
              }

              return SingleChildScrollView(
                  child: Selector<TermsScreenProvider, GetTermsState>(
                      selector: (_, provider) => provider.state.getTermsState,
                      builder: (context, getTermsState, widget) {
                        if (getTermsState == GetTermsState.loading) {
                          return LoadingAnimation();
                        } else if (getTermsState == GetTermsState.started) {
                          afterRendered(() {
                            Provider.of<TermsScreenProvider>(context,
                                    listen: false)
                                .getTerms();
                          });

                          return LoadingAnimation();
                        }
                        return _createColumnWithTerms(context);
                      }));
            }),
      ),
    );
  }

  Column _createColumnWithTerms(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          width: double.infinity,
          child: Text(
            'ข้อกำหนดและเงื่อนไข',
            textAlign: TextAlign.left,
            style: Theme.of(context).textTheme.headline2,
          ),
        ),
        SizedBox(
          height: 24,
        ),
        _createTermsText(context),
        SizedBox(
          height: 24,
        ),
        _createAcceptButton()
      ],
    );
  }

  Widget _createTermsText(BuildContext context) {
    return Selector<TermsScreenProvider, String?>(
        selector: (_, provider) => provider.state.termString,
        builder: (context, terms, widget) {
          return Text(
            terms ?? '',
            style: Theme.of(context).textTheme.bodyText1,
          );
        });
  }

  Widget _createAcceptButton() {
    return Selector<TermsScreenProvider, NextButtonState>(
        selector: (_, provider) => provider.state.nextButtonState,
        builder: (context, buttonState, widget) {
          return PrimaryButton(
            onPressed: buttonState == NextButtonState.enabled
                ? () {
                    Provider.of<TermsScreenProvider>(context, listen: false)
                        .acceptTerms();
                  }
                : null,
            isLoading: buttonState == NextButtonState.loading,
            child: Text('ยอมรับ'),
          );
        });
  }
}
