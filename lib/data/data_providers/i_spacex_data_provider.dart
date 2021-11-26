import 'package:spacex_flutter/data/models/launch/launch.dart';
import 'package:spacex_flutter/data/models/mission/mission.dart';
import 'package:spacex_flutter/data/models/roadster/roadster.dart';

abstract class ISpaceXDataProvider {
  Future<List<Mission>> getAllMissions();
  Future<List<Launch>> getAllLaunches();
  Future<Roadster> getRoadster();
}
