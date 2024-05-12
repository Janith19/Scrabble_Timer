import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SettingsScreen extends StatefulWidget {
  final void Function(int) onPlayerTimeChanged; // Callback function

  SettingsScreen({required this.onPlayerTimeChanged});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  int _playerTime = 25; // Default player time in minutes

  void _updatePlayerTime() {
    // Show toast message
    Fluttertoast.showToast(
      msg: 'Player time updated to $_playerTime minutes',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.grey[700],
      textColor: Colors.white,
      fontSize: 16.0,
    );

    // Pass the entered value to the callback function
    widget.onPlayerTimeChanged(_playerTime);
  }

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
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content:
                            Text('Player time updated to $_playerTime minutes'),
                      ),
                    );
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
          ],
        ),
      ),
    );
  }
}
