import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex_flutter/business_logic/cubit/roadster_cubit.dart';
import 'package:spacex_flutter/data/models/roadster/roadster.dart';

class RoadsterScreen extends StatelessWidget {
  const RoadsterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RoadsterCubit, RoadsterState>(
        builder: (BuildContext context, RoadsterState state) {
      if (state is RoadsterInitial) {
        context.read<RoadsterCubit>().getRoadster();
        return Container();
      } else if (state is RoadsterLoading) {
        return const CircularProgressIndicator();
      } else if (state is RoadsterError) {
        return Text(state.errorMessage);
      } else if (state is RoadsterLoaded) {
        return _buildScreen(context, state.roadster);
      } else {
        return const Text("Something went wrong!!");
      }
    });
  }

  Widget _buildScreen(BuildContext context, Roadster roadster) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.max,
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                roadster.name,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
