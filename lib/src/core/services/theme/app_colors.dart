import 'package:flutter/material.dart';
import 'package:flutter_app_template/src/core/utils/utils.dart';
import 'package:flutter_app_template/src/features/theme/presentation/cubit/theme_cubit.dart';

abstract class AppColors {
  static const Color black = Color.fromRGBO(18, 18, 18, 1);
  static const Color grey = Color.fromRGBO(244, 244, 244, 1);
  static const Color grey2 = Color.fromRGBO(230, 230, 230, 1);
  static Color darkGrey = Utils.hexToColor('#D1D0D7');
  static const Color red = Colors.red;

  static Color green = Utils.hexToColor('#35C759');
  static Color yellow = Utils.hexToColor('#FFCC02');
  static Color orange = Utils.hexToColor('#FF9500');
  static Color pink = Utils.hexToColor('#FF2C55');
  static Color purple = Utils.hexToColor('#AF52DE');

  static const Color lightBlue = Color.fromRGBO(0, 142, 255, 1);
  static Color lightWhite = Utils.hexToColor('#FDFDFE');
  static Color darkBlue = Utils.hexToColor('173481');

  static Color get completedTicketColor => Color.fromRGBO(205, 244, 197, ThemeCubit.isDarkMode ? 0.5 : 1);
  static Color get waitingTicketColor => Color.fromRGBO(190, 230, 255, ThemeCubit.isDarkMode ? 0.5 : 1);
  static Color get noShowTicketTextColor => Color.fromRGBO(230, 230, 230, ThemeCubit.isDarkMode ? 0.5 : 1);
}
