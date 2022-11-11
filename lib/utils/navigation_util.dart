import 'package:flutter/material.dart';
import 'package:spacex_launches/presentation/modules/favourites/screen/favourites_screen.dart';
import 'package:spacex_launches/presentation/modules/launches/screen/launches_screen.dart';
import 'package:spacex_launches/presentation/modules/countdown/screen/countdown_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/favourites':
        return MaterialPageRoute(
          builder: (context) => const FavouritesScreen(),
          settings: settings,
        );
      case '/launches':
        return MaterialPageRoute(
          builder: (context) => const LaunchesScreen(),
          settings: settings,
        );
      case '/countdown':
        return MaterialPageRoute(
          builder: (context) => const CountdownScreen(),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
            builder: (context) => const CountdownScreen(), settings: settings);
    }
  }
}

class NoTransitionsBuilder extends PageTransitionsBuilder {
  const NoTransitionsBuilder();

  @override
  Widget buildTransitions<T>(
      PageRoute<T>? route,
      BuildContext? context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget? child,
      ) {
    return child!;
  }
}
