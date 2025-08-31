import 'package:flutter/material.dart';
import 'package:flutter_app_template/src/core/routing/app_bottom_nav.dart';
import 'package:flutter_app_template/src/core/services/theme/app_colors.dart';
import 'package:flutter_app_template/src/core/services/theme/app_theme.dart';
import 'package:flutter_app_template/src/features/profile/presentation/widgets/settings_card_section.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: AppBottomNavigationBar.scrollViewPadding.copyWith(top: 20),
      children: <Widget>[
        SettingsCardSection(
          title: 'Personal Information',
          icon: Icon(
            Icons.person,
            color: context.appColors.primary,
          ),
          children: <Widget>[
            SettingsCardItem(
              title: 'Name',
              subTitle: 'Alex Johnson',
              icon: Icon(Icons.person_outline, color: context.appColors.primary),
              onTap: () {},
            ),
            SettingsCardItem(
              title: 'Location',
              subTitle: 'San Francisco, CA',
              icon: Icon(Icons.near_me_outlined, color: context.appColors.primary),
              onTap: () {},
            ),
            SettingsCardItem(
              title: 'Rate Us',
              subTitle: '★★★★★',
              icon: Icon(Icons.star, color: context.appColors.primary),
              onTap: () {},
            ),
          ],
        ),
        SizedBox(height: 20),
        SettingsCardSection(
          title: 'Writing Preferences',
          icon: Icon(
            FontAwesomeIcons.sliders,
            size: 18,
            color: context.appColors.primary,
          ),
          children: <Widget>[
            SettingsCardItem(
              title: 'Preferred Language',
              subTitle: 'English',
              icon: Icon(Icons.language, color: context.appColors.primary),
              onTap: () {},
            ),
            SettingsCardItem(
              title: 'Writing Style',
              subTitle: 'Professional',
              icon: Icon(Icons.edit, color: context.appColors.primary),
              onTap: () {},
            ),
            SettingsCardItem(
              title: 'Auto Save',
              reverseTextStyle: true,
              subTitle: 'Automatically save your work',
              icon: Icon(Icons.autorenew, color: AppColors.green),
              action: Switch(
                value: true,
                onChanged: (value) {},
                thumbColor: WidgetStateProperty.all(Colors.white),
                activeTrackColor: AppColors.green,
                inactiveTrackColor: context.appColors.borderColor,
                trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
              ),
            ),
            SettingsCardItem(
              title: 'Writing Tips',
              reverseTextStyle: true,
              subTitle: 'Show helpful writing suggestions',
              icon: Icon(Icons.lightbulb_outline, color: AppColors.yellow),
              action: Switch(
                value: true,
                onChanged: (value) {},
                thumbColor: WidgetStateProperty.all(Colors.white),
                activeTrackColor: AppColors.yellow,
                inactiveTrackColor: context.appColors.borderColor,
                trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        SettingsCardSection(
          title: 'Quick Actions',
          icon: Icon(
            FontAwesomeIcons.gear,
            size: 18,
            color: context.appColors.primary,
          ),
          children: <Widget>[
            SettingsCardItem(
              title: 'Upgrade to Pro',
              reverseTextStyle: true,
              subTitle: 'Unlock all features & remove limits',
              icon: Icon(
                Icons.arrow_circle_up_outlined,
                color: AppColors.orange,
              ),
              onTap: () {
                // TODO: Implement upgrade to pro action
              },
            ),
            SettingsCardItem(
              title: 'Export Data',
              reverseTextStyle: true,
              subTitle: 'Download your documents & settings',
              icon: Icon(
                Icons.file_download_outlined,
                color: context.appColors.primary,
              ),
              onTap: () {
                // TODO: Implement export data action
              },
            ),
            SettingsCardItem(
              title: 'Backup to iCloud',
              reverseTextStyle: true,
              subTitle: 'Sync your data across devices',
              icon: Icon(
                Icons.cloud_outlined,
                color: AppColors.green,
              ),
              onTap: () {
                // TODO: Implement backup to iCloud action
              },
            ),
            SettingsCardItem(
              title: 'Share App',
              reverseTextStyle: true,
              subTitle: 'Tell friends about this amazing tool',
              icon: Icon(
                Icons.ios_share_outlined,
                color: AppColors.purple,
              ),
              onTap: () {
                // TODO: Implement share app action
              },
            ),
          ],
        ),
      ],
    );
  }
}
