import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:spacex_launches/data/repositories/launches_repo.dart';
import 'package:spacex_launches/presentation/modules/favourites/cubit/favourites_cubit.dart';
import 'package:spacex_launches/data/models/launch.dart';
import 'package:spacex_launches/data/repositories/mock_repositories/mock_repositories.dart';

void main() {
  late LaunchesRepository repository;
  List<Launch> mockLaunches = [
    Launch(name: "a", launchDate: "1"),
    Launch(name: "b", launchDate: "2")
  ];
  List<Launch> oneMockLaunch = [Launch(name: "a", launchDate: "1")];
  Launch singleLaunch = Launch(name: "b", launchDate: "2");

  group(
    'retrieveFavourites method',
    () {
      setUp(() {
        repository = MockLaunchesRepository();
      });
      blocTest<FavouritesCubit, FavouritesState>(
        ' emits [FavouritesLoading, FavouritesInitial] when repository returns blank list',
        setUp: () {
          when(() => repository.retrieveFavourites())
              .thenAnswer((_) async => Future.value([]));
        },
        build: () => FavouritesCubit(repository),
        act: (FavouritesCubit cubit) => cubit.loadFavourites(),
        expect: () => <TypeMatcher<FavouritesState>>[
          isA<FavouritesLoading>(),
          isA<FavouritesInitial>(),
        ],
      );

      blocTest<FavouritesCubit, FavouritesState>(
        ' emits [FavouritesLoading, FavouritesSuccess] when returned list contains launches',
        setUp: () {
          when(() => repository.retrieveFavourites())
              .thenAnswer((_) async => Future.value(mockLaunches));
        },
        build: () => FavouritesCubit(repository),
        act: (FavouritesCubit cubit) => cubit.loadFavourites(),
        expect: () => <TypeMatcher<FavouritesState>>[
          isA<FavouritesLoading>(),
          isA<FavouritesSuccess>(),
        ],
        verify: (cubit) {
          expect(
              (cubit.state as FavouritesSuccess).favouritesList, mockLaunches);
          verify(() => repository.retrieveFavourites()).called(1);
        },
      );
    },
  );
  group(
    'updateFavourites method',
    () {
      setUp(() {
        repository = MockLaunchesRepository();
      });
      blocTest<FavouritesCubit, FavouritesState>(
          ' emits [FavouritesSuccess] and adds new item to list when updated with favourite that is not already listed',
          setUp: () {
            when(() => repository.retrieveFavourites())
                .thenAnswer((_) async => Future.value(oneMockLaunch));
            when(() => repository.updateFavourites(any()))
                .thenAnswer((_) async => Future.value);
          },
          build: () => FavouritesCubit(repository),
          act: (FavouritesCubit cubit) => cubit.updateFavourites(singleLaunch),
          expect: () => <TypeMatcher<FavouritesState>>[
                isA<FavouritesSuccess>(),
              ],
          verify: (cubit) {
            expect((cubit.state as FavouritesSuccess).favouritesList[1].name, "b");
          });
      blocTest<FavouritesCubit, FavouritesState>(
          ' emits [FavouritesSuccess] and adds new item to list when updated with favourite that is not already listed',
          setUp: () {
            when(() => repository.retrieveFavourites())
                .thenAnswer((_) async => Future.value(mockLaunches));
            when(() => repository.updateFavourites(any()))
                .thenAnswer((_) async => Future.value);
          },
          build: () => FavouritesCubit(repository),
          act: (FavouritesCubit cubit) => cubit.updateFavourites(singleLaunch),
          expect: () => <TypeMatcher<FavouritesState>>[
            isA<FavouritesSuccess>(),
          ],
          verify: (cubit) {
            expect((cubit.state as FavouritesSuccess).favouritesList[0].name, "a");
            expect((cubit.state as FavouritesSuccess).favouritesList.length, 1);
          });
    },
  );
}
