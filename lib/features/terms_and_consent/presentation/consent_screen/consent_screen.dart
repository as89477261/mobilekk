import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:oic_next_to_you/common/dependency_injection/dependency_injection.dart';
import 'package:oic_next_to_you/common/presentation/dialogs/round_corner_dialog.dart';
import 'package:oic_next_to_you/common/presentation/theme/app_buttons.dart';
import 'package:oic_next_to_you/common/presentation/theme/loading_animation.dart';
import 'package:oic_next_to_you/common/presentation/utils.dart';
import 'package:oic_next_to_you/features/terms_and_consent/presentation/consent_screen/consent_text_provider.dart';
import 'package:provider/provider.dart';

import 'consent_router.dart';
import 'consent_screen_provider.dart';

void main() async {
  localWidgetInitForDebug(testWidget: ConsentScreen());
}

class ConsentScreen extends StatelessWidget {
  const ConsentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: di<ConsentScreenProvider>())
      ],
      child: ConsentWidget(),
    );
  }
}

class ConsentWidget extends StatelessWidget {
  ConsentWidget({Key? key}) : super(key: key);
  final router = di<ConsentRouter>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: RoundCornerDialog(
        child: Selector<ConsentScreenProvider, bool?>(
            selector: (_, provider) => provider.state.isConsentAcceptSuccess,
            builder: (context, isAcceptTermsSuccess, widget) {
              if (isAcceptTermsSuccess == true) {
                afterRendered(() {
                  router.navigateToMain(context);
                });
              }

              return SingleChildScrollView(
                  child: Selector<ConsentScreenProvider, GetConsentState>(
                      selector: (_, provider) => provider.state.getConsentState,
                      builder: (context, getConsentState, widget) {
                        if (getConsentState == GetConsentState.loading) {
                          return LoadingAnimation();
                        } else if (getConsentState == GetConsentState.started) {
                          afterRendered(() {
                            getProvider(context).getConsent();
                          });
                          return LoadingAnimation();
                        }
                        return _createColumnWithConsent(context);
                      }));
            }),
      ),
    );
  }

  Column _createColumnWithConsent(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          width: double.infinity,
          child: Text(
            'นโยบายข้อมูลส่วนบุคคล',
            textAlign: TextAlign.left,
            style: Theme.of(context).textTheme.headline2,
          ),
        ),
        SizedBox(
          height: 24,
        ),
        _createConsentText(context),
        SizedBox(height: 16),
        _createConsentAllowedCheckBox(),
        SizedBox(height: 16),
        SizedBox(
          height: 24,
        ),
        _createAcceptButton(context)
      ],
    );
  }

  Widget _createConsentText(BuildContext context) {
    return Selector<ConsentScreenProvider, String?>(
        selector: (_, provider) => provider.state.consentString,
        builder: (context, consent, widget) {
          return Text(
            ConsentTextProvider().GetConsent(),
            style: Theme.of(context).textTheme.bodyText1,
          );
        });
  }

  Widget _createAcceptButton(BuildContext context) {
    return PrimaryButton(
      onPressed: () {
        getProvider(context).acceptConsent();
      },
      child: Text('ยอมรับ'),
    );
  }

  Widget _createConsentAllowedCheckBox() {
    return Selector<ConsentScreenProvider, bool?>(
      selector: (_, provider) => provider.state.isConsentAllowed,
      builder: (context, isConsentAllowed, widget) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Checkbox(
              value: isConsentAllowed ?? false,
              onChanged: (newValue) {
                if (newValue != null) {
                  getProvider(context).updateIsAllowed(newValue);
                }
              },
              activeColor: Theme.of(context).primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            Text(
              "ยินยอมให้ใช้ข้อมูล",
              style: Theme.of(context).textTheme.caption,
            )
          ],
        );
      },
    );
  }

  ConsentScreenProvider getProvider(BuildContext context) =>
      Provider.of<ConsentScreenProvider>(context, listen: false);
}
