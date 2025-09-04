import 'package:flutter/material.dart';
import 'package:phrasly_ai_tools/src/core/services/theme/app_theme.dart';

class AppCard extends StatelessWidget {
  final EdgeInsets? padding;
  final Color? color;
  final Widget child;
  final double? radius;
  final String? title;
  final Color? titleColor;
  final Widget? icon;
  final EdgeInsets? titlePadding;

  const AppCard({
    super.key,
    required this.child,
    this.padding,
    this.color,
    this.radius,
    this.title,
    this.titleColor,
    this.icon,
    this.titlePadding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color ?? context.appColors.secondaryBackground,
        borderRadius: BorderRadius.circular(radius ?? 14),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 14,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null || icon != null)
            Padding(
              padding: titlePadding ?? const EdgeInsets.only(bottom: 16),
              child: Row(
                spacing: 8,
                children: <Widget>[
                  if (icon != null) icon!,
                  Text(
                    title ?? '',
                    style: context.appTextTheme.subtitle2.copyWith(
                      color: titleColor,
                    ),
                  ),
                ],
              ),
            ),
          Flexible(child: child),
        ],
      ),
    );
  }
}
