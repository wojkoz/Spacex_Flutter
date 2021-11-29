part of 'roadster_cubit.dart';

@immutable
abstract class RoadsterState extends Equatable {}

class RoadsterInitial extends RoadsterState {
  @override
  List<Object?> get props => [];
}

class RoadsterLoading extends RoadsterState {
  @override
  List<Object?> get props => [];
}

class RoadsterError extends RoadsterState {
  final String errorMessage;

  RoadsterError({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}

class RoadsterLoaded extends RoadsterState {
  final Roadster roadster;

  RoadsterLoaded({required this.roadster});

  @override
  List<Object?> get props => [roadster];
}
