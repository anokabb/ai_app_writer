import 'package:flutter/material.dart';
import 'package:flutter_app_template/src/core/components/layouts/buttons/app_cuppertino_button.dart';
import 'package:flutter_app_template/src/core/services/theme/app_theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
        body: SafeArea(
          top: false,
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                padding: EdgeInsets.fromLTRB(
                  16,
                  MediaQuery.of(context).padding.top,
                  16,
                  16,
                ),
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
                      child: Icon(
                        FontAwesomeIcons.solidCircleXmark,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          title,
                          style: context.appTextTheme.subtitle2.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                  ],
                ),
              ),
              Expanded(child: child),
            ],
          ),
        ),
      ),
    );
  }
}
