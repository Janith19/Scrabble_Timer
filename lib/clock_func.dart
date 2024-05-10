import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ClockFunc {
  num _startedAt = -1;
  num _millisElapsed = 0;

  final Function getNowMillis;
  final int timeControlMillis;

  ClockFunc({
    required this.getNowMillis,
    required this.timeControlMillis,
  });

  void start() {
    _startedAt = getNowMillis();
  }

  void pause() {
    _millisElapsed += (getNowMillis() - _startedAt)!;
    _startedAt = -1;
  }

  num getMillisElapsed() {
    if (_startedAt == -1) {
      return _millisElapsed;
    }
    return getNowMillis() - _startedAt + _millisElapsed;
  }

  bool isTicking() {
    return _startedAt != -1;
  }

  bool isTimeUp(){
    return getAvailableMillis() <=
  }

  num getAvailableMillis() {
    return timeControlMillis - getMillisElapsed();
  }
}
