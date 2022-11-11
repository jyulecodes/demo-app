import 'package:flutter/material.dart';
import 'package:spacex_launches/presentation/appearance/styles/text_styles.dart';

import 'package:spacex_launches/presentation/appearance/widgets/base_screen/base_screen.dart';
import 'package:spacex_launches/presentation/appearance/styles/app_colours.dart';
import 'package:spacex_launches/presentation/appearance/widgets/app_bar/gradient_app_bar.dart';
import 'package:spacex_launches/utils/strings.dart';
import 'package:spacex_launches/presentation/appearance/widgets/list_tiles/launch_list_button.dart';

class LaunchesComponent extends StatefulWidget {
  const LaunchesComponent({Key? key}) : super(key: key);

  @override
  State<LaunchesComponent> createState() => _LaunchesComponentState();
}

class _LaunchesComponentState extends State<LaunchesComponent> {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      appBar: GradientAppBar(
        backgroundColorLeft: AppColors.launchTitleBarPink,
        backgroundColorRight: AppColors.launchTitleBarPurple,
        child: Text(
          context.upcomingLaunches,
          style: AppTextStyles.pageTitle,
        ),
      ),
      backgroundColorTopRight: AppColors.launchBackgroundIndigo,
      backgroundColorBottomLeft: AppColors.launchBackgroundMauve,
      child: _missionsList(),
    );
  }

  Widget _missionsList() {
    return Column(
      children: <Widget>[
        LaunchListButton(
          mission: context.mission,
          date: context.dateUtc,
          showHeart: false,
        ),
        LaunchListButton(
          mission: context.placeholderText,
          date: context.dateUtc,
          isFavourite: true,
        ),
        LaunchListButton(
          mission: context.placeholderText,
          date: context.dateUtc,
          isEnd: true,
        ),
      ],
    );
  }
}
