import 'package:spacex_flutter/data/data_providers/i_spacex_cache.dart';
import 'package:spacex_flutter/data/data_providers/i_spacex_data_provider.dart';
import 'package:spacex_flutter/data/models/roadster/roadster.dart';
import 'package:spacex_flutter/data/models/mission/mission.dart';
import 'package:spacex_flutter/data/models/launch/launch.dart';

class SpaceXLocalDataProvider implements ISpaceXDataProvider, ISpaceXCache {
  @override
  Future<List<Launch>> getAllLaunches() {
    // TODO: implement getAllLaunches
    throw UnimplementedError();
  }

  @override
  Future<List<Mission>> getAllMissions() {
    // TODO: implement getAllMissions
    throw UnimplementedError();
  }

  @override
  Future<Roadster> getRoadster() {
    // TODO: implement getRoadster
    throw UnimplementedError();
  }

  @override
  Future<void> saveAllLaunches(List<Launch> launches) {
    // TODO: implement saveAllLaunches
    throw UnimplementedError();
  }

  @override
  Future<void> saveAllMissions(List<Mission> missions) {
    // TODO: implement saveAllMissions
    throw UnimplementedError();
  }

  @override
  Future<void> saveRoadster(Roadster roadster) {
    // TODO: implement saveRoadster
    throw UnimplementedError();
  }

  @override
  Future<void> saveLaunch(Launch launche) {
    // TODO: implement saveLaunch
    throw UnimplementedError();
  }

  @override
  Future<void> saveMission(Mission mission) {
    // TODO: implement saveMission
    throw UnimplementedError();
  }
}
