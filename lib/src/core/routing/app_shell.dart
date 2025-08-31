import 'package:flutter/material.dart';
import 'package:flutter_app_template/src/core/gen/assets.gen.dart';
import 'package:flutter_app_template/src/core/routing/app_bottom_nav.dart';
import 'package:flutter_app_template/src/core/services/theme/app_theme.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

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
}
