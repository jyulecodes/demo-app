import 'dart:convert';

class Launch {
  Launch({
    required this.name,
    required this.launchDate,
  });

  String name;
  String launchDate;

  factory Launch.fromJson(Map<String, dynamic> json) {
    return Launch(
      name: json["name"],
      launchDate: json["date_utc"],
    );
  }
  static Map<String, dynamic> toMap(Launch launch) => {
    'name': launch.name,
    'date_utc': launch.launchDate,
  };

  static String encodeList(List<Launch> launches) => json.encode(
    launches
        .map<Map<String, dynamic>>((launch) => Launch.toMap(launch))
        .toList(),
  );

  static List<Launch> decodeList(String launchListString) =>
      (json.decode(launchListString) as List<dynamic>)
          .map<Launch>((item) => Launch.fromJson(item))
          .toList();
}

