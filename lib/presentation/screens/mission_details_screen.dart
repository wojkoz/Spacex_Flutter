import 'package:flutter/material.dart';
import 'package:spacex_flutter/constants/styles.dart';
import 'package:spacex_flutter/data/models/mission/mission.dart';
import 'package:spacex_flutter/presentation/widgets/link_container.dart';

class MissionDetailsScreen extends StatelessWidget {
  const MissionDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Mission mission =
        ModalRoute.of(context)!.settings.arguments as Mission;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: width,
          color: Styles.firstBackgroundColor,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    mission.missionName,
                    style: const TextStyle(
                      color: Styles.firstTextColor,
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(
                  width: width - 50,
                  child: Text(
                    mission.description,
                    style: const TextStyle(
                      color: Styles.firstTextColor,
                      fontSize: 16,
                    ),
                  ),
                ),
                LinkContainer(
                  links: _getNoNullLinks(mission),
                  width: width,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<String> _getNoNullLinks(Mission mission) {
    List<String> links = [];
    if (mission.twitter != null) {
      links.add(mission.twitter ?? "");
    }
    if (mission.website != null) {
      links.add(mission.website ?? "");
    }

    if (mission.wikipedia != null) {
      links.add(mission.wikipedia ?? "");
    }
    return links;
  }
}
