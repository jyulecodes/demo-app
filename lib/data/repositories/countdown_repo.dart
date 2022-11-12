import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:spacex_launches/data/models/launch.dart';

class CountdownRepository {
  static const String _apiUrl = 'https://api.spacexdata.com/v4/launches/next';

  ///use dio??

  Future<Launch> getCountdown() async {
    return Dio()
        .get(_apiUrl)
        .then((value) => Launch.fromJson(value.data))
        .catchError((err) {
      print(err);
    });
    // try {
    //   var response = await Dio().get(_apiUrl);
    //   print(response);
    //   return Launch.fromJson(response.data);
    // } catch (e) {
    //   print(e);
    // }
  }
}
