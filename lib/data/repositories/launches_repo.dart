import 'package:dio/dio.dart';
import 'package:spacex_launches/data/models/launch.dart';

class LaunchesRepository {
  static const String _apiUrl =
      'https://api.spacexdata.com/v4/launches/upcoming';

  Future<List<Launch>> getLaunches() async {
    return Dio().get(_apiUrl).then<List<Launch>>((value) {
     return List<Launch>.from(
        value.data.map<Launch>((dynamic json) =>
            Launch.fromJson(json as Map<String, dynamic>)).toList(),
      );
    }).catchError((err) {
      throw (err);
    });
  }
}
