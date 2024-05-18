import 'package:auto_size_text/auto_size_text.dart';
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
                flex: 2,
                child: RotatedBox(
                  quarterTurns: isReversed ? 2 : 0,
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
                                '', // Display any text or content you want here
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
                ) // Takes 2 parts out of 3 parts of the row

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
    final screenWidth = MediaQuery.of(context).size.width;
    final maxFontSize = screenWidth * 0.1;

    return AutoSizeText(
      isReversed
          ? '${isNegative ? '-' : ''}${minutes.abs()}:${remainingSeconds.abs().toString().padLeft(2, '0')}'
          : '${isNegative ? '-' : ''}${minutes.abs()}:${remainingSeconds.abs().toString().padLeft(2, '0')}',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: 'Lato',
        fontSize: 100.0,
        fontWeight: FontWeight.w900,
        color: isNegative
            ? Color.fromARGB(255, 21, 47, 65)
            : Color.fromARGB(255, 21, 47, 65),
      ),
      maxLines: 1,
      minFontSize: 10, // Specify the minimum font size
      maxFontSize: 100.0, // Specify the maximum font size
      overflow: TextOverflow.ellipsis,
    );
  }
}
