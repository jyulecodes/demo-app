import 'package:flutter/material.dart';

class ErrorStrings {
  static const launchError = "Unable to load launches. Please try again later";
  static const countdownError = "Unable to load next launch. Please try again later";
  static const noFavourites =
      "You haven't added any launches to your favourites yet. When you do they'll show up here. ";
}

extension UiTextExt on BuildContext {
  String get upcomingLaunches => "Upcoming Launches";

  String get mission => "Mission";

  String get dateUtc => "Date(Utc)";

  String get days => "days";

  String get hours => "hours";

  String get minutes => "minutes";

  String get seconds => "seconds";

  String get countdown => "Launch Countdown";

  String get favourites => "Favourites";

  String shareText(String name, String days, String hours) =>
      "Come with me to Mars! $days days and $hours hours left to book your spot on the $name mission";

  String get shareButtonText => "Share this launch";

  String get placeholderText => "Placeholder Text";
}
