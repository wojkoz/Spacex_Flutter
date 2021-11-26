import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:spacex_flutter/data/models/roadster/roadster.dart';

Future<void> initHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(RoadsterAdapter());
}
