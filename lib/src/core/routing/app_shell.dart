import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:phrasly_ai_tools/src/core/constants/env_config.dart';
import 'package:phrasly_ai_tools/src/core/gen/assets.gen.dart';
import 'package:phrasly_ai_tools/src/core/routing/app_bottom_nav.dart';
import 'package:phrasly_ai_tools/src/core/services/locator/locator.dart';
import 'package:phrasly_ai_tools/src/core/services/notifications/notification_service.dart';
import 'package:phrasly_ai_tools/src/core/services/purchases/subscription_cubit.dart';
import 'package:phrasly_ai_tools/src/core/services/theme/app_theme.dart';

class AppShell extends StatefulWidget {
  const AppShell({
    required this.navigationShell,
    super.key,
  });

  final StatefulNavigationShell navigationShell;

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> with SingleTickerProviderStateMixin {
  late final TabController controller = TabController(
    length: 3,
    vsync: this,
    initialIndex: widget.navigationShell.currentIndex,
  );

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _insertOverlay(context));

    locator<SubscriptionCubit>().showAppOpenPaywall().then((value) {
      NotificationService().initialize();
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.index = widget.navigationShell.currentIndex;
    return Scaffold(
      body: widget.navigationShell,
      backgroundColor: context.theme.appColors.background,
      extendBody: true,
      bottomNavigationBar: AppBottomNavigationBar(
        currentIndex: widget.navigationShell.currentIndex,
        onTap: _onTap,
      ),
      floatingActionButton: PhysicalModel(
        color: Colors.transparent,
        elevation: 6,
        shadowColor: context.appColors.primary.withOpacity(0.35),
        shape: BoxShape.circle,
        child: FloatingActionButton(
          backgroundColor: context.appColors.primary,
          shape: const CircleBorder(),
          elevation: 0,
          onPressed: () => _onTap(1),
          child: SvgPicture.asset(
            Assets.svg.home,
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  void _onTap(int index) {
    widget.navigationShell.goBranch(index);
  }

  void _insertOverlay(BuildContext context) {
    if (EnvConfig.currentEnvironment == Environment.beta) {
      Overlay.of(context).insert(
        OverlayEntry(builder: (context) {
          return Positioned(
            width: 230,
            height: 50,
            top: 10,
            right: 0,
            child: IgnorePointer(
              child: Material(
                color: Colors.transparent,
                child: GestureDetector(
                  child: Center(
                    child: Container(
                      decoration:
                          BoxDecoration(color: context.appColors.primary, borderRadius: BorderRadius.circular(8)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                        child: Text(
                          'Beta',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
      );
    }
  }
}
