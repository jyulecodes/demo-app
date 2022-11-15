import 'package:bloc/bloc.dart';
import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:spacex_launches/data/models/launch.dart';
import 'package:spacex_launches/data/repositories/countdown_repo.dart';
import 'package:spacex_launches/utils/strings.dart';

part 'countdown_state.dart';

class CountdownCubit extends Cubit<CountdownState> {
  CountdownCubit(
      this._repository
      )
      : super(CountdownInitial());

final CountdownRepository _repository;

  Future<void> loadCountdown() async {
    emit(CountdownLoading());
    try {
      final nextLaunch = await _repository.getCountdown();
      final launchDateTime = DateTime.parse(nextLaunch.launchDate);
      Duration remainingTime=Duration.zero;
      if(launchDateTime.isAfter(DateTime.now())){
     remainingTime= launchDateTime.difference(DateTime.now().toUtc());}
      emit(CountdownSuccess(nextLaunch: nextLaunch, remainingTime: remainingTime));
    } catch (error) {
      emit(const CountdownFailure(errorMsg: ErrorStrings.countdownError));
    }
  }

  Future<void> iterateCountdown(Launch nextLaunch, Duration seconds) async{
    emit(CountdownSuccess(nextLaunch: nextLaunch, remainingTime:seconds));
  }
}
