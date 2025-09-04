import 'package:flutter/cupertino.dart';
import 'package:phrasly_ai_tools/src/features/profile/presentation/pages/profile_page.dart';
import 'package:go_router/go_router.dart';

final profileTabBranch = StatefulShellBranch(
  routes: [
    GoRoute(
      path: ProfilePage.routeName,
      pageBuilder: (context, state) => const CupertinoPage(child: ProfilePage()),
      routes: [],
    ),
  ],
);
