import 'package:flutter/material.dart';
import 'package:spacex_launches/data/repositories/countdown_repo.dart';
import 'utils/navigation_util.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex_launches/presentation/modules/countdown/cubit/countdown_cubit.dart';
import 'package:spacex_launches/presentation/modules/launches/cubit/launches_cubit.dart';
import 'package:spacex_launches/data/repositories/launches_repo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CountdownCubit>.value(
          value: CountdownCubit(CountdownRepository()),
        ),
        BlocProvider<LaunchesCubit>.value(
          value: LaunchesCubit(LaunchesRepository()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          pageTransitionsTheme: const PageTransitionsTheme(
            builders: {
              TargetPlatform.android: NoTransitionsBuilder(),
              TargetPlatform.iOS: NoTransitionsBuilder(),
            },
          ),
        ),
        initialRoute: '/countdown',
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
