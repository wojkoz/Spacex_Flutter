import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:spacex_flutter/data/data_providers/i_spacex_cache.dart';
import 'package:spacex_flutter/data/data_providers/i_spacex_data_provider.dart';
import 'package:spacex_flutter/data/models/response/basic_response.dart';
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
  Future<BaseResponse<List<Launch>>> getLaunches() {
    // TODO: implement getLaunches
    throw UnimplementedError();
  }

  @override
  Future<BaseResponse<List<Mission>>> getMissions() {
    // TODO: implement getMissions
    throw UnimplementedError();
  }

  @override
  Future<BaseResponse<Roadster>> getRoadster() async {
    // TODO: add cache
    final http.Response response = await networkDataProvider.getRoadster();
    final int code = response.statusCode;

    try {
      final Roadster roadster = Roadster.fromJson(response.body);

      if (code >= 200 && code < 400) {
        return BaseResponse<Roadster>(
            data: roadster, code: code, isSuccedded: true);
      }
    } on Exception catch (_, e) {
      log(
        "SpaceXRespository getRoadster():",
        stackTrace: e,
      );
    }

    return BaseResponse(data: null, code: code, isSuccedded: false);
  }
}
