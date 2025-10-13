import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:phrasly_ai_tools/src/core/routing/app_router.dart';

class SlideUpPopUp extends StatelessWidget {
  final Widget child;
  final EdgeInsets? margin;
  final double? width;
  final BorderRadius? borderRadius;
  final Color? backgroundColor;

  const SlideUpPopUp({
    super.key,
    required this.child,
    this.margin,
    this.width,
    this.borderRadius,
    this.backgroundColor,
  });

  static Future<T?> show<T>({
    required BuildContext context,
    Widget? child,
    EdgeInsets? margin,
    double? width,
    BorderRadius? borderRadius,
    Color? backgroundColor,
    bool isDismissible = true,
    Widget Function(BuildContext dialogContext)? itemBuilder,
  }) {
    BuildContext? currentContext = rootNavigatorKey.currentContext ?? context;
    final screenSize = MediaQuery.of(currentContext).size;
    final defaultMargin = EdgeInsets.only(
      left: 20,
      right: 20,
      bottom: MediaQuery.of(currentContext).viewPadding.bottom,
    );

    return Navigator.of(currentContext).push<T>(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => Stack(
          children: [
            // Blur layer with fade animation
            AnimatedBuilder(
              animation: animation,
              builder: (context, child) {
                return GestureDetector(
                  onTap: isDismissible ? () => Navigator.of(context).pop() : null,
                  child: FadeTransition(
                    opacity: CurvedAnimation(
                      parent: animation,
                      curve: Curves.easeOut,
                    ),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 10 * animation.value,
                        sigmaY: 10 * animation.value,
                      ),
                      child: Container(
                        color: Colors.black.withAlpha((0.5 * 255).toInt()),
                      ),
                    ),
                  ),
                );
              },
            ),

            // Content with slide animation
            AnimatedBuilder(
              animation: animation,
              builder: (context, child) {
                const begin = Offset(0.0, 1.0);
                const end = Offset.zero;
                const curve = Curves.easeOutCubic;
                var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                var offsetAnimation = animation.drive(tween);

                return SlideTransition(
                  position: offsetAnimation,
                  child: child!,
                );
              },
              child: SafeArea(
                child: SlideUpPopUp(
                  margin: margin ?? defaultMargin,
                  width: width ?? screenSize.width,
                  borderRadius: borderRadius ?? BorderRadius.circular(12),
                  backgroundColor: backgroundColor ?? Colors.white,
                  child: itemBuilder != null ? itemBuilder(context) : (child ?? const SizedBox.shrink()),
                ),
              ),
            ),
          ],
        ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return child;
        },
        opaque: false,
        barrierDismissible: isDismissible,
        barrierColor: Colors.transparent,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.only(bottom: Platform.isAndroid ? 24 : 0),
        child: Container(
          width: width,
          margin: margin,
          child: Material(
            color: Colors.transparent,
            child: Container(
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: borderRadius,
              ),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
