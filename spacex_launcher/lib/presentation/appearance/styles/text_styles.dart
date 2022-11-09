import 'package:flutter/material.dart';

import 'package:spacex_launcher/presentation/appearance/styles/app_colours.dart';

abstract class AppTextStyles {
  static const String defaultFontFamily = 'Manrope';
  static const TextStyle manropeMedium20 = TextStyle(
    fontSize: 20,
    fontFamily: defaultFontFamily,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    color: AppColors.pureWhite,
  );

  static const TextStyle manropeSemiBold16 = TextStyle(
    fontFamily: defaultFontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
  );

  static const TextStyle manropeSemiBold40 = TextStyle(
    fontFamily: defaultFontFamily,
    fontSize: 40,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
  );

  static const TextStyle pageTitle = manropeMedium20;
  static const TextStyle launchScreenBody = manropeSemiBold16;
  static const TextStyle countdownValue = manropeSemiBold16;
}
