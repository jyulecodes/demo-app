import 'package:flutter/material.dart';

import 'package:spacex_launches/presentation/appearance/widgets/base_screen/base_screen.dart';
import 'package:spacex_launches/presentation/appearance/styles/app_colours.dart';
import 'package:spacex_launches/presentation/appearance/widgets/app_bar/gradient_app_bar.dart';
import 'package:spacex_launches/presentation/appearance/widgets/messages/api_error_message.dart';
import 'package:spacex_launches/utils/strings.dart';
import 'package:spacex_launches/presentation/appearance/styles/text_styles.dart';
import 'package:spacex_launches/presentation/appearance/widgets/bottom_navigation_bar/custom_bottom_navigation_bar.dart';
import 'package:spacex_launches/presentation/appearance/widgets/list_items/countdown_value_list_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex_launches/presentation/modules/countdown/cubit/countdown_cubit.dart';

class CountdownComponent extends StatefulWidget {
  const CountdownComponent({Key? key}) : super(key: key);

  @override
  State<CountdownComponent> createState() => _CountdownComponentState();
}

class _CountdownComponentState extends State<CountdownComponent> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CountdownCubit>(context).loadCountdown();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CountdownCubit, CountdownState>(
      builder: (BuildContext context, CountdownState state) {
        return BaseScreen(
          backgroundColorTopRight: AppColors.countBackgroundDarkGreen,
          backgroundColorBottomLeft: AppColors.countBackgroundLightGreen,
          appBar: GradientAppBar(
            backgroundColorLeft: AppColors.countTitleBarTeal,
            backgroundColorRight: AppColors.countTitleBarGrey,
            child: Text(
              state is CountdownSuccess ? state.nextLaunch.name : '',
              style: AppTextStyles.pageTitle,
            ),
          ),
          bottomNavBar: const CustomBottomNavigationBar(
            activeItem: CustomBottomNavigationBarType.countdown,
            inactiveIconColor: AppColors.countTitleBarTeal,
          ),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: _pageBody(state),
          ),
        );
      },
    );
  }

  Widget _pageBody(CountdownState state) {
    if (state is CountdownSuccess) {
      return _countdownList(state);
    } else if (state is CountdownFailure) {
      return ApiErrorMessage(errorMessage: context.errorText);
    } else {
      return const Center(
        child: CircularProgressIndicator(
          color: AppColors.pureWhite,
        ),
      );
    }
  }

  Widget _countdownList(CountdownSuccess state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        CountdownValueListItem(
            value: state.remainingTime.inDays.toString(),
            unit: context.days
        ),
        CountdownValueListItem(
            value: state.remainingTime.inHours.remainder(24).toString(),
            unit: context.hours
        ),
        CountdownValueListItem(
            value: state.remainingTime.inMinutes.remainder(60).toString(),
            unit: context.minutes
        ),
        CountdownValueListItem(
            value: state.remainingTime.inSeconds.remainder(60).toString(),
            unit: context.seconds
        ),
      ],
    );
  }
}
