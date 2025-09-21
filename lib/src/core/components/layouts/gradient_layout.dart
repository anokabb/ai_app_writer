import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:phrasly_ai_tools/src/core/components/layouts/buttons/app_cuppertino_button.dart';
import 'package:phrasly_ai_tools/src/core/services/theme/app_theme.dart';

class GradientLayout extends StatelessWidget {
  final String title;
  final List<Color> colors;
  final Widget child;
  const GradientLayout({super.key, required this.title, required this.colors, required this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: colors,
                ),
              ),
              child: Row(
                children: [
                  AppCupertinoButton(
                    onTap: () => Navigator.of(context).pop(),
                    child: SizedBox(
                      width: 60,
                      height: 60,
                      child: Icon(
                        FontAwesomeIcons.solidCircleXmark,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Text(
                          title,
                          textAlign: TextAlign.center,
                          style: context.appTextTheme.subtitle2.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 60),
                ],
              ),
            ),
            Expanded(child: child),
          ],
        ),
      ),
    );
  }
}
