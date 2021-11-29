import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:spacex_flutter/data/models/response/basic_response.dart';
import 'package:spacex_flutter/data/models/roadster/roadster.dart';
import 'package:spacex_flutter/data/respositories/i_spacex_repository.dart';

part 'roadster_state.dart';

class RoadsterCubit extends Cubit<RoadsterState> {
  final ISpaceXRepository repository;

  RoadsterCubit({required this.repository}) : super(RoadsterInitial());

  Future<void> getRoadster() async {
    emit(RoadsterLoading());

    BaseResponse<Roadster> response = await repository.getRoadster();

    if (response.isSuccedded) {
      emit(RoadsterLoaded(roadster: response.data!));
    } else {
      emit(RoadsterError(errorMessage: "Could not get Roadster informations!"));
    }
  }
}
