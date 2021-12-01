import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex_flutter/business_logic/cubit/mission/mission_cubit.dart';
import 'package:spacex_flutter/data/models/mission/mission.dart';

class MissionScreen extends StatelessWidget {
  const MissionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MissionCubit, MissionState>(
        builder: (BuildContext context, MissionState state) {
      if (state is MissionInitial) {
        context.read<MissionCubit>().getMissions();
        return Container();
      } else if (state is MissionLoading) {
        return const CircularProgressIndicator();
      } else if (state is MissionError) {
        return Text(state.errorMessage);
      } else if (state is MissionLoaded) {
        return _buildScreen(context, state.missions);
      } else {
        return Text(state.toString());
      }
    });
  }

  Widget _buildScreen(BuildContext context, List<Mission> missions) {
    return ListView.builder(
      itemCount: missions.length,
      itemBuilder: (BuildContext bContext, int index) {
        return Text(missions[index].missionName);
      },
    );
  }
}
