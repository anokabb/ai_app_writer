import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PageTransitions {
  static CustomTransitionPage slideUpTransition({
    required Widget child,
  }) {
    return CustomTransitionPage(
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, 1),
            end: Offset.zero,
          ).animate(CurvedAnimation(
            parent: animation,
            curve: Curves.ease,
          )),
          child: child,
        );
      },
    );
  }
}
