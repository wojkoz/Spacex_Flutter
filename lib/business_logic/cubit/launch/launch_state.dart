part of 'launch_cubit.dart';

@immutable
abstract class LaunchState extends Equatable {}

class LaunchInitial extends LaunchState {
  @override
  List<Object?> get props => [];
}

class LaunchLoading extends LaunchState {
  @override
  List<Object?> get props => [];
}

class LaunchError extends LaunchState {
  final String errorMessage;

  LaunchError({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}

class LaunchLoaded extends LaunchState {
  final List<Launch> launches;

  LaunchLoaded({required this.launches});
  @override
  List<Object?> get props => [launches];
}
