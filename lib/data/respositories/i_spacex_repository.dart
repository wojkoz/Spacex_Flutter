import 'package:spacex_flutter/data/models/launch.dart';
import 'package:spacex_flutter/data/models/mission.dart';
import 'package:spacex_flutter/data/models/roadster.dart';

abstract class ISpaceXRepository {
  Future<List<Mission>> getMissions();
  Future<List<Launch>> getLaunches();
  Future<Roadster> getRoadster();
  Future<void> updateSpaceXCache();
}
