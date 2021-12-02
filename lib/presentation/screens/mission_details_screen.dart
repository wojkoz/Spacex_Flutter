import 'package:flutter/material.dart';
import 'package:spacex_flutter/constants/styles.dart';
import 'package:spacex_flutter/data/models/mission/mission.dart';
import 'package:spacex_flutter/presentation/widgets/link_container.dart';
import 'package:spacex_flutter/presentation/widgets/openable_list.dart';

class MissionDetailsScreen extends StatelessWidget {
  const MissionDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Mission mission =
        ModalRoute.of(context)!.settings.arguments as Mission;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Styles.firstBackgroundColor,
        centerTitle: true,
        title: Text(
          mission.missionName,
          style: const TextStyle(
            color: Styles.firstTextColor,
            fontSize: 20,
          ),
        ),
      ),
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
                  child: SizedBox(
                    width: width - 50,
                    child: Text(
                      mission.description,
                      style: const TextStyle(
                        color: Styles.firstTextColor,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                OpenableList(
                  items: _createOpenableItemsList(mission.manufacturers),
                  title: const Text(
                    "Manufacturers",
                    style: Styles.openableListTitleStyle,
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

  List<Widget> _createOpenableItemsList(List<String> items) {
    return items
        .map(
          (item) => Text(
            item,
            style: const TextStyle(color: Styles.secondTextColor, fontSize: 13),
          ),
        )
        .toList();
  }
}
