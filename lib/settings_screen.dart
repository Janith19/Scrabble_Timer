import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  final void Function(int) onPlayerTimeChanged;
  final void Function(int) onOvertimeLimitChanged;
  final void Function(int) onPenaltyTimeChanged;

  SettingsScreen({
    required this.onPlayerTimeChanged,
    required this.onOvertimeLimitChanged,
    required this.onPenaltyTimeChanged,
  });

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  int _playerTime = 25; // Default player time in minutes
  int _overtimeLimit = 5;
  int _penaltyscore = 10; // Default overtime limit in minutes

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    'Time for Each Player (in minutes):',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    widget.onPlayerTimeChanged(_playerTime);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      'Save',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            TextFormField(
              keyboardType: TextInputType.number,
              initialValue: _playerTime.toString(),
              onChanged: (value) {
                setState(() {
                  _playerTime = int.tryParse(value) ?? 0;
                });
              },
              decoration: InputDecoration(
                hintText: 'Enter time for each player',
              ),
            ),
            SizedBox(height: 16),
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    'Overtime Limit (in minutes):',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    widget.onOvertimeLimitChanged(_overtimeLimit);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      'Save',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            TextFormField(
              keyboardType: TextInputType.number,
              initialValue: _overtimeLimit.toString(),
              onChanged: (value) {
                setState(() {
                  _overtimeLimit = int.tryParse(value) ?? 0;
                });
              },
              decoration: InputDecoration(
                hintText: 'Enter overtime limit',
              ),
            ),
            SizedBox(height: 16),
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    'Penalty Score',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    widget.onPenaltyTimeChanged(_penaltyscore);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      'Save',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            TextFormField(
              keyboardType: TextInputType.number,
              initialValue: _penaltyscore.toString(),
              onChanged: (value) {
                setState(() {
                  _penaltyscore = int.tryParse(value) ?? 0;
                });
              },
              decoration: InputDecoration(
                hintText: 'Enter Penalty Score Per Minute',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
