import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex_flutter/business_logic/cubit/roadster_cubit.dart';
import 'package:spacex_flutter/data/data_providers/i_spacex_cache.dart';
import 'package:spacex_flutter/data/data_providers/i_spacex_data_provider.dart';
import 'package:spacex_flutter/data/data_providers/spacex_local_data_provider.dart';
import 'package:spacex_flutter/data/data_providers/spacex_network_data_provider.dart';
import 'package:spacex_flutter/data/respositories/i_spacex_repository.dart';
import 'package:spacex_flutter/data/respositories/spacex_repository.dart';
import 'package:spacex_flutter/presentation/screens/roadster_screen.dart';
import 'package:spacex_flutter/utils/hive_init.dart';

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
      ],
      child: MaterialApp(
        title: 'SpaceX Flutter',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SafeArea(
          child: Scaffold(
            // TODO: add bottomNavigationbar
            // bottomNavigationBar: BottomNavigationBar(
            //   items: const [
            //     BottomNavigationBarItem(
            //       icon: Icon(Icons.car_rental_rounded),
            //       label: "Roadster",
            //     ),
            //     BottomNavigationBarItem(
            //       icon: Icon(Icons.call_missed),
            //       label: "Missions",
            //     ),
            //     BottomNavigationBarItem(
            //       icon: Icon(Icons.radio_button_checked),
            //       label: "Launches",
            //     ),
            //   ],
            // ),
            body: RoadsterScreen(),
          ),
        ),
      ),
    );
  }
}
