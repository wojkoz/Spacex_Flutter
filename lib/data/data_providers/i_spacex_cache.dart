import 'package:spacex_flutter/data/models/launch/launch.dart';
import 'package:spacex_flutter/data/models/mission/mission.dart';
import 'package:spacex_flutter/data/models/roadster/roadster.dart';

abstract class ISpaceXCache {
  Future<void> saveAllMissions(List<Mission> missions);
  Future<void> saveMission(Mission mission);
  Future<void> saveAllLaunches(List<Launch> launches);
  Future<void> saveLaunch(Launch launche);
  Future<void> saveRoadster(Roadster roadster);
}
