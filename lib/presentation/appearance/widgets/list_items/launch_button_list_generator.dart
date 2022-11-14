import 'package:flutter/material.dart';
import 'package:spacex_launches/data/models/launch.dart';
import 'package:spacex_launches/presentation/appearance/widgets/list_items/launch_list_button.dart';
import 'package:intl/intl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex_launches/presentation/modules/favourites/cubit/favourites_cubit.dart';

generateLaunchButtonList(
  String missionColumnTitle,
  String dateColumnTitle,
  List<Launch> launchList,
  List<Launch> favouritesList,
  List<Widget> buttonsList,
    BuildContext context,
) {
  buttonsList.add(LaunchListButton(
    mission: missionColumnTitle,
    date: dateColumnTitle,
    showHeart: false,
  ));
  int i = 0;
  for (Launch item in launchList) {
    String readableDate = DateFormat('dd/MM/yy')
        .format(DateTime.parse(item.launchDate))
        .toString();
    buttonsList.add(LaunchListButton(
      mission: item.name,
      date: readableDate,
      isEnd: i == launchList.length - 1 ? true : false,
      fillHeart: favouritesList.any((element) => element.name == item.name)?true:false,
      onPressed: () {
        BlocProvider.of<FavouritesCubit>(context)
            .updateFavourites(item);
      },
    ));
    i++;
  }
}
