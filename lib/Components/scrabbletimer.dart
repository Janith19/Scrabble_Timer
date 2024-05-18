import 'dart:async';
import 'package:flutter/material.dart';
import 'clock.dart';
import 'control_buttons.dart';

class ScrabbleTimer extends StatefulWidget {
  final int playerTime;
  int overtimeLimit;
  int penaltyScore;

  ScrabbleTimer({
    Key? key,
    this.playerTime = 25,
    this.overtimeLimit = 5,
    this.penaltyScore = 10,
  }) : super(key: key);

  @override
  _ScrabbleTimerState createState() => _ScrabbleTimerState();
}

class _ScrabbleTimerState extends State<ScrabbleTimer> {
  Timer? _timer1;
  Timer? _timer2;
  late int _playerTime;
  late int _seconds1;
  late int _seconds2;
  int _penalty1 = 0;
  int _penalty2 = 0;
  bool _paused = false;
  bool _timer1Running = false;
  bool _timer2Running = false;

  @override
  void initState() {
    super.initState();
    _playerTime = widget.playerTime;
    _seconds1 = _playerTime * 60;
    _seconds2 = _playerTime * 60;
  }

  @override
  void dispose() {
    _timer1?.cancel();
    _timer2?.cancel();
    super.dispose();
  }

  void _updatePlayerTime(int time) {
    setState(() {
      _playerTime = time;
      _seconds1 = _playerTime * 60;
      _seconds2 = _playerTime * 60;
    });
  }

  void _startTimer1() {
    if (!_timer1Running) {
      _timer1?.cancel();
      _timer1Running = true;
      _timer1 = Timer.periodic(Duration(seconds: 1), (timer) {
        setState(() {
          if (_seconds1 <= -widget.overtimeLimit * 60) {
            _timer1?.cancel();
            _timer1Running = false;
          } else {
            _seconds1--;
            if (_seconds1 <= 0 && _seconds1 % 60 == 0) {
              _penalty1 += widget.penaltyScore; // Increment penalty per minute
              print("Penalty 1: $_penalty1"); // Print penalty value
            }
          }
        });
      });
      _timer2?.cancel();
      _timer2Running = false;
      setState(() {});
    }
  }

  void _startTimer2() {
    if (!_timer2Running) {
      _timer2?.cancel();
      _timer2Running = true;
      _timer2 = Timer.periodic(Duration(seconds: 1), (timer) {
        setState(() {
          if (_seconds2 <= -widget.overtimeLimit * 60) {
            _timer2?.cancel();
            _timer2Running = false;
          } else {
            _seconds2--;
            if (_seconds2 <= 0 && _seconds2 % 60 == 0) {
              _penalty2 += widget.penaltyScore; // Increment penalty per minute
              print("Penalty 2: $_penalty2"); // Print penalty value
            }
          }
        });
      });
      _timer1?.cancel();
      _timer1Running = false;
      setState(() {});
    }
  }

  void _pauseTimers() {
    _timer1?.cancel();
    _timer2?.cancel();
    _timer1Running = false;
    _timer2Running = false;
    setState(() {
      _paused = true;
    });
  }

  void _resetTimers() {
    _timer1?.cancel();
    _timer2?.cancel();
    _timer1Running = false;
    _timer2Running = false;
    setState(() {
      _seconds1 = _playerTime * 60;
      _seconds2 = _playerTime * 60;
      _penalty1 = 0;
      _penalty2 = 0;
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
      backgroundColor: Color.fromARGB(255, 21, 47, 65),
      body: Center(
        child: Column(
          children: <Widget>[
            Expanded(
              child: InkWell(
                onTap: () {
                  if (!_paused) {
                    _startTimer2();
                  } else {
                    _startTimer2();
                  }
                },
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Card(
                          color: _timer1Running && _seconds1 > 0
                              ? Colors.orange
                              : _seconds1 <= 0 && _timer1Running
                                  ? Colors.red
                                  : null,
                          elevation: 4,
                          child: Column(
                            children: [
                              Expanded(
                                child: Clock(
                                  isReversed: true,
                                  seconds: _seconds1,
                                  onStart: _startTimer2,
                                  overtimeLimit: widget.overtimeLimit,
                                  penalty: _penalty1,
                                ),
                              ),
                              Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: RotatedBox(
                                    quarterTurns: true ? 2 : 0,
                                    child: Text(
                                      _seconds1 == -widget.overtimeLimit * 60
                                          ? 'Disqualified'
                                          : 'Penalty: $_penalty1',
                                      style: TextStyle(
                                          fontFamily: 'Lato',
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 0),
            ControlButtons(
              onPause: _pauseTimers,
              onReset: _resetTimers,
              iconSize: 60, // Increase the icon size
            ),
            SizedBox(height: 0),
            Expanded(
              child: InkWell(
                onTap: () {
                  if (!_paused) {
                    _startTimer1();
                  } else {
                    _startTimer1();
                  }
                },
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Card(
                          color: _timer2Running && _seconds2 > 0
                              ? Colors.orange
                              : _seconds2 <= 0 && _timer2Running
                                  ? Colors.red
                                  : null,
                          elevation: 4,
                          child: Column(
                            children: [
                              Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: RotatedBox(
                                    quarterTurns: false ? 2 : 0,
                                    child: Text(
                                      _seconds2 == -widget.overtimeLimit * 60
                                          ? 'Disqualified'
                                          : 'Penalty: $_penalty2',
                                      style: TextStyle(
                                          fontFamily: 'Lato',
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )),
                              Expanded(
                                child: Clock(
                                  isReversed: false,
                                  seconds: _seconds2,
                                  onStart: _startTimer1,
                                  overtimeLimit: widget.overtimeLimit,
                                  penalty: _penalty2,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
