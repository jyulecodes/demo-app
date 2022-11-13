import 'package:flutter/material.dart';
import 'package:spacex_launches/presentation/appearance/styles/text_styles.dart';

import 'package:spacex_launches/presentation/appearance/widgets/base_screen/base_screen.dart';
import 'package:spacex_launches/presentation/appearance/styles/app_colours.dart';
import 'package:spacex_launches/presentation/appearance/widgets/app_bar/gradient_app_bar.dart';
import 'package:spacex_launches/presentation/appearance/widgets/bottom_navigation_bar/custom_bottom_navigation_bar.dart';
import 'package:spacex_launches/utils/strings.dart';
import 'package:spacex_launches/presentation/appearance/widgets/list_items/launch_list_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex_launches/presentation/modules/favourites/cubit/favourites_cubit.dart';
import 'package:spacex_launches/presentation/appearance/widgets/messages/api_error_message.dart';
import 'package:spacex_launches/presentation/appearance/widgets/list_items/launch_button_list_generator.dart';

class FavouritesComponent extends StatefulWidget {
  const FavouritesComponent({Key? key}) : super(key: key);

  @override
  State<FavouritesComponent> createState() => _FavouritesComponentState();
}

class _FavouritesComponentState extends State<FavouritesComponent> {
  List<Widget> buttonsList = [];

  @override
  void initState() {
    super.initState();
    BlocProvider.of<FavouritesCubit>(context).loadFavourites();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavouritesCubit, FavouritesState>(
        builder: (BuildContext context, FavouritesState state) {
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
        child: _pageBody(state),
      );
    });
  }

  Widget _pageBody(FavouritesState state) {
    if (state is FavouritesSuccess) {
      return _favouritesList(state);
    } else if (state is FavouritesFailure) {
      return ApiErrorMessage(errorMessage: context.errorText);
    } else {
      return const Center(
        child: CircularProgressIndicator(
          color: AppColors.pureWhite,
        ),
      );
    }
  }

  Widget _favouritesList(FavouritesSuccess state) {
    generateLaunchButtonList(context.mission, context.dateUtc,
        state.favouritesList, buttonsList, context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 60),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: buttonsList,
        ),
      ),
    );
  }
}
