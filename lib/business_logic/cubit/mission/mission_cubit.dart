import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:spacex_flutter/data/models/mission/mission.dart';
import 'package:spacex_flutter/data/models/response/basic_response.dart';
import 'package:spacex_flutter/data/respositories/i_spacex_repository.dart';

part 'mission_state.dart';

class MissionCubit extends Cubit<MissionState> {
  final ISpaceXRepository repository;

  MissionCubit({required this.repository}) : super(MissionInitial());

  Future<void> getMissions() async {
    emit(MissionLoading());

    BaseResponse<List<Mission>> response = await repository.getMissions();

    if (response.isSuccedded) {
      emit(MissionLoaded(missions: response.data!));
    } else {
      emit(MissionError(errorMessage: "Could not get Roadster informations!"));
    }
  }
}
