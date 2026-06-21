import 'dart:developer';

import 'package:url_launcher/url_launcher.dart';

/// Opens a URL in the platform's native in-app browser, presented as a modal
/// (SFSafariViewController on iOS, Chrome Custom Tabs on Android).
class AppWebViewPopUp {
  static const String routeName = '/web-view';

  /// [title] is kept for call-site compatibility; the native in-app browser
  /// renders its own chrome and doesn't take a custom title.
  static Future<void> show({
    required String title,
    required String url,
  }) async {
    final uri = Uri.tryParse(url);
    if (uri == null) return;

    try {
      final launched = await launchUrl(uri, mode: LaunchMode.inAppBrowserView);
      if (!launched) {
        await launchUrl(uri, mode: LaunchMode.platformDefault);
      }
    } catch (e) {
      log('Failed to open in-app browser for $url: $e');
    }
  }
}
