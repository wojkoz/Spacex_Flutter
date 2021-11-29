import 'package:http/http.dart' as http;

abstract class ISpaceXDataProvider {
  Future<http.Response> getAllMissions();
  Future<http.Response> getAllLaunches();
  Future<http.Response> getRoadster();
}
