import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:phrasly_ai_tools/src/core/constants/hive_config.dart';

enum Environment {
  beta,
  production,
}

class EnvConfig {
  static const String APP_NAME = 'Flutter App';

  /// Get current environment (defaults to production)
  static Environment get currentEnvironment {
    if (!kDebugMode) return Environment.production;

    final envString = devBox.get('environment', defaultValue: 'production');
    return envString == 'beta' ? Environment.beta : Environment.production;
  }

  /// Set environment (only works in debug mode)
  static Future<void> setEnvironment(Environment env) async {
    if (!kDebugMode) return;
    await devBox.put('environment', env == Environment.beta ? 'beta' : 'production');
  }

  /// Get backend base URL based on current environment
  static String getBackendBaseUrl({
    required String betaUrl,
    required String productionUrl,
  }) {
    return currentEnvironment == Environment.beta ? betaUrl : productionUrl;
  }

  // for testing in debug mode
  static String get TEST_PHONE_NUMBER => !kDebugMode ? '' : dotenv.get('TEST_PHONE_NUMBER', fallback: '');
  static String get TEST_OTP => !kDebugMode ? '' : dotenv.get('TEST_OTP', fallback: '');
  static String get TEST_EMAIL => !kDebugMode ? '' : dotenv.get('TEST_EMAIL', fallback: '');
  static String get TEST_PASSWORD => !kDebugMode ? '' : dotenv.get('TEST_PASSWORD', fallback: '');
}
