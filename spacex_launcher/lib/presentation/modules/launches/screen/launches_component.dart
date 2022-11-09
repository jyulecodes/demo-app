import 'package:flutter/material.dart';

import 'package:spacex_launcher/presentation/appearance/widgets/base_screen/base_screen.dart';
import 'package:spacex_launcher/presentation/appearance/styles/app_colours.dart';
import 'package:spacex_launcher/presentation/appearance/widgets/app_bar/gradient_app_bar.dart';

class LaunchesComponent extends StatefulWidget {
  const LaunchesComponent({Key? key}) : super(key: key);

  @override
  State<LaunchesComponent> createState() => _LaunchesComponentState();
}

class _LaunchesComponentState extends State<LaunchesComponent> {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      appBar: const GradientAppBar(
        backgroundColorLeft: AppColors.launchTitleBarPink,
        backgroundColorRight: AppColors.launchTitleBarPurple,
        child: Text('aaaa'),
      ),
      backgroundColorTopRight: AppColors.launchBackgroundIndigo,
      backgroundColorBottomLeft: AppColors.launchBackgroundMauve,
      child: Container(),
    );
  }
}
