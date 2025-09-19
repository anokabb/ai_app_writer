import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phrasly_ai_tools/src/core/components/widgets/app_card.dart';
import 'package:phrasly_ai_tools/src/core/services/theme/app_theme.dart';
import 'package:phrasly_ai_tools/src/core/utils/utils.dart';
import 'package:phrasly_ai_tools/src/features/auth/data/models/user_model.dart';
import 'package:phrasly_ai_tools/src/features/auth/presentation/cubit/auth_cubit.dart';

class WelcomeCard extends StatelessWidget {
  const WelcomeCard({
    super.key,
  });

  String _getTimeBasedGreeting() {
    final hour = DateTime.now().hour;

    if (hour >= 5 && hour < 12) {
      return 'Good morning';
    } else if (hour >= 12 && hour < 17) {
      return 'Good afternoon';
    } else if (hour >= 17 && hour < 21) {
      return 'Good evening';
    } else {
      return 'Good night';
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        UserModel? user = state.maybeWhen(
          authenticated: (user) => user,
          orElse: () => null,
        );

        return AppCard(
          child: Row(
            spacing: 20,
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 2,
                  children: <Widget>[
                    AutoSizeText(
                      _getTimeBasedGreeting() + (user?.name == null ? ' 👋' : ', ${user?.name ?? ''} 👋'),
                      maxLines: 1,
                      style: context.appTextTheme.title4,
                    ),
                    Text(
                      'Ready to create something amazing?',
                      style: context.appTextTheme.body3Light,
                    )
                  ],
                ),
              ),
              UserImage(user: user),
            ],
          ),
        );
      },
    );
  }
}

class UserImage extends StatelessWidget {
  final UserModel? user;
  final double size;
  final int fontSize;

  const UserImage({
    super.key,
    required this.user,
    this.size = 46,
    this.fontSize = 24,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [
            Utils.hexToColor('#6170F4'),
            Utils.hexToColor('#8667EA'),
          ],
        ),
      ),
      child: CachedNetworkImage(
        imageUrl: user?.photoURL ?? '',
        placeholder: (context, url) => const CircularProgressIndicator(),
        errorWidget: (context, url, error) => Center(
          child: Text(
            (user?.name ?? 'G').substring(0, 1).toUpperCase(),
            style: context.appTextTheme.title1.copyWith(
              fontSize: fontSize.toDouble(),
              color: context.appColors.onPrimary,
              height: 1,
            ),
          ),
        ),
      ),
    );
  }
}
