part of 'mission_cubit.dart';

@immutable
abstract class MissionState extends Equatable {}

class MissionInitial extends MissionState {
  @override
  List<Object?> get props => [];
}

class MissionLoading extends MissionState {
  @override
  List<Object?> get props => [];
}

class MissionError extends MissionState {
  final String errorMessage;

  MissionError({required this.errorMessage});
  @override
  List<Object?> get props => [errorMessage];
}

class MissionLoaded extends MissionState {
  final List<Mission> missions;

  MissionLoaded({required this.missions});
  @override
  List<Object?> get props => [missions];
}
