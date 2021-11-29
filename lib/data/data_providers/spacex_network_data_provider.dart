import 'package:spacex_flutter/constants/uri_constants.dart';
import 'package:spacex_flutter/data/data_providers/i_spacex_data_provider.dart';
import 'package:http/http.dart' as http;

class SpaceXNetworkDataProvider implements ISpaceXDataProvider {
  @override
  Future<http.Response> getAllLaunches() {
    // TODO: implement getAllLaunches
    throw UnimplementedError();
  }

  @override
  Future<http.Response> getAllMissions() {
    // TODO: implement getAllMissions
    throw UnimplementedError();
  }

  @override
  Future<http.Response> getRoadster() {
    return http
        .get(Uri.parse("${UriConstants.baseUrl}${UriConstants.roadster}"));
  }
}
