import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:phrasly_ai_tools/src/core/components/widgets/language_selector.dart';
import 'package:phrasly_ai_tools/src/core/constants/hive_config.dart';
import 'package:phrasly_ai_tools/src/core/routing/app_bottom_nav.dart';
import 'package:phrasly_ai_tools/src/core/services/locator/locator.dart';
import 'package:phrasly_ai_tools/src/core/services/theme/app_colors.dart';
import 'package:phrasly_ai_tools/src/core/services/theme/app_theme.dart';
import 'package:phrasly_ai_tools/src/features/auth/data/models/user_model.dart';
import 'package:phrasly_ai_tools/src/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:phrasly_ai_tools/src/features/auth/presentation/widgets/auth_card.dart';
import 'package:phrasly_ai_tools/src/features/profile/presentation/widgets/settings_card_section.dart';
import 'package:phrasly_ai_tools/src/features/settings/presentation/cubit/settings_cubit.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        return BlocBuilder<AuthCubit, AuthState>(
          builder: (context, authState) {
            UserModel? user = authState.maybeWhen(
              authenticated: (user) => user,
              orElse: () => null,
            );

            return ListView(
              padding: AppBottomNavigationBar.scrollViewPadding.copyWith(top: 20),
              children: <Widget>[
                AuthCard(),
                SettingsCardSection(
                  title: 'Personal Information',
                  icon: Icon(
                    Icons.person,
                    color: context.appColors.primary,
                  ),
                  children: <Widget>[
                    SettingsCardItem(
                      title: 'Name',
                      subTitle: user?.name ?? 'Guest User',
                      icon: Icon(Icons.person_outline, color: context.appColors.primary),
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
                      subTitle: settingsBox.get('preferredLanguage', defaultValue: 'English'),
                      icon: Icon(Icons.language, color: context.appColors.primary),
                      onTap: () async {
                        final preferredLanguage = settingsBox.get('preferredLanguage', defaultValue: 'English');
                        final result = await LanguageSelector.pickLanguage(
                          context,
                          languages.firstWhereOrNull((language) => language.name == preferredLanguage) ??
                              languages.first,
                        );
                        if (result != null) {
                          await settingsBox.put('preferredLanguage', result.name);
                          setState(() {});
                        }
                      },
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
                        value: state.settings.autoSaveEnabled,
                        onChanged: (value) {
                          locator<SettingsCubit>().toggleAutoSave();
                        },
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
                        value: state.settings.writingTips,
                        onChanged: (value) {
                          locator<SettingsCubit>().toggleWritingTips();
                        },
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
                    // SettingsCardItem(
                    //   title: 'Export Data',
                    //   reverseTextStyle: true,
                    //   subTitle: 'Download your documents & settings',
                    //   icon: Icon(
                    //     Icons.file_download_outlined,
                    //     color: context.appColors.primary,
                    //   ),
                    //   onTap: () {
                    //     // TODO: Implement export data action
                    //   },
                    // ),
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
          },
        );
      },
    );
  }
}
