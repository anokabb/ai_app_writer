import 'package:flutter/material.dart';
import 'package:flutter_app_template/src/core/components/widgets/app_card.dart';
import 'package:flutter_app_template/src/core/services/theme/app_theme.dart';
import 'package:flutter_app_template/src/core/utils/utils.dart';

class WelcomeCard extends StatelessWidget {
  const WelcomeCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Row(
        spacing: 20,
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 2,
              children: <Widget>[
                Text(
                  'Good morning, Alex 👋',
                  style: context.appTextTheme.title4,
                ),
                Text(
                  'Ready to create something amazing?',
                  style: context.appTextTheme.body3Light,
                )
              ],
            ),
          ),
          Container(
            width: 46,
            height: 46,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  Utils.hexToColor('#6170F4'),
                  Utils.hexToColor('#8667EA'),
                ],
              ),
            ),
            child: Text(
              'A',
              style: context.appTextTheme.title1.copyWith(
                color: context.appColors.onPrimary,
              ),
            ),
          )
        ],
      ),
    );
  }
}
