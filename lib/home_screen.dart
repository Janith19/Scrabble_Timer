import 'package:flutter/material.dart';
import 'package:scrabble_timer/Components/scrabbletimer.dart';
import 'about_screen.dart'; // Import your AboutScreen widget
import 'settings_screen.dart'; // Import your SettingsScreen widget

// In home_screen.dart

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 1; // Set initial index to 1 (for Timer)
  int _playerTime = 25; // Default player time in minutes

  late List<Widget> _widgetOptions; // Declare _widgetOptions

  @override
  void initState() {
    super.initState();

    _widgetOptions = [
      AboutScreen(), // Your AboutScreen widget
      ScrabbleTimer(playerTime: _playerTime), // Your ScrabbleTimer widget
      SettingsScreen(
        onPlayerTimeChanged: _updatePlayerTime,
        onOvertimeLimitChanged: (int) {},
      ), // Your SettingsScreen widget
    ];
  }

  void _updatePlayerTime(int newTime) {
    setState(() {
      _playerTime = newTime;
      _widgetOptions[1] = ScrabbleTimer(playerTime: _playerTime);
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scrabble Timer'),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'About',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.timer),
            label: 'Timer',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        onTap: _onItemTapped,
      ),
    );
  }
}
