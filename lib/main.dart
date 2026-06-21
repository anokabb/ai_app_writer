import 'dart:developer';
import 'dart:io';

import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:appsflyer_sdk/appsflyer_sdk.dart';
import 'package:clarity_flutter/clarity_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:mixpanel_flutter/mixpanel_flutter.dart';
import 'package:phrasly_ai_tools/firebase_options.dart';
import 'package:phrasly_ai_tools/src/app.dart';
import 'package:phrasly_ai_tools/src/core/constants/hive_config.dart';
import 'package:phrasly_ai_tools/src/core/routing/app_router.dart';
import 'package:phrasly_ai_tools/src/core/services/locator/locator.dart';
import 'package:phrasly_ai_tools/src/core/services/purchases/revenue_cat_service.dart';
import 'package:phrasly_ai_tools/src/core/services/purchases/subscription_cubit.dart';
import 'package:phrasly_ai_tools/src/core/services/remote_config/remote_config_service.dart';
import 'package:phrasly_ai_tools/src/features/auth/presentation/cubit/auth_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Firebase has no web configuration yet, so initialization can fail on web.
  // Guard it so a failure never blocks the app from rendering.
  try {
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  } catch (e) {
    log('Firebase initialization skipped/failed: $e');
  }

  await initHive();

  // Native-only SDKs (ATT, AppsFlyer, RevenueCat) are not supported on web.
  if (!kIsWeb) {
    _initializeAppTrackingTransparency();
  }

  setupLocator();
  await locator.allReady();

  // Initialize Remote Config
  try {
    await locator<RemoteConfigService>().initialize();
    await locator<RemoteConfigService>().fetchAndActivate();
  } catch (e) {
    log('Remote Config initialization failed: $e');
  }

  // Initialize RevenueCat (mobile only)
  if (!kIsWeb) {
    await _initializeRevenueCat();
  }

  try {
    await locator<AuthCubit>().checkAuthStatus();
  } catch (e) {
    log('Auth status check failed: $e');
  }

  final app = App(
    routerConfig: AppRouter().createRouter(),
  );

  runApp(
    // Microsoft Clarity is a mobile-only wrapper; use the app directly on web.
    kIsWeb
        ? app
        : ClarityWidget(
            clarityConfig: ClarityConfig(projectId: "tcxd2t2e13"),
            app: app,
          ),
  );
}

Future<void> _initializeAppTrackingTransparency() async {
  if (Platform.isIOS) {
    final status = await AppTrackingTransparency.requestTrackingAuthorization();
    log('App Tracking Transparency status: $status');

    if (status == TrackingStatus.authorized) {
      _initializeAppsFlyer();
      _initializeMixpanel();
    } else if (status == TrackingStatus.notSupported) {
      _initializeAppsFlyer();
      _initializeMixpanel();
    }
  } else {
    _initializeAppsFlyer();
    _initializeMixpanel();
  }
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

Future<void> _initializeRevenueCat() async {
  try {
    log('RevenueCat free limit: ${locator<RemoteConfigService>().data.revenueCat.freeLimit}');
    // You can get this from your RevenueCat dashboard
    String revenueCatApiKey = Platform.isIOS
        ? locator<RemoteConfigService>().data.revenueCat.revenueIOSApiKey
        : locator<RemoteConfigService>().data.revenueCat.revenueAndroidApiKey;

    await locator<RevenueCatService>().initialize(
      apiKey: revenueCatApiKey,
      // Optionally set user ID if you have one
      // appUserId: locator<AuthCubit>().currentUser?.uid,
    );

    // Check subscription status after initialization
    await locator<SubscriptionCubit>().checkSubscriptionStatus();

    log('RevenueCat initialized successfully');
  } catch (e) {
    log('Error initializing RevenueCat: $e');
  }
}
