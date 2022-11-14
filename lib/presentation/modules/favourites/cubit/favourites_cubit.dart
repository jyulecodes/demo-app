import 'package:bloc/bloc.dart';
import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:spacex_launches/data/models/launch.dart';
import 'package:spacex_launches/data/repositories/launches_repo.dart';
import 'package:spacex_launches/utils/strings.dart';

part 'favourites_state.dart';

class FavouritesCubit extends Cubit<FavouritesState> {
  FavouritesCubit(this._repository) : super(FavouritesInitial());

  final LaunchesRepository _repository;

  Future<void> loadFavourites() async {
    emit(FavouritesLoading());
    try {
      final favesList = await _repository.retrieveFavourites();
      if (favesList.isEmpty) {
        emit(FavouritesInitial());
      } else {
        emit(FavouritesSuccess(favouritesList: favesList));
      }
    } catch (error) {
      emit(const FavouritesFailure(errorMsg: ErrorStrings.launchError));
    }
  }

  Future<void> updateFavourites(Launch launch) async {
    List<Launch> favesList = await _repository.retrieveFavourites();
    if (favesList.any((element) => element.name == launch.name)) {
      favesList.removeWhere((item) => item.name == launch.name);
      await _repository.updateFavourites(favesList);
    } else {
      favesList.add(launch);
      await _repository.updateFavourites(favesList);
    }
    emit(FavouritesSuccess(favouritesList: favesList));
  }
}
