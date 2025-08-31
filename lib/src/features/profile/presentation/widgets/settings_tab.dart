import 'package:flutter/material.dart';
import 'package:flutter_app_template/src/core/routing/app_bottom_nav.dart';
import 'package:flutter_app_template/src/core/services/theme/app_colors.dart';
import 'package:flutter_app_template/src/core/services/theme/app_theme.dart';
import 'package:flutter_app_template/src/core/utils/utils.dart';
import 'package:flutter_app_template/src/features/profile/presentation/widgets/settings_card_section.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: AppBottomNavigationBar.scrollViewPadding.copyWith(top: 20),
      children: <Widget>[
        SettingsCardSection(
          title: 'Legal & Support',
          icon: Icon(
            Icons.description_outlined,
            color: context.appColors.primary,
          ),
          children: <Widget>[
            SettingsCardItem(
              title: 'Privacy Policy',
              subTitle: 'How we protect your data',
              reverseTextStyle: true,
              icon: Icon(
                Icons.back_hand_outlined,
                color: AppColors.green,
              ),
              onTap: () {
                // TODO: Implement privacy policy action
              },
            ),
            SettingsCardItem(
              title: 'Terms of Service',
              subTitle: 'Usage terms and conditions',
              reverseTextStyle: true,
              icon: Icon(
                Icons.description_outlined,
                color: context.appColors.primary,
              ),
              onTap: () {
                // TODO: Implement terms of service action
              },
            ),
            SettingsCardItem(
              title: 'About',
              subTitle: 'App version and credits',
              reverseTextStyle: true,
              icon: Icon(
                Icons.info_outline,
                color: AppColors.purple,
              ),
              onTap: () {
                // TODO: Implement about action
              },
            ),
            SettingsCardItem(
              title: 'Help & Support',
              subTitle: 'Get help and contact us',
              reverseTextStyle: true,
              icon: Icon(
                Icons.help_outline,
                color: AppColors.orange,
              ),
              onTap: () {
                // TODO: Implement help & support action
              },
            ),
            SettingsCardItem(
              title: 'Contact Us',
              subTitle: 'Send us feedback',
              reverseTextStyle: true,
              icon: Icon(
                Icons.mail_outline,
                color: AppColors.red,
              ),
              onTap: () {
                // TODO: Implement contact us action
              },
            ),
          ],
        ),
        SizedBox(height: 20),
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
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  // TODO: Implement delete account action
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
              const SizedBox(height: 12),
              GestureDetector(
                onTap: () {
                  // TODO: Implement reset app data action
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
            ],
          ),
        ),
      ],
    );
  }
}
