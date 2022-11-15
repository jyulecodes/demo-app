import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:spacex_launches/data/repositories/launches_repo.dart';
import 'package:spacex_launches/presentation/modules/launches/cubit/launches_cubit.dart';
import 'package:spacex_launches/utils/strings.dart';
import 'package:spacex_launches/data/repositories/mock_repositories/mock_repositories.dart';


void main() {
  late LaunchesRepository repository;
  group(
    'loadLaunches method',
    () {
      setUp(() {
        repository = MockLaunchesRepository();
      });
      blocTest<LaunchesCubit, LaunchesState>(
        ' emits [LaunchesLoading, LaunchesFailure] when repository throws exception fails',
        setUp: () {
          when(() => repository.getLaunches()..then(throw Exception()));
        },
        build: () => LaunchesCubit(repository),
        act: (LaunchesCubit cubit) => cubit.loadLaunches(),
        expect: () => <TypeMatcher<LaunchesState>>[
          isA<LaunchesLoading>(),
          isA<LaunchesFailure>(),
        ],
        verify: (cubit) async {
          expect((cubit.state as LaunchesFailure).errorMsg,
              ErrorStrings.launchError);
        },
      );

      blocTest<LaunchesCubit, LaunchesState>(
        ' emits [LaunchesLoading, LaunchesSuccess] with valid API',
        setUp: () {
          when(() => repository.getLaunches())
              .thenAnswer((_) async => Future.value([
                  ]));
        },
        build: () => LaunchesCubit(repository),
        act: (LaunchesCubit cubit) => cubit.loadLaunches(),
        expect: () => <TypeMatcher<LaunchesState>>[
          isA<LaunchesLoading>(),
          isA<LaunchesSuccess>(),
        ],
        verify: (cubit) {
          expect((cubit.state as LaunchesSuccess).launchList, [
          ]);
          verify(() => repository.getLaunches()).called(1);
        },
      );
    },
  );
}
