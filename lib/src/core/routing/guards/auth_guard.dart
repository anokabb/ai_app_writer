import 'package:flutter/widgets.dart';
import 'package:flutter_app_template/src/core/routing/app_router.dart';
import 'package:flutter_app_template/src/features/dev/presentation/views/dev_mode_view.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';

class AuthGuard {
  final Logger _logger;
  AuthGuard(this._logger);

  final List<String> publicRoutes = [
    // LoginPage.routeName,
    // RegisterPage.routeName,
    // ForgotPasswordPage.routeName,
    // OtpVerificationPage.routeName,
    // ResetPasswordPage.routeName,
    DevModeView.routeName,
  ];

  Future<String?> redirect(BuildContext context, GoRouterState state) async {
    // _logger.i('Redirect => ${state.uri.path}');

    // final isLoggedIn = locator<AuthCubit>().isLoggedIn;
    final path = state.uri.path;

    // // Allow access to public routes without authentication
    // if (publicRoutes.contains(path)) {
    //   return null;
    // }

    // // Redirect logged-in users away from the login page
    // if (path == LoginPage.routeName && isLoggedIn) {
    //   return HomePage.routeName;
    // }

    // // Redirect unauthenticated users to the login page
    // if (!isLoggedIn) {
    //   return LoginPage.routeName;
    // }

    // Allow access to authenticated routes
    return path == AppRouter.baseRoute ? AppRouter.defaultRoute : null;
  }
}
