import 'package:flutter/material.dart';

class ClockButtons extends StatelessWidget {
  final VoidCallback onPlay;
  final VoidCallback onPause;
  final VoidCallback onReset;

  const ClockButtons({
    required this.onPlay,
    required this.onPause,
    required this.onReset,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: Icon(Icons.play_arrow),
            onPressed: onPlay,
            iconSize: 24, // Adjust the size of the icon
          ),
          IconButton(
            icon: Icon(Icons.pause),
            onPressed: onPause,
            iconSize: 24, // Adjust the size of the icon
          ),
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: onReset,
            iconSize: 24, // Adjust the size of the icon
          ),
        ],
      ),
    );
  }
}
