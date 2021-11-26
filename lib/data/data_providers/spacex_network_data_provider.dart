import 'package:spacex_flutter/data/data_providers/i_spacex_data_provider.dart';
import 'package:spacex_flutter/data/models/roadster.dart';
import 'package:spacex_flutter/data/models/mission.dart';
import 'package:spacex_flutter/data/models/launch.dart';

class SpaceXNetworkDataProvider implements ISpaceXDataProvider {
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
}
