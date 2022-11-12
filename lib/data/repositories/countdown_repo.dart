import 'package:dio/dio.dart';
import 'package:spacex_launches/data/models/launch.dart';

class CountdownRepository {
  static const String _apiUrl = 'https://api.spacexdata.com/v4/launches/next';

  Future<Launch> getCountdown() async {
    return Dio()
        .get(_apiUrl)
        .then((value) => Launch.fromJson(value.data))
        .catchError((err) {
          throw(err);
    });
  }
}
