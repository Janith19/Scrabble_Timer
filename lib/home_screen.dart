import 'package:flutter/material.dart';
import 'package:scrabble_timer/Components/scrabbletimer.dart';

void main() {
  runApp(HomeScreen());
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scrabble Timer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ScrabbleTimer(),
    );
  }
}
