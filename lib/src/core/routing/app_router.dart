import 'package:flutter/cupertino.dart';
import 'package:phrasly_ai_tools/src/core/routing/app_shell.dart';
import 'package:phrasly_ai_tools/src/core/routing/guards/auth_guard.dart';
import 'package:phrasly_ai_tools/src/core/routing/page_transitions.dart';
import 'package:phrasly_ai_tools/src/core/routing/tabs/documents_tab.dart';
import 'package:phrasly_ai_tools/src/core/routing/tabs/home_tab.dart';
import 'package:phrasly_ai_tools/src/core/routing/tabs/profile_tab.dart';
import 'package:phrasly_ai_tools/src/core/services/logger/logger.dart';
import 'package:phrasly_ai_tools/src/features/detector/presentation/pages/detector_page.dart';
import 'package:phrasly_ai_tools/src/features/dev/presentation/views/dev_mode_view.dart';
import 'package:phrasly_ai_tools/src/features/documents/data/models/history_item.dart';
import 'package:phrasly_ai_tools/src/features/generator/presentation/pages/generator_detail_page.dart';
import 'package:phrasly_ai_tools/src/features/generator/presentation/pages/generator_page.dart';
import 'package:phrasly_ai_tools/src/features/home/presentation/pages/home_page.dart';
import 'package:phrasly_ai_tools/src/features/humanizer/presentation/pages/humanizer_detail_page.dart';
import 'package:phrasly_ai_tools/src/features/humanizer/presentation/pages/humanizer_page.dart';
import 'package:phrasly_ai_tools/src/features/languages/presentation/pages/language_page.dart';
import 'package:phrasly_ai_tools/src/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:phrasly_ai_tools/src/features/onboarding/presentation/pages/splash_page.dart';
import 'package:phrasly_ai_tools/src/features/theme/presentation/pages/theme_page.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

class AppRouter {
  static const String baseRoute = '/';
  static const String defaultRoute = SplashPage.routeName;

  final _logger = getLogger('AppRouter');

  GoRouter createRouter() {
    return GoRouter(
      navigatorKey: rootNavigatorKey,
      initialLocation: baseRoute,
      redirect: AuthGuard(_logger).redirect,
      routes: [
        _statefulShellRoute(),
        ..._otherRoutes(),
      ],
    );
  }

  StatefulShellRoute _statefulShellRoute() {
    return StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) => AppShell(navigationShell: navigationShell),
      branches: [
        documentsTabBranch,
        homeTabBranch,
        profileTabBranch,
      ],
    );
  }

  List<GoRoute> _otherRoutes() {
    return [
      GoRoute(
        path: DevModeView.routeName,
        pageBuilder: (context, state) => CupertinoPage(child: DevModeView()),
      ),
      GoRoute(
        path: ThemePage.routeName,
        pageBuilder: (context, state) => CupertinoPage(child: ThemePage()),
      ),
      GoRoute(
        path: LanguagePage.routeName,
        pageBuilder: (context, state) => CupertinoPage(child: LanguagePage()),
      ),
      GoRoute(
        path: DetectorPage.routeName,
        pageBuilder: (context, state) => PageTransitions.slideUpTransition(
          child: const DetectorPage(),
        ),
      ),
      GoRoute(
        path: GeneratorPage.routeName,
        pageBuilder: (context, state) => PageTransitions.slideUpTransition(
          child: const GeneratorPage(),
        ),
      ),
      GoRoute(
        path: HumanizerPage.routeName,
        pageBuilder: (context, state) => PageTransitions.slideUpTransition(
          child: HumanizerPage(text: state.extra as String?),
        ),
      ),
      GoRoute(
        path: HumanizerDetailPage.routeName,
        pageBuilder: (context, state) => PageTransitions.slideUpTransition(
          child: HumanizerDetailPage(
            text: state.extra is String ? state.extra as String : null,
            historyItem: state.extra as HistoryItem,
          ),
        ),
      ),
      GoRoute(
        path: GeneratorDetailPage.routeName,
        pageBuilder: (context, state) => PageTransitions.slideUpTransition(
          child: GeneratorDetailPage(
            text: state.extra is String ? state.extra as String : null,
            historyItem: state.extra as HistoryItem,
          ),
        ),
      ),
      GoRoute(
        path: SplashPage.routeName,
        redirect: (context, state) {
          if (SplashPage.checkOnboardingCompleted()) {
            return HomePage.routeName;
          }
          return null;
        },
        pageBuilder: (context, state) => CupertinoPage(child: SplashPage()),
      ),
      GoRoute(
        path: OnboardingPage.routeName,
        pageBuilder: (context, state) => PageTransitions.fadeTransition(child: OnboardingPage()),
      ),
    ];
  }
}
