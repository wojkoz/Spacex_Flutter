import 'package:spacex_flutter/constants/uri_constants.dart';
import 'package:spacex_flutter/data/data_providers/i_spacex_data_provider.dart';
import 'package:http/http.dart' as http;

class SpaceXNetworkDataProvider implements ISpaceXDataProvider {
  @override
  Future<http.Response> getAllLaunches() {
    return http
        .get(Uri.parse("${UriConstants.baseUrl}${UriConstants.launches}"));
  }

  @override
  Future<http.Response> getAllMissions() {
    return http
        .get(Uri.parse("${UriConstants.baseUrl}${UriConstants.missions}"));
  }

  @override
  Future<http.Response> getRoadster() {
    return http
        .get(Uri.parse("${UriConstants.baseUrl}${UriConstants.roadster}"));
  }
}
