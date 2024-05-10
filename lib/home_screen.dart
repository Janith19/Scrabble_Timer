import 'package:flutter/material.dart';
import 'clock_widget.dart'; // Import your ClockWidget class from another file

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: ClockWidget(), // Specify the ClockWidget as the body content
    );
  }
}
