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
  int _overtimeLimit = 5; // Default overtime limit in minutes
  int _penaltyscore = 10; // Default penalty score

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 21, 47, 65),
      appBar: AppBar(
        title: Text(
          'Settings',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
        ),
        centerTitle: true,
        foregroundColor: Color.fromARGB(255, 255, 255, 255),
        backgroundColor: Color.fromARGB(255, 21, 47, 65),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: _buildSettingsCard(
                'Time for Each Player (in minutes):',
                _playerTime,
                (value) {
                  setState(() {
                    _playerTime = int.tryParse(value) ?? 0;
                  });
                },
                () {
                  widget.onPlayerTimeChanged(_playerTime);
                },
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: _buildSettingsCard(
                'Overtime Limit (in minutes):',
                _overtimeLimit,
                (value) {
                  setState(() {
                    _overtimeLimit = int.tryParse(value) ?? 0;
                  });
                },
                () {
                  widget.onOvertimeLimitChanged(_overtimeLimit);
                },
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: _buildSettingsCard(
                'Penalty Score',
                _penaltyscore,
                (value) {
                  setState(() {
                    _penaltyscore = int.tryParse(value) ?? 0;
                  });
                },
                () {
                  widget.onPenaltyTimeChanged(_penaltyscore);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsCard(String title, int initialValue,
      Function(String) onChanged, VoidCallback onSave) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 30, 80, 100),
              Color.fromARGB(255, 50, 100, 120)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 8),
                Container(
                  width: double.infinity,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    initialValue: initialValue.toString(),
                    onChanged: onChanged,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      hintText: 'Enter value',
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Center(
                  child: ElevatedButton(
                    onPressed: onSave,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 21, 47, 65),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      shadowColor: Colors.black,
                      elevation: 5,
                    ),
                    child: Text(
                      'Save',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
