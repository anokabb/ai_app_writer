import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:phrasly_ai_tools/src/core/components/dropdown_button/app_dropdown_menu.dart';
import 'package:phrasly_ai_tools/src/core/components/dropdown_button/dropdown_model.dart';
import 'package:phrasly_ai_tools/src/core/components/layouts/buttons/app_button.dart';
import 'package:phrasly_ai_tools/src/core/constants/env_config.dart';
import 'package:phrasly_ai_tools/src/core/constants/hive_config.dart';
import 'package:phrasly_ai_tools/src/core/services/locator/locator.dart';
import 'package:phrasly_ai_tools/src/core/services/notifications/notification_service.dart';
import 'package:phrasly_ai_tools/src/core/services/remote_config/remote_config_service.dart';
import 'package:phrasly_ai_tools/src/core/services/theme/app_colors.dart';
import 'package:phrasly_ai_tools/src/core/services/theme/app_theme.dart';
import 'package:restart_app/restart_app.dart';

class DevModeView extends StatefulWidget {
  static const routeName = '/dev-mode';
  const DevModeView({super.key});

  @override
  State<DevModeView> createState() => _DevModeViewState();
}

class _DevModeViewState extends State<DevModeView> {
  String? fcmToken;
  final ValueNotifier<Duration> _timeToExpire = ValueNotifier(Duration.zero);
  Timer? _timer;

  bool debugUpgrader = devBox.get('debugUpgrader', defaultValue: false);
  bool isPro = devBox.get('isDevPro', defaultValue: false);
  Environment currentEnvironment = EnvConfig.currentEnvironment;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      fcm.getToken().then(
            (value) => setState(() {
              fcmToken = value;
            }),
          );
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
    _timeToExpire.dispose();
  }

  String getDetails(PackageInfo info) {
    final remoteConfig = locator<RemoteConfigService>().data;
    final backendUrl = EnvConfig.getBackendBaseUrl(
      betaUrl: remoteConfig.api.backendBaseUrlBeta,
      productionUrl: remoteConfig.api.backendBaseUrlProduction,
    );

    return [
      'Version: ${info.version}',
      'Build Number: ${info.buildNumber}',
      'Package Name: ${info.packageName}',
      'Device: ${Platform.isAndroid ? 'Android' : 'iOS'}',
      'Backend URL: $backendUrl',
      'Open Ai Model: ${remoteConfig.api.defaultModel}',
      'FCM TOKEN: $fcmToken',
    ].join('\n');
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Dev Mode'),
        ),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            AppButton(
              onPressed: () => throw Exception(),
              label: 'Throw Test Exception',
              textColor: AppColors.red,
              isTextButton: true,
            ),
            SizedBox(height: 16),
            Text(
              'App Information',
              style: context.theme.appTextTheme.body1.copyWith(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            FutureBuilder(
              future: PackageInfo.fromPlatform(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const SizedBox(height: 100, child: Center(child: CircularProgressIndicator()));
                }
                String display = getDetails(snapshot.data as PackageInfo);
                return Center(
                  child: GestureDetector(
                    onTap: () {
                      Clipboard.setData(ClipboardData(text: display));
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Copied to clipboard')));
                    },
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                      child: SelectableText(
                        display,
                        style: context.theme.appTextTheme.body1.copyWith(
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Backend Environment',
                  style: context.theme.appTextTheme.body1.copyWith(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                AppDropdownMenu(
                    initialSelection: currentEnvironment.name,
                    width: double.infinity,
                    entries: Environment.values
                        .map((env) => DropdownModel(id: env.name, title: env.name.toUpperCase()))
                        .toList(),
                    onSelected: (value) {
                      if (value != null) {
                        EnvConfig.setEnvironment(Environment.values.firstWhere((env) => env.name == value));
                        setState(() {
                          currentEnvironment = Environment.values.firstWhere((env) => env.name == value);
                        });
                        if (kReleaseMode) {
                          Restart.restartApp();
                        }
                      }
                    }),
                SizedBox(height: 16),
              ],
            ),
            ListTile(
              title: const Text('Enable Debug Upgrader'),
              contentPadding: EdgeInsets.zero,
              trailing: Switch(
                activeTrackColor: Colors.green,
                inactiveTrackColor: Colors.grey.withOpacity(0.4),
                trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
                thumbColor: WidgetStateProperty.all(Colors.white),
                value: debugUpgrader,
                onChanged: (value) async {
                  setState(() {
                    debugUpgrader = value;
                  });
                  await devBox.put('debugUpgrader', value);
                },
              ),
            ),
            SizedBox(height: 16),
            if (kDebugMode)
              ListTile(
                title: const Text('Is Pro'),
                subtitle: Text(
                  '(only for dev should be removed later)',
                  style: context.theme.appTextTheme.body3Light.copyWith(fontSize: 12),
                ),
                contentPadding: EdgeInsets.zero,
                trailing: Switch(
                  activeTrackColor: Colors.green,
                  inactiveTrackColor: Colors.grey.withOpacity(0.4),
                  trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
                  thumbColor: WidgetStateProperty.all(Colors.white),
                  value: isPro,
                  onChanged: (value) async {
                    setState(() {
                      isPro = value;
                    });
                    await devBox.put('isDevPro', value);
                    if (!kDebugMode) {
                      Restart.restartApp();
                    }
                  },
                ),
              ),
            SizedBox(height: 16),
            if (kDebugMode)
              AppButton(
                label: 'Test Something',
                isAsync: true,
                onPressed: () async {
                  await testSomething();
                },
              ),
          ],
        ),
      ),
    );
  }

  Future<void> testSomething() async {
    log(locator<RemoteConfigService>().data.api.openaiApiKey.toString());
  }
}
