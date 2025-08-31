import 'package:flutter/material.dart';
import 'package:flutter_app_template/src/core/components/layouts/buttons/app_cuppertino_button.dart';
import 'package:flutter_app_template/src/core/services/theme/app_theme.dart';
import 'package:flutter_svg/svg.dart';

class TransparentButton extends StatelessWidget {
  final Color primaryColor;
  final String title;
  final String icon;
  final Function() onTap;
  const TransparentButton({
    super.key,
    required this.primaryColor,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AppCupertinoButton(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: primaryColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Row(
          children: <Widget>[
            SvgPicture.asset(
              icon,
              width: 16,
              height: 16,
              colorFilter: ColorFilter.mode(primaryColor, BlendMode.srcIn),
            ),
            SizedBox(width: 4),
            Text(
              title,
              style: context.appTextTheme.subtitle3.copyWith(color: primaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
