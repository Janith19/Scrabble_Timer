import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'clock.dart';
import 'control_buttons.dart';

class ScrabbleTimer extends StatefulWidget {
  final int playerTime;

  ScrabbleTimer({Key? key, this.playerTime = 25}) : super(key: key);

  @override
  _ScrabbleTimerState createState() => _ScrabbleTimerState();
}

class _ScrabbleTimerState extends State<ScrabbleTimer> {
  Timer? _timer1;
  Timer? _timer2;
  late int _playerTime;
  late int _seconds1;
  late int _seconds2;
  int _penalty1 = 0; // Placeholder value for penalty on timer 1
  int _penalty2 = 0; // Placeholder value for penalty on timer 2
  bool _paused = false;

  @override
  void initState() {
    super.initState();
    _playerTime = widget.playerTime;
    _seconds1 = _playerTime * 60;
    _seconds2 = _playerTime * 60;
  }

  void _updatePlayerTime(int time) {
    setState(() {
      _playerTime = time;
      _seconds1 = _playerTime * 60;
      _seconds2 = _playerTime * 60;
    });
  }

  void _startTimer1() {
    _timer1?.cancel();
    _timer1 = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _seconds1--;
      });
    });
    _timer2?.cancel();
  }

  void _startTimer2() {
    _timer2?.cancel();
    _timer2 = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _seconds2--;
      });
    });
    _timer1?.cancel();
  }

  void _pauseTimers() {
    _timer1?.cancel();
    _timer2?.cancel();
    setState(() {
      _paused = true;
    });
  }

  void _resetTimers() {
    _timer1?.cancel();
    _timer2?.cancel();
    setState(() {
      _seconds1 = _playerTime * 60;
      _seconds2 = _playerTime * 60;
      _paused = false;
    });
  }

  void _resumeTimers() {
    setState(() {
      _paused = false;
    });
    if (_seconds1 > 0) {
      _startTimer1();
    } else if (_seconds2 > 0) {
      _startTimer2();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: Clock(
                      isReversed: true,
                      seconds: _seconds1,
                      onStart: () {
                        if (!_paused) {
                          _startTimer2();
                        } else {
                          _startTimer2();
                        }
                      },
                      overtimeLimit: 5,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 20.0, top: 50, bottom: 0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: RotatedBox(
                        quarterTurns: true ? 2 : 0,
                        child: Text(
                          'Penalty: $_penalty1',
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ControlButtons(
                onPause: _pauseTimers,
                onReset: _resetTimers,
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 0.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Penalty: $_penalty2',
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Clock(
                      isReversed: false,
                      seconds: _seconds2,
                      onStart: () {
                        if (!_paused) {
                          _startTimer1();
                        } else {
                          _startTimer1();
                        }
                      },
                      overtimeLimit: 5,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
