import 'package:flutter/material.dart';
import 'package:spacex_launches/presentation/appearance/styles/text_styles.dart';

import 'package:spacex_launches/presentation/appearance/widgets/base_screen/base_screen.dart';
import 'package:spacex_launches/presentation/appearance/styles/app_colours.dart';
import 'package:spacex_launches/presentation/appearance/widgets/app_bar/gradient_app_bar.dart';
import 'package:spacex_launches/presentation/appearance/widgets/bottom_navigation_bar/custom_bottom_navigation_bar.dart';
import 'package:spacex_launches/utils/strings.dart';
import 'package:spacex_launches/presentation/appearance/widgets/list_tiles/launch_list_button.dart';

class FavouritesComponent extends StatefulWidget {
  const FavouritesComponent({Key? key}) : super(key: key);

  @override
  State<FavouritesComponent> createState() => _FavouritesComponentState();
}

class _FavouritesComponentState extends State<FavouritesComponent> {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      appBar: GradientAppBar(
        backgroundColorLeft: AppColors.favouritesTitleBarOrange,
        backgroundColorRight: AppColors.favouritesTitleBarPink,
        child: Text(
          context.favourites,
          style: AppTextStyles.pageTitle,
        ),
      ),
      bottomNavBar: const CustomBottomNavigationBar(
        activeItem: CustomBottomNavigationBarType.favourites,
        inactiveIconColor: AppColors.favouritesTitleBarOrange,
      ),
      backgroundColorTopRight: AppColors.favouritesBackgroundBerry,
      backgroundColorBottomLeft: AppColors.favouritesBackgroundCoral,
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
