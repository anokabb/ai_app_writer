import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:phrasly_ai_tools/src/core/components/pop_up/custom_pop_up_view.dart';
import 'package:phrasly_ai_tools/src/core/services/theme/app_theme.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AppWebViewPopUp extends CustomPopUpView {
  static const String routeName = '/web-view';
  final String url;
  final String title;

  const AppWebViewPopUp({super.key, required this.url, required this.title});
  @override
  State<AppWebViewPopUp> createState() => _AppWebViewPopUpState();

  static show({
    required String title,
    required String url,
  }) {
    CustomPopUpView.show(
      view: AppWebViewPopUp(url: url, title: title),
    );
  }
}

class _AppWebViewPopUpState extends CustomPopUpViewState<AppWebViewPopUp> {
  late WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()..setJavaScriptMode(JavaScriptMode.unrestricted);
    setHeaders(widget.url);
  }

  void setHeaders(String? url) {
    if (url == null) return;
    controller.loadRequest(
      Uri.parse(url),
    );
  }

  @override
  Widget buildContent(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8, right: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: 54),
              Flexible(
                child: Text(
                  widget.title.toUpperCase(),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: context.theme.appTextTheme.subtitle1,
                ),
              ),
              IconButton(
                padding: EdgeInsets.zero,
                onPressed: Navigator.of(context).pop,
                icon: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.withOpacity(0.2)),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.close_rounded),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Expanded(
          child: Container(
            color: context.theme.scaffoldBackgroundColor,
            child: WebViewWidget(
              controller: controller,
              gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{}..add(
                  Factory<EagerGestureRecognizer>(() => EagerGestureRecognizer()),
                ),
            ),
          ),
        ),
      ],
    );
  }
}
