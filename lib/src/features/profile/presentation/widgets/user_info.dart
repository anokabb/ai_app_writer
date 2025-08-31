import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_template/src/core/gen/assets.gen.dart';
import 'package:flutter_app_template/src/core/services/theme/app_theme.dart';
import 'package:flutter_app_template/src/core/utils/utils.dart';
import 'package:flutter_svg/svg.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
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
                  'user name',
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
          child: CircleAvatar(
            backgroundImage: CachedNetworkImageProvider(
              'https://picsum.photos/id/1/200/300',
            ),
            backgroundColor: context.theme.appColors.borderColor,
          ),
        ),
        Positioned(
          bottom: 0,
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
                  'Free Member',
                  style: context.theme.appTextTheme.subtitle3.copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
