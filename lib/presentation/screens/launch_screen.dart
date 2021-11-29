import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex_flutter/business_logic/cubit/launch/launch_cubit.dart';
import 'package:spacex_flutter/data/models/launch/launch.dart';

class LaunchScreen extends StatelessWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LaunchCubit, LaunchState>(
        builder: (BuildContext context, LaunchState state) {
      if (state is LaunchInitial) {
        context.read<LaunchCubit>().getLaunches();
        return Container();
      } else if (state is LaunchLoading) {
        return const CircularProgressIndicator();
      } else if (state is LaunchError) {
        return Text(state.errorMessage);
      } else if (state is LaunchLoaded) {
        return _buildScreen(context, state.launches);
      } else {
        return const Text("Something went wrong!!");
      }
    });
  }

  Widget _buildScreen(BuildContext context, List<Launch> missions) {
    return ListView.builder(
      itemCount: missions.length,
      itemBuilder: (BuildContext bContext, int index) {
        return Text(
            "${missions[index].missionName} ${missions[index].launchSuccess}");
      },
    );
  }
}
