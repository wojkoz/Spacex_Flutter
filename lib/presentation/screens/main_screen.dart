import 'package:flutter/material.dart';
import 'package:spacex_flutter/presentation/screens/launch_screen.dart';
import 'package:spacex_flutter/presentation/screens/mission_screen.dart';
import 'package:spacex_flutter/presentation/screens/roadster_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _screens = [
    const RoadsterScreen(),
    const MissionScreen(),
    const LaunchScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.car_rental_rounded),
            label: "Roadster",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.call_missed),
            label: "Missions",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.radio_button_checked),
            label: "Launches",
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      body: _screens.elementAt(_selectedIndex),
    );
  }
}
