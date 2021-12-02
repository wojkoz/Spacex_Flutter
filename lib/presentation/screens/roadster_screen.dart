import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex_flutter/business_logic/cubit/roadster/roadster_cubit.dart';
import 'package:spacex_flutter/constants/styles.dart';
import 'package:spacex_flutter/data/models/roadster/roadster.dart';
import 'package:spacex_flutter/presentation/widgets/link_container.dart';

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
    String roadsterLaunchDate =
        DateTime.fromMillisecondsSinceEpoch(roadster.launchDateUnix * 1000)
            .toString();
    return Container(
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Text(
                  roadster.name,
                  style: Styles.titleStyle,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                  child: Container(
                    decoration: Styles.boxDecorationCircular30SecBgColor,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 30.0,
                        bottom: 30.0,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Launch date: $roadsterLaunchDate",
                              style: Styles.roadsterTextColumn,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Distance from Earth: ${roadster.earthDistanceKm} km",
                              style: Styles.roadsterTextColumn,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Distance from Mars: ${roadster.marsDistanceKm} km",
                              style: Styles.roadsterTextColumn,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Current speed: ${roadster.speedKph} km/h",
                              style: Styles.roadsterTextColumn,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 400,
                  child: Text(
                    roadster.details,
                    style: const TextStyle(
                      color: Styles.firstTextColor,
                      fontSize: 20,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: LinkContainer(
                    links: [roadster.wikipedia],
                    width: 400,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
