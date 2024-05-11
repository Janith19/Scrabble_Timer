import 'package:flutter/material.dart';

class ClockButtons extends StatelessWidget {
  const ClockButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          icon: Icon(Icons.play_arrow),
          onPressed: () {}, // Adjust the size of the icon
        ),
        IconButton(
          icon: Icon(Icons.pause),
          onPressed: () {}, // Adjust the size of the icon
        ),
        IconButton(
          icon: Icon(Icons.refresh),
          onPressed: () {}, // Adjust the size of the icon
        ),
      ],
    );
  }
}
