import 'package:spacex_flutter/data/models/roadster.dart';
import 'package:spacex_flutter/data/models/mission.dart';
import 'package:spacex_flutter/data/models/launch.dart';
import 'package:spacex_flutter/data/respositories/i_spacex_repository.dart';

class SpaceXRepository implements ISpaceXRepository {
  @override
  Future<List<Launch>> getLaunches() {
    // TODO: implement getLaunches
    throw UnimplementedError();
  }

  @override
  Future<List<Mission>> getMissions() {
    // TODO: implement getMissions
    throw UnimplementedError();
  }

  @override
  Future<Roadster> getRoadster() {
    // TODO: implement getRoadster
    throw UnimplementedError();
  }

  @override
  Future<void> updateSpaceXCache() {
    // TODO: implement updateSpaceXCache
    throw UnimplementedError();
  }
}
