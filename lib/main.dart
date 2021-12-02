import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex_flutter/business_logic/cubit/launch/launch_cubit.dart';
import 'package:spacex_flutter/business_logic/cubit/mission/mission_cubit.dart';
import 'package:spacex_flutter/data/data_providers/i_spacex_cache.dart';
import 'package:spacex_flutter/data/data_providers/i_spacex_data_provider.dart';
import 'package:spacex_flutter/data/data_providers/spacex_local_data_provider.dart';
import 'package:spacex_flutter/data/data_providers/spacex_network_data_provider.dart';
import 'package:spacex_flutter/data/respositories/i_spacex_repository.dart';
import 'package:spacex_flutter/data/respositories/spacex_repository.dart';
import 'package:spacex_flutter/presentation/routes/routes.dart';
import 'package:spacex_flutter/presentation/screens/main_screen.dart';
import 'package:spacex_flutter/presentation/screens/mission_details_screen.dart';
import 'package:spacex_flutter/utils/hive_init.dart';

import 'business_logic/cubit/roadster/roadster_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initHive();

  final ISpaceXDataProvider networkDataProvider = SpaceXNetworkDataProvider();
  final ISpaceXCache localDataProvider = SpaceXLocalDataProvider();
  final ISpaceXRepository repository = SpaceXRepository(
    cacheDataProvider: localDataProvider,
    networkDataProvider: networkDataProvider,
  );

  runApp(
    MyApp(
      repository: repository,
    ),
  );
}

class MyApp extends StatelessWidget {
  final ISpaceXRepository repository;
  const MyApp({Key? key, required this.repository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RoadsterCubit(repository: repository),
        ),
        BlocProvider(
          create: (context) => MissionCubit(repository: repository),
        ),
        BlocProvider(
          create: (context) => LaunchCubit(repository: repository),
        ),
      ],
      child: MaterialApp(
        routes: {
          Routes.missionDetailScreen: (context) => const MissionDetailsScreen(),
        },
        title: 'SpaceX Flutter',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SafeArea(
          child: MainScreen(),
        ),
      ),
    );
  }
}
