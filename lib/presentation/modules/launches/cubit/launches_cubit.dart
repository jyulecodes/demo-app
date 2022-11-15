import 'package:bloc/bloc.dart';
import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:spacex_launches/data/models/launch.dart';
import 'package:spacex_launches/data/repositories/launches_repo.dart';
import 'package:spacex_launches/utils/strings.dart';

part 'launches_state.dart';

class LaunchesCubit extends Cubit<LaunchesState> {
  LaunchesCubit(this._repository) : super(LaunchesInitial());

  final LaunchesRepository _repository;

  Future<void> loadLaunches() async {
    emit(LaunchesLoading());
    try {
      final launchList = await _repository.getLaunches();
      emit(LaunchesSuccess(
        launchList: launchList,
      ));
    } catch (error) {
      emit(const LaunchesFailure(errorMsg: ErrorStrings.launchError));
    }
  }
}
