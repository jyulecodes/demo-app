import 'package:flutter/material.dart';
import 'package:spacex_launches/presentation/appearance/styles/text_styles.dart';
import 'package:spacex_launches/presentation/appearance/widgets/base_screen/base_screen.dart';
import 'package:spacex_launches/presentation/appearance/styles/app_colours.dart';
import 'package:spacex_launches/presentation/appearance/widgets/app_bar/gradient_app_bar.dart';
import 'package:spacex_launches/utils/strings.dart';
import 'package:spacex_launches/presentation/appearance/widgets/bottom_navigation_bar/custom_bottom_navigation_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex_launches/presentation/modules/launches/cubit/launches_cubit.dart';
import 'package:spacex_launches/presentation/appearance/widgets/messages/api_error_message.dart';
import 'package:spacex_launches/presentation/appearance/widgets/list_items/launch_button_list_generator.dart';

class LaunchesComponent extends StatefulWidget {
  const LaunchesComponent({Key? key}) : super(key: key);

  @override
  State<LaunchesComponent> createState() => _LaunchesComponentState();
}

class _LaunchesComponentState extends State<LaunchesComponent> {
  List<Widget> buttonsList = [];

  @override
  void initState() {
    super.initState();
    BlocProvider.of<LaunchesCubit>(context).loadLaunches();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LaunchesCubit, LaunchesState>(
        builder: (BuildContext context, LaunchesState state) {
      return BaseScreen(
        appBar: GradientAppBar(
          backgroundColorLeft: AppColors.launchTitleBarPink,
          backgroundColorRight: AppColors.launchTitleBarPurple,
          child: Text(
            context.upcomingLaunches,
            style: AppTextStyles.pageTitle,
          ),
        ),
        bottomNavBar: const CustomBottomNavigationBar(
          activeItem: CustomBottomNavigationBarType.launches,
          inactiveIconColor: AppColors.launchTitleBarPink,
        ),
        backgroundColorTopRight: AppColors.launchBackgroundIndigo,
        backgroundColorBottomLeft: AppColors.launchBackgroundMauve,
        child: _pageBody(state),
      );
    });
  }

  Widget _pageBody(LaunchesState state) {
    if (state is LaunchesSuccess) {
      return _launchesList(state);
    } else if (state is LaunchesFailure) {
      return ApiErrorMessage(errorMessage: context.errorText);
    } else {
      return const Center(
        child: CircularProgressIndicator(
          color: AppColors.pureWhite,
        ),
      );
    }
  }

  Widget _launchesList(LaunchesSuccess state) {
 generateLaunchButtonList(context.mission, context.dateUtc, state.launchList, buttonsList, context);
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
