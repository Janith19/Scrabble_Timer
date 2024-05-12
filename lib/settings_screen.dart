// settings_screen.dart
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  final void Function(int) onPlayerTimeChanged;
  final void Function(int) onOvertimeLimitChanged;

  SettingsScreen({
    required this.onPlayerTimeChanged,
    required this.onOvertimeLimitChanged,
  });

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  int _playerTime = 25; // Default player time in minutes
  int _overtimeLimit = 5; // Default overtime limit in minutes

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
                ElevatedButton(
                  onPressed: () {
                    widget.onPlayerTimeChanged(_playerTime);
                  },
                  child: Text('Save'),
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
                ElevatedButton(
                  onPressed: () {
                    widget.onOvertimeLimitChanged(_overtimeLimit);
                  },
                  child: Text('Save'),
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
          ],
        ),
      ),
    );
  }
}
