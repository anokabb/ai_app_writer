import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
}
