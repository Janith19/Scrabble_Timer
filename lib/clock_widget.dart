import 'package:flutter/material.dart';
import 'package:scrabble_timer/clock_screen_timer.dart';

class ClockWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ClockScreenTimer(
              isReversed: true,
              availableTime: Duration(minutes: 5, seconds: 10),
            ),
          ),
          Expanded(
              child: ClockScreenTimer(
            availableTime: Duration(minutes: 5, seconds: 10),
          )),
        ],
      ),
    );
  }
}
