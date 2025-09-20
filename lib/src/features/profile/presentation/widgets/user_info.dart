import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:phrasly_ai_tools/src/core/components/layouts/buttons/app_cuppertino_button.dart';
import 'package:phrasly_ai_tools/src/core/gen/assets.gen.dart';
import 'package:phrasly_ai_tools/src/core/services/locator/locator.dart';
import 'package:phrasly_ai_tools/src/core/services/purchases/revenue_cat_service.dart';
import 'package:phrasly_ai_tools/src/core/services/purchases/subscription_cubit.dart';
import 'package:phrasly_ai_tools/src/core/services/theme/app_theme.dart';
import 'package:phrasly_ai_tools/src/core/utils/utils.dart';
import 'package:phrasly_ai_tools/src/features/auth/data/models/user_model.dart';
import 'package:phrasly_ai_tools/src/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:phrasly_ai_tools/src/features/home/presentation/widgets/welcome_card.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        UserModel? user = state.maybeWhen(
          authenticated: (user) => user,
          orElse: () => null,
        );
        return BlocBuilder<SubscriptionCubit, SubscriptionState>(
          builder: (context, subscriptionState) {
            return Stack(
              alignment: Alignment.topCenter,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30, bottom: 16),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Utils.hexToColor('#F4F3F3'),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Utils.hexToColor('#1B62B2'),
                        width: 0.25,
                      ),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 50), //for profile image
                        SizedBox(height: 10),
                        Text(
                          user?.name ?? 'Guest User',
                          style: context.theme.appTextTheme.subtitle1,
                        ),
                        SizedBox(height: 10),
                        SizedBox(height: 16), //for user subscription
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Utils.hexToColor('#1B62B2'),
                      width: 0.5,
                    ),
                  ),
                  width: 80,
                  height: 80,
                  child: UserImage(
                    user: user,
                    fontSize: 40,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: AppCupertinoButton(
                    onTap: () {
                      locator<SubscriptionCubit>().showPaywall(PaywallOffers.third_offer);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      height: 32,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Utils.hexToColor('#0A7ADF'),
                            Utils.hexToColor('#035093'),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(500),
                      ),
                      child: Row(
                        children: <Widget>[
                          SvgPicture.asset(
                            Assets.svg.taj,
                            height: 20,
                            colorFilter: ColorFilter.mode(Utils.hexToColor('#FFC109'), BlendMode.srcIn),
                          ),
                          SizedBox(width: 4),
                          Text(
                            subscriptionState.isSubscriber ? 'Pro Member' : "Free Member",
                            style: context.theme.appTextTheme.subtitle3.copyWith(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
