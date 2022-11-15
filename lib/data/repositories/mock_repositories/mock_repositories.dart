import 'package:mocktail/mocktail.dart';
import 'package:spacex_launches/data/repositories/launches_repo.dart';
import 'package:spacex_launches/data/repositories/countdown_repo.dart';


class MockLaunchesRepository extends Mock implements LaunchesRepository {}

class MockCountdownRepository extends Mock implements CountdownRepository{}
