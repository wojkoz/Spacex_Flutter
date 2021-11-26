import 'package:spacex_flutter/data/models/launch.dart';
import 'package:spacex_flutter/data/models/mission.dart';
import 'package:spacex_flutter/data/models/roadster.dart';

abstract class ISpaceXDataProvider {
  Future<List<Mission>> getAllMissions();
  Future<List<Launch>> getAllLaunches();
  Future<Roadster> getRoadster();
}
