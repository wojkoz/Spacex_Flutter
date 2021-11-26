import 'package:spacex_flutter/data/data_providers/i_spacex_cache.dart';
import 'package:spacex_flutter/data/data_providers/i_spacex_data_provider.dart';
import 'package:spacex_flutter/data/models/roadster/roadster.dart';
import 'package:spacex_flutter/data/models/mission/mission.dart';
import 'package:spacex_flutter/data/models/launch/launch.dart';
import 'package:spacex_flutter/data/respositories/i_spacex_repository.dart';

class SpaceXRepository implements ISpaceXRepository {
  final ISpaceXDataProvider networkDataProvider;
  final ISpaceXCache cacheDataProvider;

  SpaceXRepository(
      {required this.networkDataProvider, required this.cacheDataProvider});

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