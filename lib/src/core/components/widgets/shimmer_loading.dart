import 'package:flutter/material.dart';
import 'package:phrasly_ai_tools/src/core/services/theme/app_theme.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoadingAnimation extends StatelessWidget {
  final Widget child;
  final bool isLoading;
  const ShimmerLoadingAnimation({super.key, required this.child, required this.isLoading});

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Shimmer.fromColors(
            baseColor: context.theme.appColors.textColor.withOpacity(0.1),
            highlightColor: context.theme.appColors.textColor.withOpacity(0.36),
            child: child,
          )
        : child;
  }
}
