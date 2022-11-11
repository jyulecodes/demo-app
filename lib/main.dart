import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex_launches/presentation/modules/countdown/screen/countdown_screen.dart';
import 'package:spacex_launches/presentation/modules/launches/screen/launches_screen.dart';
import 'package:spacex_launches/presentation/modules/favourites/screen/favourites_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return
      // MultiBlocProvider(
      // providers: const [],
      // child:
      MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const LaunchesScreen(),
        // ),
      );
  }
}
