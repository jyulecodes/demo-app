import 'package:flutter/material.dart';

import 'package:spacex_launches/presentation/appearance/widgets/base_screen/base_screen.dart';
import 'package:spacex_launches/presentation/appearance/styles/app_colours.dart';
import 'package:spacex_launches/presentation/appearance/widgets/app_bar/gradient_app_bar.dart';
import 'package:spacex_launches/utils/strings.dart';
import 'package:spacex_launches/presentation/appearance/styles/text_styles.dart';

class CountdownComponent extends StatefulWidget {
  const CountdownComponent({Key? key}) : super(key: key);

  @override
  State<CountdownComponent> createState() => _CountdownComponentState();
}

class _CountdownComponentState extends State<CountdownComponent> {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      appBar: GradientAppBar(
        backgroundColorLeft: AppColors.countTitleBarTeal,
        backgroundColorRight: AppColors.countTitleBarGrey,
        child: Text(
          context.placeholderText,
          style: AppTextStyles.pageTitle,
        ),
      ),
      backgroundColorTopRight: AppColors.countBackgroundDarkGreen,
      backgroundColorBottomLeft: AppColors.countBackgroundLightGreen,
      child: Container(),
    );
  }
}
