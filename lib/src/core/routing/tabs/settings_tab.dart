import 'package:flutter/cupertino.dart';
import 'package:flutter_app_template/src/features/settings/presentation/pages/settings_page.dart';
import 'package:go_router/go_router.dart';

final settingsTabBranch = StatefulShellBranch(
  routes: [
    GoRoute(
      path: SettingsPage.routeName,
      pageBuilder: (context, state) => const CupertinoPage(child: SettingsPage()),
      routes: [
      ],
    ),
  ],
);