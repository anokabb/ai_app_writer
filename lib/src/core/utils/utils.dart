import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:phrasly_ai_tools/src/core/components/layouts/buttons/gradient_button.dart';
import 'package:phrasly_ai_tools/src/core/components/pop_up/slide_up_pop_up.dart';
import 'package:phrasly_ai_tools/src/core/services/theme/app_theme.dart';

class Utils {
  static Color hexToColor(String hex) {
    String res = hex.replaceAll('#', '');
    return Color(int.parse('0xFF$res'));
  }

  static void copyToClipboard(String text) {
    Clipboard.setData(ClipboardData(text: text));
    Fluttertoast.showToast(msg: 'Copied to clipboard', toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.BOTTOM);
  }

  static void showToast(String message) {
    Fluttertoast.showToast(msg: message, toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.BOTTOM);
  }

  static Future requestReview() async {
    final InAppReview inAppReview = InAppReview.instance;

    if (await inAppReview.isAvailable()) {
      inAppReview.requestReview();
    }
  }

  static Future<void> requestReviewWithConfirmation(BuildContext context) async {
    // First, ask if the user enjoys the app
    SlideUpPopUp.show(
      context: context,
      itemBuilder: (dialogContext) => Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'How\'s your experience so far?',
              style: context.appTextTheme.subtitle1,
            ),
            const SizedBox(height: 4),
            Text(
              'We\'re constantly working to make this app better for you.',
              style: context.appTextTheme.body2Light,
            ),
            const SizedBox(height: 40),
            Column(
              mainAxisSize: MainAxisSize.min,
              spacing: 16,
              children: [
                GradientButton(
                  onPressed: () {
                    Navigator.of(dialogContext).pop();
                    // User doesn't enjoy the app, don't show review
                  },
                  label: 'Could be better',
                  gradientColors: [],
                  forceButtonColor: context.appColors.secondary,
                  textColor: context.appColors.onSecondary,
                ),
                GradientButton(
                  isAsync: true,
                  onPressed: () async {
                    await requestReview();
                    Navigator.of(dialogContext).pop();
                  },
                  label: 'It\'s amazing!',
                  gradientColors: [],
                  forceButtonColor: Utils.hexToColor('#2FC76E'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
