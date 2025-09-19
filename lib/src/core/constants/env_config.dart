import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvConfig {
  static const String APP_NAME = 'Flutter App';

  // for testing in debug mode
  static String get TEST_PHONE_NUMBER => !kDebugMode ? '' : dotenv.get('TEST_PHONE_NUMBER', fallback: '');
  static String get TEST_OTP => !kDebugMode ? '' : dotenv.get('TEST_OTP', fallback: '');
  static String get TEST_EMAIL => !kDebugMode ? '' : dotenv.get('TEST_EMAIL', fallback: '');
  static String get TEST_PASSWORD => !kDebugMode ? '' : dotenv.get('TEST_PASSWORD', fallback: '');
}
