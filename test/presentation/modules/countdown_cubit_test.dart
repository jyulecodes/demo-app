import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:spacex_launches/data/repositories/countdown_repo.dart';
import 'package:spacex_launches/presentation/modules/countdown/cubit/countdown_cubit.dart';
import 'package:spacex_launches/utils/strings.dart';
import 'package:spacex_launches/data/models/launch.dart';
import 'package:spacex_launches/data/repositories/mock_repositories/mock_repositories.dart';


void main() {
  late CountdownRepository repository;
  Launch mockNextLaunch=Launch(name: "a", launchDate: DateTime.utc(2030).toString());
  Duration mockRemainingTime=DateTime.utc(2030).difference(DateTime.now());

  group(
    'loadCountdown method',
        () {
      setUp(() {
        repository = MockCountdownRepository();
      });
      blocTest<CountdownCubit, CountdownState>(
        ' emits [CountdownLoading, CountdownFailure] when repository throws exception fails',
        setUp: () {
          when(() => repository.getCountdown()..then(throw Exception()));
        },
        build: () => CountdownCubit(repository),
        act: (CountdownCubit cubit) => cubit.loadCountdown(),
        expect: () => <TypeMatcher<CountdownState>>[
          isA<CountdownLoading>(),
          isA<CountdownFailure>(),
        ],
        verify: (cubit) async {
          expect((cubit.state as CountdownFailure).errorMsg,
              ErrorStrings.countdownError);
        },
      );

      blocTest<CountdownCubit, CountdownState>(
        ' emits [CountdownLoading, CountdownSuccess] with valid API',
        setUp: () {
          when(() => repository.getCountdown())
              .thenAnswer((_) async => Future.value(mockNextLaunch));
        },
        build: () => CountdownCubit(repository),
        act: (CountdownCubit cubit) => cubit.loadCountdown(),
        expect: () => <TypeMatcher<CountdownState>>[
          isA<CountdownLoading>(),
          isA<CountdownSuccess>(),
        ],
        verify: (cubit) {
          expect((cubit.state as CountdownSuccess).nextLaunch, mockNextLaunch);
          expect((cubit.state as CountdownSuccess).remainingTime.inHours, mockRemainingTime.inHours);
          verify(() => repository.getCountdown()).called(1);
        },
      );
    },
  );
}