import 'dart:developer';

import 'package:appsflyer_sdk/appsflyer_sdk.dart';
import 'package:clarity_flutter/clarity_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mixpanel_flutter/mixpanel_flutter.dart';
import 'package:phrasly_ai_tools/firebase_options.dart';
import 'package:phrasly_ai_tools/src/app.dart';
import 'package:phrasly_ai_tools/src/core/constants/hive_config.dart';
import 'package:phrasly_ai_tools/src/core/routing/app_router.dart';
import 'package:phrasly_ai_tools/src/core/services/locator/locator.dart';
import 'package:phrasly_ai_tools/src/core/services/remote_config/remote_config_service.dart';
import 'package:phrasly_ai_tools/src/features/auth/presentation/cubit/auth_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await initHive();

  // Initialize AppsFlyer
  _initializeAppsFlyer();

  // Initialize Mixpanel
  _initializeMixpanel();

  setupLocator();
  await locator.allReady();

  // Initialize Remote Config
  await locator<RemoteConfigService>().initialize();
  await locator<RemoteConfigService>().fetchAndActivate();

  await locator<AuthCubit>().checkAuthStatus();

  runApp(
    ClarityWidget(
      clarityConfig: ClarityConfig(projectId: "tcxd2t2e13"),
      app: App(
        routerConfig: AppRouter().createRouter(),
      ),
    ),
  );
}

Future<void> _initializeAppsFlyer() async {
  try {
    final AppsFlyerOptions options = AppsFlyerOptions(
      afDevKey: "W8MvDK64CG5sK2pqbXxbkZ",
      appId: "6752734913",
      showDebug: true, // Set to false in production
    );

    AppsflyerSdk appsflyerSdk = AppsflyerSdk(options);

    final initResult = await appsflyerSdk.initSdk(
      registerConversionDataCallback: true,
      registerOnAppOpenAttributionCallback: true,
      registerOnDeepLinkingCallback: true,
    );

    log('AppsFlyer init result: $initResult');

    appsflyerSdk.startSDK();
  } catch (e) {
    log('Error initializing AppsFlyer: $e');
  }
}

Future<void> _initializeMixpanel() async {
  try {
    // Replace with your actual Mixpanel project token
    final Mixpanel mixpanel = await Mixpanel.init(
      "f38f39351cca1a4e561559c81a55ad2f",
      trackAutomaticEvents: true,
    );

    log('Mixpanel initialized successfully: ${mixpanel.getDistinctId()}');

    // Track app launch event
    mixpanel.track('App Launched');
  } catch (e) {
    log('Error initializing Mixpanel: $e');
  }
}
