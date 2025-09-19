import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:phrasly_ai_tools/src/core/components/layouts/buttons/app_cuppertino_button.dart';
import 'package:phrasly_ai_tools/src/core/components/layouts/buttons/gradient_button.dart';
import 'package:phrasly_ai_tools/src/core/components/pop_up/slide_up_pop_up.dart';
import 'package:phrasly_ai_tools/src/core/constants/hive_config.dart';
import 'package:phrasly_ai_tools/src/core/routing/app_bottom_nav.dart';
import 'package:phrasly_ai_tools/src/core/routing/app_router.dart';
import 'package:phrasly_ai_tools/src/core/services/locator/locator.dart';
import 'package:phrasly_ai_tools/src/core/services/remote_config/remote_config_service.dart';
import 'package:phrasly_ai_tools/src/core/services/theme/app_colors.dart';
import 'package:phrasly_ai_tools/src/core/services/theme/app_theme.dart';
import 'package:phrasly_ai_tools/src/core/utils/utils.dart';
import 'package:phrasly_ai_tools/src/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:phrasly_ai_tools/src/features/dev/presentation/views/app_version_widget.dart';
import 'package:phrasly_ai_tools/src/features/home/presentation/pages/home_page.dart';
import 'package:phrasly_ai_tools/src/features/profile/presentation/widgets/settings_card_section.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    final configData = locator<RemoteConfigService>().data.settings;
    bool allLegalLinksEmpty = configData.privacyPolicyUrl.isEmpty &&
        configData.termsOfServiceUrl.isEmpty &&
        configData.aboutUrl.isEmpty &&
        configData.helpAndSupportUrl.isEmpty &&
        configData.contactUsEmail.isEmpty;

    return ListView(
      padding: AppBottomNavigationBar.scrollViewPadding.copyWith(top: 20),
      children: <Widget>[
        if (!allLegalLinksEmpty)
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: SettingsCardSection(
              title: 'Legal & Support',
              icon: Icon(
                Icons.description_outlined,
                color: context.appColors.primary,
              ),
              children: <Widget>[
                if (configData.privacyPolicyUrl.isNotEmpty)
                  SettingsCardItem(
                    title: 'Privacy Policy',
                    subTitle: 'How we protect your data',
                    reverseTextStyle: true,
                    icon: Icon(
                      Icons.back_hand_outlined,
                      color: AppColors.green,
                    ),
                    onTap: () {
                      launchUrl(Uri.parse(configData.privacyPolicyUrl));
                    },
                  ),
                if (configData.termsOfServiceUrl.isNotEmpty)
                  SettingsCardItem(
                    title: 'Terms of Service',
                    subTitle: 'Usage terms and conditions',
                    reverseTextStyle: true,
                    icon: Icon(
                      Icons.description_outlined,
                      color: context.appColors.primary,
                    ),
                    onTap: () {
                      launchUrl(Uri.parse(configData.termsOfServiceUrl));
                    },
                  ),
                if (configData.aboutUrl.isNotEmpty)
                  SettingsCardItem(
                    title: 'About',
                    subTitle: 'App version and credits',
                    reverseTextStyle: true,
                    icon: Icon(
                      Icons.info_outline,
                      color: AppColors.purple,
                    ),
                    onTap: () {
                      launchUrl(Uri.parse(configData.aboutUrl));
                    },
                  ),
                if (configData.helpAndSupportUrl.isNotEmpty)
                  SettingsCardItem(
                    title: 'Help & Support',
                    subTitle: 'Get help and contact us',
                    reverseTextStyle: true,
                    icon: Icon(
                      Icons.help_outline,
                      color: AppColors.orange,
                    ),
                    onTap: () {
                      launchUrl(Uri.parse(configData.helpAndSupportUrl));
                    },
                  ),
                if (configData.contactUsEmail.isNotEmpty)
                  SettingsCardItem(
                    title: 'Contact Us',
                    subTitle: 'Send us feedback',
                    reverseTextStyle: true,
                    icon: Icon(
                      Icons.mail_outline,
                      color: AppColors.red,
                    ),
                    onTap: () {
                      launchUrl(Uri.parse('mailto:${configData.contactUsEmail}'));
                    },
                  ),
              ],
            ),
          ),
        // here
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Utils.hexToColor('#F8EFF0'),
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: Utils.hexToColor('#FF3B2F'), width: 0.2),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.warning_amber_rounded,
                    color: AppColors.red,
                    size: 20,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'Danger Zone',
                    style: context.appTextTheme.subtitle2.copyWith(
                      color: AppColors.red,
                    ),
                  ),
                ],
              ),
              if (configData.accountDeletionUrl.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: AppCupertinoButton(
                    onTap: () {
                      launchUrl(Uri.parse(configData.accountDeletionUrl));
                    },
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppColors.red.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.delete_outline,
                            color: AppColors.red,
                            size: 20,
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Delete Account',
                                  style: context.appTextTheme.body3Light.copyWith(
                                    color: AppColors.red,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Permanently delete your account',
                                  style: context.appTextTheme.body3Light,
                                ),
                              ],
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 13,
                            color: AppColors.red,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              const SizedBox(height: 12),
              AppCupertinoButton(
                onTap: () => clearAllData(context),
                loadingWidget: (isLoading) => AnimatedSwitcher(
                  duration: Duration(milliseconds: 300),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColors.red.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.refresh_outlined,
                          color: AppColors.red,
                          size: 20,
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Reset App Data',
                                style: context.appTextTheme.body3Light.copyWith(
                                  color: AppColors.red,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text('Clear all app data and settings', style: context.appTextTheme.body3Light),
                            ],
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 13,
                          color: AppColors.red,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              BlocBuilder<AuthCubit, AuthState>(
                builder: (context, state) {
                  if (state is! AuthStateAuthenticated) {
                    return const SizedBox.shrink();
                  }
                  return Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: AppCupertinoButton(
                      onTap: () async {
                        await locator<AuthCubit>().logout();
                        context.go(HomePage.routeName);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: AppColors.red.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.logout_outlined,
                              color: AppColors.red,
                              size: 20,
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Logout',
                                    style: context.appTextTheme.body3Light.copyWith(
                                      color: AppColors.red,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text('Logout from your account', style: context.appTextTheme.body3Light),
                                ],
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 13,
                              color: AppColors.red,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        AppVersionWidget(),
      ],
    );
  }

  void clearAllData(BuildContext context) {
    SlideUpPopUp.show(
      context: context,
      itemBuilder: (dialogContext) => Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Clear All Data', style: context.appTextTheme.subtitle1),
            Text(
              'Are you sure you want to delete all data? This action will log you out and clear all data.',
              style: context.appTextTheme.body2Light,
            ),
            const SizedBox(height: 20),
            Row(
              spacing: 16,
              children: [
                Expanded(
                  child: GradientButton(
                    onPressed: () {
                      Navigator.of(dialogContext).pop();
                    },
                    label: 'Cancel',
                    gradientColors: [],
                    forceButtonColor: context.appColors.secondary,
                    textColor: context.appColors.onSecondary,
                  ),
                ),
                Expanded(
                  child: GradientButton(
                    isAsync: true,
                    onPressed: () async {
                      await Future.delayed(Duration(seconds: 1));
                      await clearAllHiveBoxes();
                      await locator<AuthCubit>().logout();
                      context.go(AppRouter.baseRoute);
                      Navigator.of(dialogContext).pop();
                    },
                    label: 'Clear',
                    gradientColors: [],
                    forceButtonColor: context.appColors.error,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
