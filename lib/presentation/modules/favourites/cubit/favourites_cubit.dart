import 'package:bloc/bloc.dart';
import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:spacex_launches/data/models/launch.dart';
import 'package:spacex_launches/data/repositories/launches_repo.dart';

part 'favourites_state.dart';

class FavouritesCubit extends Cubit<FavouritesState> {
  FavouritesCubit(this._repository) : super(FavouritesInitial());

  final LaunchesRepository _repository;

  Future<void> loadFavourites() async {
    emit(FavouritesLoading());
    try {
      final favesList = await _repository.retrieveFavourites();
      emit(FavouritesSuccess(
          favouritesList: favesList
      ));
    } catch (error) {
      emit(const FavouritesFailure(errorMsg: "error"));
    }
  }

  Future<void> updateFavourites(
      Launch launch) async {
    emit(FavouritesLoading());
    List<Launch> favesList= await _repository.retrieveFavourites();
    if (favesList.contains(launch)) {
      favesList.remove(launch);
      await _repository.updateFavourites(favesList);
    } else {
      favesList.add(launch);
      await _repository.updateFavourites(favesList);
    }
    emit(FavouritesSuccess(
      favouritesList:favesList));
  }

}
