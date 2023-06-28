import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:oic_next_to_you/common/dependency_injection/dependency_injection.dart';
import 'package:oic_next_to_you/common/presentation/theme/app_theme.dart';
import 'package:oic_next_to_you/features/auth/presentation/screens/splash_screen.dart';
import 'package:oic_next_to_you/firebase_options.dart';
import 'common/domain/entities/user/user.dart' as globalUser;

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
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.light,
      home: const SplashScreen(),
    );
  }
}
