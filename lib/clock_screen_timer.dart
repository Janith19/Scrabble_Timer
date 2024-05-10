import 'package:flutter/material.dart';

class ClockScreenTimer extends StatelessWidget {
  final bool isReversed;
  final bool isTicking;
  final bool isTimeUp;

  const ClockScreenTimer({
    Key? key,
    this.isReversed = false,
    this.isTicking = false,
    this.isTimeUp = false,
  }) : super(key: key);

  Color? _getColor() {
    if (isTicking) {
      return Colors.orange;
    }
    if (isTimeUp) {
      return Colors.red;
    }
    return Colors.black.withAlpha(30);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: _getColor(),
      child: Center(
        child: RotatedBox(
          quarterTurns: isReversed ? 2 : 0,
          child: Text(
            "00.05",
            style: TextStyle(
              fontSize: 70,
            ),
          ),
        ),
      ),
    );
  }
}
