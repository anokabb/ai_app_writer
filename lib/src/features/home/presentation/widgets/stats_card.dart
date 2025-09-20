import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:phrasly_ai_tools/src/core/components/layouts/buttons/app_cuppertino_button.dart';
import 'package:phrasly_ai_tools/src/core/extensions/context_extension.dart';
import 'package:phrasly_ai_tools/src/core/gen/assets.gen.dart';
import 'package:phrasly_ai_tools/src/core/services/locator/locator.dart';
import 'package:phrasly_ai_tools/src/core/services/purchases/revenue_cat_service.dart';
import 'package:phrasly_ai_tools/src/core/services/purchases/subscription_cubit.dart';
import 'package:phrasly_ai_tools/src/core/services/theme/app_theme.dart';
import 'package:phrasly_ai_tools/src/core/utils/utils.dart';
import 'package:phrasly_ai_tools/src/features/documents/presentation/cubit/history_cubit.dart';
import 'package:phrasly_ai_tools/src/features/documents/presentation/cubit/history_state.dart';
import 'package:phrasly_ai_tools/src/features/documents/presentation/pages/documents_page.dart';

class StatsCard extends StatelessWidget {
  const StatsCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Your Stats',
            style: context.appTextTheme.title5,
          ),
        ),
        SizedBox(
          height: 110,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 16),
            scrollDirection: Axis.horizontal,
            children: [
              BlocBuilder<HistoryCubit, HistoryState>(
                builder: (context, state) {
                  int value = state.when(
                    initial: () => 0,
                    loading: () => 0,
                    loaded: (history) => history.length,
                    error: (error) => 0,
                  );
                  return Row(
                    children: [
                      _StatsItem(
                        title: context.localization.documents,
                        svgIcon: Assets.svg.docs,
                        value: value.toString(),
                        gradientColors: [
                          Utils.hexToColor('#0584FB'),
                          Utils.hexToColor('#0E6DAB'),
                        ],
                        onPressed: () {
                          context.go(DocumentsPage.routeName);
                        },
                      ),
                      SizedBox(width: 16),
                      _StatsItem(
                        title: context.localization.hoursSaved,
                        svgIcon: Assets.svg.clock,
                        value: (value * 3).toString(),
                        gradientColors: [
                          Utils.hexToColor('#2FC76F'),
                          Utils.hexToColor('#21CCAF'),
                        ],
                      ),
                    ],
                  );
                },
              ),
              SizedBox(width: 16),
              BlocBuilder<SubscriptionCubit, SubscriptionState>(
                builder: (context, state) {
                  return _StatsItem(
                    title: state.isSubscriber ? 'Premium Plan' : context.localization.freePlan,
                    svgIcon: Assets.svg.taj,
                    value: 'Current',
                    gradientColors: [
                      Utils.hexToColor('#FFA000'),
                      Utils.hexToColor('#FFBA15'),
                    ],
                    onPressed: () {
                      locator<SubscriptionCubit>().showPaywall(PaywallOffers.third_offer);
                    },
                  );
                },
              ),
            ],
          ),
        )
      ],
    );
  }
}

class _StatsItem extends StatelessWidget {
  final String title;
  final String svgIcon;
  final String value;
  final List<Color> gradientColors;
  final VoidCallback? onPressed;

  const _StatsItem({
    required this.title,
    required this.svgIcon,
    required this.value,
    required this.gradientColors,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppCupertinoButton(
      onTap: onPressed ?? () {},
      child: Container(
        width: 174,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradientColors,
          ),
          borderRadius: BorderRadius.circular(14),
        ),
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(
              svgIcon,
              height: 26,
              colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  value,
                  style: context.appTextTheme.title4.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: context.appTextTheme.body2.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    if (onPressed != null)
                      SvgPicture.asset(
                        Assets.svg.arrowRightOpacity,
                        width: 16,
                      ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
