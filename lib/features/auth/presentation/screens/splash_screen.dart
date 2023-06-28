import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:oic_next_to_you/common/dependency_injection/dependency_injection.dart';
import 'package:oic_next_to_you/common/presentation/theme/app_theme.dart';
import 'package:oic_next_to_you/common/presentation/theme/loading_animation.dart';
import 'package:oic_next_to_you/common/presentation/utils.dart';
import 'package:oic_next_to_you/features/auth/presentation/providers/splash_screen_provider.dart';
import 'package:oic_next_to_you/features/auth/presentation/routers/splash_router.dart';
import 'package:oic_next_to_you/firebase_options.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    // do nothing
  }
  await registerDI();

  runApp(
    MaterialApp(
      theme: AppTheme.light,
      home: const SplashScreen(),
    ),
  );
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: di<SplashScreenProvider>())
      ],
      child: const SplashWidget(),
    );
  }
}

class SplashWidget extends StatelessWidget {
  const SplashWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SplashScreenProvider>(builder: (context, provider, widget) {
      if (provider.state.state == CheckLoggedInState.start) {
        afterRendered(() => provider.checkLoggedInUser());
      } else if (provider.state.state == CheckLoggedInState.done) {
        final user = provider.state.user;
        final appRouter = di<SplashRouter>();
        if (user != null) {
          afterRendered(() => appRouter.navigateToMain(context));
        } else {
          afterRendered(() => appRouter.navigateToLogin(context));
        }
      }
      return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: const Center(child: LoadingAnimation()),
      );
    });
  }
}
