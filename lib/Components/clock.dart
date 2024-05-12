// clock.dart
import 'package:flutter/material.dart';

class Clock extends StatefulWidget {
  final bool isReversed;
  final int seconds;
  final int overtimeLimit;
  final VoidCallback onStart;

  const Clock({
    Key? key,
    required this.isReversed,
    required this.seconds,
    required this.overtimeLimit,
    required this.onStart,
  }) : super(key: key);

  @override
  _ClockState createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  late int _remainingSeconds;

  @override
  void initState() {
    super.initState();
    _remainingSeconds = widget.seconds;
  }

  @override
  void didUpdateWidget(covariant Clock oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.seconds != _remainingSeconds) {
      setState(() {
        _remainingSeconds = widget.seconds;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onStart,
      child: Center(
        child: CountdownText(
          isReversed: widget.isReversed,
          seconds: _remainingSeconds,
          overtimeLimit: widget.overtimeLimit,
        ),
      ),
    );
  }
}

class CountdownText extends StatelessWidget {
  final bool isReversed;
  final int seconds;
  final int overtimeLimit;

  const CountdownText({
    Key? key,
    required this.isReversed,
    required this.seconds,
    required this.overtimeLimit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int remainingSeconds = seconds;
    final isNegative = seconds < 0;

    if (isNegative) {
      remainingSeconds = (seconds.abs() % (overtimeLimit * 60));
    } else if (remainingSeconds == 0) {
      remainingSeconds = 0;
    }

    final minutes = remainingSeconds ~/ 60;
    remainingSeconds = remainingSeconds % 60;

    return Text(
      isReversed
          ? '${isNegative ? '-' : ''}${minutes.abs()}:${remainingSeconds.abs().toString().padLeft(2, '0')}'
          : '${minutes.abs()}:${remainingSeconds.abs().toString().padLeft(2, '0')}${isNegative ? '-' : ''}',
      style: TextStyle(
        fontSize: 50.0,
        fontWeight: FontWeight.bold,
        color: isNegative ? Colors.red : Colors.black,
      ),
    );
  }
}
