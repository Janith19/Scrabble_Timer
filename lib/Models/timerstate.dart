import 'package:flutter/material.dart';

class TimerState extends ChangeNotifier {
  int playerTime = 25;
  int overtimeLimit = 5;

  void updatePlayerTime(int newTime) {
    playerTime = newTime;
    notifyListeners();
  }

  void updateOvertimeLimit(int newLimit) {
    overtimeLimit = newLimit;
    notifyListeners();
  }
}
