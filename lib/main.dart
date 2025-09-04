import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phrasly_ai_tools/firebase_options.dart';
import 'package:phrasly_ai_tools/src/app.dart';
import 'package:phrasly_ai_tools/src/core/constants/env_config.dart';
import 'package:phrasly_ai_tools/src/core/constants/hive_config.dart';
import 'package:phrasly_ai_tools/src/core/routing/app_router.dart';
import 'package:phrasly_ai_tools/src/core/services/locator/locator.dart';
import 'package:phrasly_ai_tools/src/features/auth/presentation/cubit/auth_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await initHive();
  await EnvConfig.loadEnv();

  setupLocator();
  await locator.allReady();
  await locator<AuthCubit>().checkAuthStatus();

  runApp(
    App(
      routerConfig: AppRouter().createRouter(),
    ),
  );
}
