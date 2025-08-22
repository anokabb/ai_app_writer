import 'package:flutter/cupertino.dart';
import 'package:flutter_app_template/src/features/home/presentation/pages/home_page.dart';
import 'package:flutter_app_template/src/features/humanizer/presentation/pages/humanizer_page.dart';
import 'package:flutter_app_template/src/features/writer/presentation/pages/writer_page.dart';
import 'package:flutter_app_template/src/features/detector/presentation/pages/detector_page.dart';
import 'package:go_router/go_router.dart';

final homeTabBranch = StatefulShellBranch(
  routes: [
    GoRoute(
      path: HomePage.routeName,
      pageBuilder: (context, state) => const CupertinoPage(child: HomePage()),
      routes: [
        GoRoute(
          path: 'humanizer',
          pageBuilder: (context, state) => const CupertinoPage(child: HumanizerPage()),
        ),
        GoRoute(
          path: 'writer',
          pageBuilder: (context, state) => const CupertinoPage(child: WriterPage()),
        ),
        GoRoute(
          path: 'detector',
          pageBuilder: (context, state) => const CupertinoPage(child: DetectorPage()),
        ),
      ],
    ),
  ],
);
