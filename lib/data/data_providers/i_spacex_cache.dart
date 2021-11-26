import 'package:spacex_flutter/data/models/launch.dart';
import 'package:spacex_flutter/data/models/mission.dart';
import 'package:spacex_flutter/data/models/roadster.dart';

abstract class ISpaceXCache {
  Future<void> saveAllMissions(List<Mission> missions);
  Future<void> saveAllLaunches(List<Launch> launches);
  Future<void> saveRoadster(Roadster roadster);
}
