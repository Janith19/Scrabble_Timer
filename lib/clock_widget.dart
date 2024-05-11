import 'dart:async';

import 'package:flutter/material.dart';
import 'package:scrabble_timer/clock_func.dart';
import 'package:scrabble_timer/clock_screen_timer.dart';

class ClockWidget extends StatefulWidget {
  @override
  State<ClockWidget> createState() => _ClockWidgetState();
}

class _ClockWidgetState extends State<ClockWidget> {
  ClockFunc _topClock = ClockFunc(
    getNowMillis: () => DateTime.now().millisecondsSinceEpoch,
    timeControlMillis: 5 * 60 * 1000,
    incrementsMillis: 1000,
  );

  ClockFunc _bottomClock = ClockFunc(
    getNowMillis: () => DateTime.now().millisecondsSinceEpoch,
    timeControlMillis: 5 * 60 * 1000,
    incrementsMillis: 1000,
  );

  late Timer _timer;

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(milliseconds: 200), (timer) {
      setState(() {});
    });
  }

  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  void _onTopPressed() {
    _topClock.pause();
    _bottomClock.start();
  }

  void _onBottomPressed() {
    _bottomClock.pause();
    _topClock.start();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ClockScreenTimer(
              onPressed: _onTopPressed,
              isReversed: true,
              isTicking: _topClock.isTicking(),
              isTimeUp: _topClock.isTimeUp(),
              availableTime: Duration(
                milliseconds: _topClock.getAvailableMillis().toInt(),
              ),
            ),
          ),
          Expanded(
              child: ClockScreenTimer(
            onPressed: _onBottomPressed,
            isTicking: _bottomClock.isTicking(),
            isTimeUp: _bottomClock.isTimeUp(),
            availableTime: Duration(
              milliseconds: _bottomClock.getAvailableMillis().toInt(),
            ),
          )),
        ],
      ),
    );
  }
}
