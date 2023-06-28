import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:oic_next_to_you/common/dependency_injection/dependency_injection.dart';
import 'package:oic_next_to_you/common/presentation/theme/app_theme.dart';
import 'package:oic_next_to_you/firebase_options.dart';

void afterRendered(Function function) =>
    WidgetsBinding.instance.addPostFrameCallback((_){
      function();
    });

void localWidgetInitForDebug({required Widget testWidget}) async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await registerDI();

  runApp(MaterialApp(
    theme: AppTheme.light,
    home: testWidget,
  ));
}
