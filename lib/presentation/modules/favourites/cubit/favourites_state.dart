part of 'favourites_cubit.dart';

abstract class FavouritesState extends Equatable {
  const FavouritesState();

  @override
  List<Object> get props => <Object>[];
}

class FavouritesInitial extends FavouritesState {}

class FavouritesLoading extends FavouritesState {}

class FavouritesSuccess extends FavouritesState {
  const FavouritesSuccess(
      {required this.favouritesList,}
      );

  final List<Launch> favouritesList;

  @override
  List<Object> get props => [
    favouritesList
  ];
}

class FavouritesFailure extends FavouritesState {
  const FavouritesFailure({
    this.errorMsg='',
  });

  final String errorMsg;

  @override
  List<Object> get props => [errorMsg];
}