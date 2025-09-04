import 'package:flutter/material.dart';
import 'package:phrasly_ai_tools/src/core/components/widgets/app_card.dart';
import 'package:phrasly_ai_tools/src/core/services/theme/app_theme.dart';
import 'package:phrasly_ai_tools/src/core/utils/utils.dart';

class SettingsCardSection extends StatelessWidget {
  final String title;
  final Widget icon;
  final List<Widget> children;
  const SettingsCardSection({super.key, required this.title, required this.icon, required this.children});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        spacing: 10,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              children: <Widget>[
                icon,
                SizedBox(width: 10),
                Text(
                  title,
                  style: context.appTextTheme.subtitle2,
                ),
              ],
            ),
          ),
          ...children,
        ],
      ),
    );
  }
}

class SettingsCardItem extends StatelessWidget {
  final String title;
  final String? subTitle;
  final Widget icon;
  final Function()? onTap;
  final Widget? action;
  final bool reverseTextStyle;
  const SettingsCardItem({
    super.key,
    required this.title,
    this.subTitle,
    required this.icon,
    this.onTap,
    this.action,
    this.reverseTextStyle = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Utils.hexToColor('#F2F2F7'),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            icon,
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: reverseTextStyle ? context.appTextTheme.subtitle3 : context.appTextTheme.body3Light,
                  ),
                  if (subTitle != null && subTitle!.isNotEmpty)
                    Text(
                      subTitle!,
                      style: reverseTextStyle ? context.appTextTheme.body3Light : context.appTextTheme.subtitle3,
                    ),
                ],
              ),
            ),
            if (action != null) ...[
              const SizedBox(width: 12),
              action!,
            ] else if (onTap != null) ...[
              Icon(
                Icons.arrow_forward_ios_rounded,
                size: 13,
                color: context.appColors.lightTextColor,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
