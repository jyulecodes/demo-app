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
}
