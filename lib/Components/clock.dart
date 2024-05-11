import 'package:flutter/material.dart';

class Clock extends StatelessWidget {
  final int seconds;
  final Function onStart;
  final bool isReversed;

  Clock(
      {required this.seconds, required this.onStart, required this.isReversed});

  String _formatTime(int timeInSeconds) {
    int hours = timeInSeconds ~/ 3600;
    int minutes = (timeInSeconds % 3600) ~/ 60;
    int seconds = timeInSeconds % 60;
    return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onStart as void Function()?,
        child: Container(
          child: RotatedBox(
            quarterTurns: isReversed ? 2 : 0,
            child: Text(
              _formatTime(seconds),
              style: TextStyle(fontSize: 70),
            ),
          ),
        ));
  }
}
