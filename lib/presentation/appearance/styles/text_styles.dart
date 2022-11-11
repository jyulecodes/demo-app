import 'package:flutter/material.dart';

import 'package:spacex_launches/presentation/appearance/styles/app_colours.dart';

abstract class AppTextStyles {
  static const String defaultFontFamily = 'Manrope';
  static const TextStyle manropeMedium24 = TextStyle(
    fontSize: 24,
    fontFamily: defaultFontFamily,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
    color: AppColors.pureWhite,
  );

  static const TextStyle manropeSemiBold18 = TextStyle(
    fontFamily: defaultFontFamily,
    fontSize: 18,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    color: AppColors.pureWhite,
  );

  static const TextStyle manropeSemiBold40 = TextStyle(
    fontFamily: defaultFontFamily,
    fontSize: 40,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
    color: AppColors.pureWhite,
  );

  static const TextStyle pageTitle = manropeMedium24;
  static const TextStyle launchScreenBody = manropeSemiBold18;
  static const TextStyle countdownValue = manropeSemiBold18;
}
