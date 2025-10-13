import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:phrasly_ai_tools/l10n/app_localizations.dart';
import 'package:phrasly_ai_tools/src/core/components/layouts/buttons/gradient_button.dart';
import 'package:phrasly_ai_tools/src/core/components/pop_up/app_pop_up.dart';
import 'package:phrasly_ai_tools/src/core/constants/env_config.dart';
import 'package:phrasly_ai_tools/src/core/constants/hive_config.dart';
import 'package:phrasly_ai_tools/src/core/extensions/context_extension.dart';
import 'package:phrasly_ai_tools/src/core/routing/app_router.dart';
import 'package:phrasly_ai_tools/src/core/services/locator/locator.dart';
import 'package:phrasly_ai_tools/src/core/services/remote_config/remote_config_service.dart';
import 'package:phrasly_ai_tools/src/core/services/theme/app_theme.dart';
import 'package:phrasly_ai_tools/src/features/languages/presentation/cubit/language_cubit.dart';
import 'package:phrasly_ai_tools/src/features/theme/presentation/cubit/theme_cubit.dart';
import 'package:upgrader/upgrader.dart';

class App extends StatelessWidget {
  const App({super.key, required this.routerConfig});
  final GoRouter routerConfig;

  @override
  Widget build(BuildContext context) {
    // set to portrait only. Override on specific pages.
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    return MultiBlocProvider(
      providers: blocProviders,
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, themeState) {
          // log(themeMode.name);
          return BlocBuilder<LanguageCubit, Locale?>(
            builder: (context, locale) {
              return MaterialApp.router(
                debugShowCheckedModeBanner: false,
                title: EnvConfig.APP_NAME,
                theme: AppTheme.light(
                  AppTheme.getFontFamily(locale?.languageCode ?? DEFAULT_LANGUAGE.name),
                ),
                themeMode: themeState.themeMode,
                routerConfig: routerConfig,
                localizationsDelegates: AppLocalizations.localizationsDelegates,
                supportedLocales: AppLocalizations.supportedLocales,
                locale: locale,
                builder: (context, child) {
                  Widget upgraderChild = UpgradeAlert(
                    navigatorKey: rootNavigatorKey,
                    barrierDismissible: !locator<RemoteConfigService>().isForceUpdate,
                    dialogStyle: UpgradeDialogStyle.cupertino,
                    upgrader: Upgrader(
                      debugDisplayAlways: devBox.get('debugUpgrader', defaultValue: false),
                      durationUntilAlertAgain: const Duration(days: 1),
                    ),
                    child: child,
                    customDialog: (
                      Key? key,
                      String title,
                      String message,
                      String? releaseNotes,
                      BuildContext context,
                      bool cupertino,
                      UpgraderMessages messages,
                      Function() onIgnore,
                      Function() onUpdate,
                      Function() onCancel,
                    ) {
                      return AppPopUp(
                        title: 'Update Available',
                        description: message,
                        confirmText: context.localization.updateNow.toUpperCase(),
                        onConfirm: onUpdate,
                        confirmButtonColor: context.theme.appColors.primary,
                        actions: [
                          if (!locator<RemoteConfigService>().isForceUpdate)
                            GradientButton(
                              label: context.localization.later.toUpperCase(),
                              textColor: context.theme.appColors.textColor,
                              gradientColors: [
                                context.theme.appColors.secondaryBackground,
                                context.theme.appColors.secondaryBackground
                              ],
                              onPressed: onIgnore,
                            ),
                        ],
                      );
                    },
                  );

                  if (Platform.isAndroid) {
                    return SafeArea(
                      top: false,
                      child: upgraderChild,
                    );
                  }

                  return upgraderChild;
                },
              );
            },
          );
        },
      ),
    );
  }
}
