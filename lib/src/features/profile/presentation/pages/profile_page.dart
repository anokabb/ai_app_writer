import 'package:flutter/material.dart';
import 'package:flutter_app_template/src/core/services/theme/app_theme.dart';
import 'package:flutter_app_template/src/core/utils/utils.dart';
import 'package:flutter_app_template/src/features/profile/presentation/widgets/profile_tab.dart';
import 'package:flutter_app_template/src/features/profile/presentation/widgets/settings_tab.dart';
import 'package:flutter_app_template/src/features/profile/presentation/widgets/user_info.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfilePage extends StatefulWidget {
  static const String routeName = '/profile';

  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> with SingleTickerProviderStateMixin {
  late final TabController _tabController = TabController(length: 2, vsync: this);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Column(
                children: <Widget>[
                  UserInfo(),
                  SizedBox(height: 20),
                  TableSection(tabController: _tabController),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  ProfileTab(),
                  SettingsTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TableSection extends StatelessWidget {
  const TableSection({
    super.key,
    required TabController tabController,
  }) : _tabController = tabController;

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Utils.hexToColor('#F4F3F3'),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Utils.hexToColor('#1B62B2'),
          width: 0.25,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(7),
        child: TabBar(
          dividerHeight: 0,
          controller: _tabController,
          labelStyle: context.appTextTheme.subtitle2,
          labelColor: context.appColors.onPrimary,
          unselectedLabelColor: context.appColors.textColor,
          indicatorColor: context.theme.appColors.primary,
          indicatorSize: TabBarIndicatorSize.tab,
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              colors: [
                Utils.hexToColor('#0A7ADF'),
                Utils.hexToColor('#035093'),
              ],
            ),
          ),
          tabs: [
            Tab(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 6,
              children: <Widget>[
                Icon(
                  FontAwesomeIcons.circleUser,
                  size: 18,
                ),
                Text('Profile'),
              ],
            )),
            Tab(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 6,
              children: <Widget>[
                Icon(
                  FontAwesomeIcons.gear,
                  size: 18,
                ),
                Text('Settings'),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
