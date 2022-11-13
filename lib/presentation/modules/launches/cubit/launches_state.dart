part of 'launches_cubit.dart';

abstract class LaunchesState extends Equatable {
  const LaunchesState();

  @override
  List<Object> get props => <Object>[];
}

class LaunchesInitial extends LaunchesState {}

class LaunchesLoading extends LaunchesState {}

class LaunchesSuccess extends LaunchesState {
  const LaunchesSuccess({
    required this.launchList,
  });

  final List<Launch> launchList;

  @override
  List<Object> get props => [
        launchList,
      ];
}

class LaunchesFailure extends LaunchesState {
  const LaunchesFailure({
    this.errorMsg = '',
  });

  final String errorMsg;

  @override
  List<Object> get props => [errorMsg];
}
