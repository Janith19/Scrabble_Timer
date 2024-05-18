import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
  int _playerTime = 25;
  int _overtimeLimit = 5;
  int _penaltyscore = 10; // Default player time in minutes

  late List<Widget> _widgetOptions; // Declare _widgetOptions

  @override
  void initState() {
    super.initState();

    _widgetOptions = [
      AboutScreen(), // Your AboutScreen widget
      ScrabbleTimer(
        playerTime: _playerTime,
        overtimeLimit: _overtimeLimit,
        penaltyScore: _penaltyscore, // Pass the overtime limit value
      ), // Your ScrabbleTimer widget
      SettingsScreen(
        onPlayerTimeChanged: _updatePlayerTime,
        onOvertimeLimitChanged: _updateOvertimeLimit,
        onPenaltyTimeChanged: _updatePenaltyScore,
      ), // Your SettingsScreen widget
    ];
  }

  void _updatePlayerTime(int newTime) {
    setState(() {
      _playerTime = newTime;
      _widgetOptions[1] = ScrabbleTimer(
        penaltyScore: _penaltyscore,
        playerTime: _playerTime,
        overtimeLimit: _overtimeLimit,
      );
    });
    // Show toast message for player time change
    Fluttertoast.showToast(
      msg: "Player time updated to $_playerTime minutes",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.black.withOpacity(0.8),
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  void _updateOvertimeLimit(int newTime) {
    setState(() {
      _overtimeLimit = newTime;
      _widgetOptions[1] = ScrabbleTimer(
        penaltyScore: _penaltyscore,
        playerTime: _playerTime,
        overtimeLimit: _overtimeLimit,
      );
    });
    // Show toast message for overtime limit change
    Fluttertoast.showToast(
      msg: "Overtime limit updated to $_overtimeLimit minutes",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.black.withOpacity(0.8),
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  void _updatePenaltyScore(int newTime) {
    setState(() {
      _penaltyscore = newTime;
      _widgetOptions[1] = ScrabbleTimer(
        penaltyScore: _penaltyscore,
        playerTime: _playerTime,
        overtimeLimit: _overtimeLimit,
      );
    });
    // Show toast message for overtime limit change
    Fluttertoast.showToast(
      msg: "Penalty Score per minute updated to $_penaltyscore points",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.black.withOpacity(0.8),
      textColor: Colors.white,
      fontSize: 16.0,
    );
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
        toolbarHeight: 0,
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
            icon: Icon(
              Icons.settings,
            ),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromARGB(255, 21, 47, 65),
        onTap: _onItemTapped,
      ),
    );
  }
}
