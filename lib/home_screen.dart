import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:scrabble_timer/Components/scrabbletimer.dart';
import 'about_screen.dart';
import 'settings_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 1; // Set initial index to 1 (for Timer)
  int _playerTime = 25;
  int _overtimeLimit = 5;
  int _penaltyscore = 10;

  late List<Widget> _widgetOptions;

  @override
  void initState() {
    super.initState();
    _widgetOptions = [
      AboutScreen(),
      ScrabbleTimer(
        key: UniqueKey(),
        playerTime: _playerTime,
        overtimeLimit: _overtimeLimit,
        penaltyScore: _penaltyscore,
      ),
      SettingsScreen(
        onPlayerTimeChanged: _updatePlayerTime,
        onOvertimeLimitChanged: _updateOvertimeLimit,
        onPenaltyTimeChanged: _updatePenaltyScore,
      ),
    ];
  }

  void _updatePlayerTime(int newTime) {
    setState(() {
      _playerTime = newTime;
      _widgetOptions[1] = ScrabbleTimer(
        key: UniqueKey(),
        playerTime: _playerTime,
        overtimeLimit: _overtimeLimit,
        penaltyScore: _penaltyscore,
      );
    });
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
        key: UniqueKey(),
        playerTime: _playerTime,
        overtimeLimit: _overtimeLimit,
        penaltyScore: _penaltyscore,
      );
    });
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
        key: UniqueKey(),
        playerTime: _playerTime,
        overtimeLimit: _overtimeLimit,
        penaltyScore: _penaltyscore,
      );
    });
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
            icon: Icon(Icons.settings),
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
