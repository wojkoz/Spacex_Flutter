import 'dart:convert';
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
  Future<BaseResponse<List<Launch>>> getLaunches() async {
    // TODO: add cache
    final http.Response response = await networkDataProvider.getAllLaunches();
    final int code = response.statusCode;

    try {
      if (code >= 200 && code < 400) {
        Iterable l = json.decode(response.body);
        List<Launch> missionList =
            List<Launch>.from(l.map((model) => Launch.fromJson(model)));

        return BaseResponse<List<Launch>>(
            data: missionList, code: code, isSuccedded: true);
      }
    } on Exception catch (_, e) {
      log(
        "SpaceXRespository getLaunches():",
        stackTrace: e,
      );
    }

    return BaseResponse<List<Launch>>(
        data: null, code: code, isSuccedded: false);
  }

  @override
  Future<BaseResponse<List<Mission>>> getMissions() async {
    // TODO: add cache
    final http.Response response = await networkDataProvider.getAllMissions();
    final int code = response.statusCode;

    try {
      if (code >= 200 && code < 400) {
        Iterable l = json.decode(response.body);
        List<Mission> missionList =
            List<Mission>.from(l.map((model) => Mission.fromJson(model)));

        return BaseResponse<List<Mission>>(
            data: missionList, code: code, isSuccedded: true);
      }
    } on Exception catch (_, e) {
      log(
        "SpaceXRespository getMissions():",
        stackTrace: e,
      );
    }

    return BaseResponse<List<Mission>>(
        data: null, code: code, isSuccedded: false);
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
