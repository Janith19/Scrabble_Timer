import 'package:flutter/material.dart';
import 'clock.dart';
import 'control_buttons.dart';
import 'dart:async';

class ScrabbleTimer extends StatefulWidget {
  @override
  _ScrabbleTimerState createState() => _ScrabbleTimerState();
}

class _ScrabbleTimerState extends State<ScrabbleTimer> {
  Timer? _timer1;
  Timer? _timer2;
  int _seconds1 = 0;
  int _seconds2 = 0;
  bool _paused = false;

  void _startTimer(int timerNumber) {
    if (timerNumber == 1) {
      if (_timer1 == null || !_timer1!.isActive) {
        _timer1 = Timer.periodic(Duration(seconds: 1), (timer) {
          setState(() {
            _seconds1++;
          });
        });
      }
      if (_timer2 != null) {
        _timer2!.cancel();
      }
    } else {
      if (_timer2 == null || !_timer2!.isActive) {
        _timer2 = Timer.periodic(Duration(seconds: 1), (timer) {
          setState(() {
            _seconds2++;
          });
        });
      }
      if (_timer1 != null) {
        _timer1!.cancel();
      }
    }
  }

  void _pauseTimers() {
    if (_timer1 != null && _timer1!.isActive) {
      _timer1!.cancel();
    }
    if (_timer2 != null && _timer2!.isActive) {
      _timer2!.cancel();
    }
    setState(() {
      _paused = true;
    });
  }

  void _resetTimers() {
    if (_timer1 != null && _timer1!.isActive) {
      _timer1!.cancel();
    }
    if (_timer2 != null && _timer2!.isActive) {
      _timer2!.cancel();
    }
    setState(() {
      _seconds1 = 0;
      _seconds2 = 0;
      _paused = false;
    });
  }

  void _resumeTimers() {
    setState(() {
      _paused = false;
    });
    if (_seconds1 > 0) {
      _startTimer(1);
    }
    if (_seconds2 > 0) {
      _startTimer(2);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scrabble Timer'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Clock(
                isReversed: true,
                seconds: _seconds1,
                onStart: () {
                  if (!_paused) {
                    _startTimer(1);
                  } else {
                    _resumeTimers();
                  }
                },
              ),
            ),
            ControlButtons(
              onPause: _pauseTimers,
              onReset: _resetTimers,
            ),
            Expanded(
              child: Clock(
                isReversed: false,
                seconds: _seconds2,
                onStart: () {
                  if (!_paused) {
                    _startTimer(2);
                  } else {
                    _resumeTimers();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
