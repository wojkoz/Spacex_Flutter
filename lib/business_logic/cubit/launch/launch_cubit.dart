import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:spacex_flutter/data/models/launch/launch.dart';
import 'package:spacex_flutter/data/models/response/basic_response.dart';
import 'package:spacex_flutter/data/respositories/i_spacex_repository.dart';

part 'launch_state.dart';

class LaunchCubit extends Cubit<LaunchState> {
  final ISpaceXRepository repository;

  LaunchCubit({required this.repository}) : super(LaunchInitial());

  Future<void> getLaunches() async {
    emit(LaunchLoading());

    BaseResponse<List<Launch>> response = await repository.getLaunches();

    if (response.isSuccedded) {
      emit(LaunchLoaded(launches: response.data!));
    } else {
      emit(LaunchError(errorMessage: "Could not get Roadster informations!"));
    }
  }
}
