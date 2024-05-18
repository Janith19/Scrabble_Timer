import 'package:flutter/material.dart';

class ControlButtons extends StatelessWidget {
  final VoidCallback onPause;
  final VoidCallback onReset;
  final double iconSize; // Add iconSize property

  ControlButtons({
    required this.onPause,
    required this.onReset,
    this.iconSize = 36, // Default icon size
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.pause),
          onPressed: onPause,
          iconSize: iconSize, // Set icon size
        ),
        IconButton(
          icon: Icon(Icons.refresh),
          onPressed: onReset,
          iconSize: iconSize, // Set icon size
        ),
      ],
    );
  }
}
