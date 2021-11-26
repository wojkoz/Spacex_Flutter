import 'package:spacex_flutter/data/models/launch/launch.dart';
import 'package:spacex_flutter/data/models/mission/mission.dart';
import 'package:spacex_flutter/data/models/response/basic_response.dart';
import 'package:spacex_flutter/data/models/roadster/roadster.dart';

abstract class ISpaceXRepository {
  Future<BaseResponse<List<Mission>>> getMissions();
  Future<BaseResponse<List<Launch>>> getLaunches();
  Future<BaseResponse<Roadster>> getRoadster();
  Future<void> updateSpaceXCache();
}
