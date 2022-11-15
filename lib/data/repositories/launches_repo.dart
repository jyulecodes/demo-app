import 'package:dio/dio.dart';
import 'package:spacex_launches/data/models/launch.dart';

import 'package:shared_preferences/shared_preferences.dart';

class LaunchesRepository {
  static const String _apiUrl =
      'https://api.spacexdata.com/v4/launches/upcoming';

  final favouritesListKey = 'favouritesListaaaaa';

  Future<List<Launch>> getLaunches() async {
    return Dio().get(_apiUrl).then<List<Launch>>((value) {
      return List<Launch>.from(
        value.data
            .map<Launch>(
                (dynamic json) => Launch.fromJson(json as Map<String, dynamic>))
            .toList(),
      );
    }).catchError((err) {
      throw (err);
    });
  }

  Future<void> updateFavourites(List<Launch> favouritesList) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String encodedLaunchList = Launch.encodeList(favouritesList);
    await prefs.remove(favouritesListKey);
    await prefs.setString(favouritesListKey, encodedLaunchList);
  }

  Future<List<Launch>> retrieveFavourites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final favouritesString = prefs.getString(favouritesListKey);
   List<Launch> favouritesList= favouritesString != null && favouritesString.isNotEmpty
      ? Launch.decodeList(favouritesString):<Launch>[];
    return favouritesList;
  }
}
