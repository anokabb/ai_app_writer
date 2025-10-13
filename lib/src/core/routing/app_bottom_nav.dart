import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:phrasly_ai_tools/src/core/extensions/context_extension.dart';
import 'package:phrasly_ai_tools/src/core/gen/assets.gen.dart';
import 'package:phrasly_ai_tools/src/core/services/theme/app_theme.dart';

class AppBottomNavigationBar extends StatefulWidget {
  static const double fabBottomPadding = 40;
  static const EdgeInsets scrollViewPadding =
      EdgeInsets.fromLTRB(16, 16, 16, 16 + fabBottomPadding + kBottomNavigationBarHeight + 28);

  final int currentIndex;
  final Function(int) onTap;

  const AppBottomNavigationBar({
    required this.currentIndex,
    required this.onTap,
    super.key,
  });

  @override
  State<AppBottomNavigationBar> createState() => _AppBottomNavigationBarState();
}

class _AppBottomNavigationBarState extends State<AppBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -3),
            spreadRadius: 0,
          ),
        ],
      ),
      child: ClipPath(
        clipper: _BottomNavClipper(),
        child: Container(
          height: kBottomNavigationBarHeight + MediaQuery.of(context).padding.bottom + (Platform.isAndroid ? 16 : 0),
          decoration: BoxDecoration(
            color: context.appColors.secondaryBackground,
          ),
          padding: EdgeInsets.only(bottom: Platform.isAndroid ? 0 : 20),
          child: Row(
            children: [
              Expanded(
                child: _buildNavItem(
                  0,
                  context.localization.documents,
                  Assets.svg.docs,
                ),
              ),
              const SizedBox(width: 80), // Space for FAB
              Expanded(
                child: _buildNavItem(
                  2,
                  context.localization.profile,
                  Assets.svg.profile,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, String label, String svgAsset) {
    final isActive = widget.currentIndex == index;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 240),
      curve: Curves.easeOutCubic,
      child: GestureDetector(
        onTap: () => widget.onTap(index),
        behavior: HitTestBehavior.opaque,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedScale(
                scale: isActive ? 1.0 : 0.96,
                duration: const Duration(milliseconds: 240),
                curve: Curves.easeOutCubic,
                child: SvgPicture.asset(
                  svgAsset,
                  colorFilter: isActive ? ColorFilter.mode(context.appColors.primary, BlendMode.srcIn) : null,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                label,
                style: context.appTextTheme.body3.copyWith(
                  color: isActive ? context.appColors.primary : context.appColors.lightTextColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BottomNavClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    // Start from top-left
    path.moveTo(0, 0);

    // This path creates a rectangular bar with a central concave notch (for a FAB).
    // The notch is smooth and wide, matching the provided image.

    // Parameters for the notch
    final double notchRadius = 40; // Radius of the notch curve
    final double notchWidth = 120.0; // Width of the notch opening
    final double notchDepth = 36.0; // How deep the notch goes down

    final double centerX = size.width / 2;
    final double leftNotchStart = centerX - notchWidth / 2;
    final double rightNotchEnd = centerX + notchWidth / 2;

    // Top edge to left of notch
    path.lineTo(leftNotchStart, 0);

    final double notchStart = leftNotchStart + 20;
    final double notchEnd = rightNotchEnd - 20;

    // Left curve into notch
    path.cubicTo(
      notchStart, 0, // Control point 1 (gentle start)
      centerX - notchRadius, notchDepth, // Control point 2 (downward curve)
      centerX, notchDepth, // End at bottom center of notch
    );

    // Right curve out of notch
    path.cubicTo(
      centerX + notchRadius, notchDepth, // Control point 1 (upward curve)
      notchEnd, 0, // Control point 2 (gentle end)
      rightNotchEnd, 0, // End at right edge of notch
    );

    // Top edge to top-right
    path.lineTo(size.width, 0);

    // Down right edge
    path.lineTo(size.width, size.height);

    // Bottom edge
    path.lineTo(0, size.height);

    // Up left edge
    path.lineTo(0, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
