import 'package:flutter/material.dart';

class Clock extends StatelessWidget {
  final bool isReversed;
  final int seconds;
  final int overtimeLimit;
  final int penalty;
  final VoidCallback onStart;

  const Clock({
    Key? key,
    required this.isReversed,
    required this.seconds,
    required this.overtimeLimit,
    required this.penalty,
    required this.onStart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onStart,
      child: Container(
        height: double.infinity,
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child:
                  SizedBox(), // Empty expanded widget to spread to the first half
            ),
            Expanded(
              flex: 2, // Takes 2 parts out of 3 parts of the row
              child: Container(
                height: double.infinity,
                alignment: Alignment.center,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Container(
                        color: Colors.transparent,
                        child: Center(
                          child: Text(
                            'Timer', // Display any text or content you want here
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    CountdownText(
                      isReversed: isReversed,
                      seconds: seconds,
                      overtimeLimit: overtimeLimit,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child:
                  SizedBox(), // Empty expanded widget to spread to the second half
            ),
          ],
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
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 50.0,
        fontWeight: FontWeight.bold,
        color: isNegative ? Colors.red : Colors.black,
      ),
    );
  }
}
