part of 'countdown_cubit.dart';

abstract class CountdownState extends Equatable {
  const CountdownState();

  @override
  List<Object> get props => <Object>[];
}

class CountdownInitial extends CountdownState {}

class CountdownLoading extends CountdownState {}

class CountdownSuccess extends CountdownState {
  const CountdownSuccess(
      {required this.nextLaunch, required this.remainingTime}
  );

  final Launch nextLaunch;
  final Duration remainingTime;

  @override
  List<Object> get props => [
    // nextLaunch
  ];
}

class CountdownFailure extends CountdownState {
  const CountdownFailure({
    required this.errorMsg,
  });

  final String errorMsg;

  @override
  List<Object> get props => [errorMsg];
}
