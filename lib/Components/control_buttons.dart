import 'package:flutter/material.dart';

class ControlButtons extends StatelessWidget {
  final VoidCallback onPause;
  final VoidCallback onReset;

  ControlButtons({required this.onPause, required this.onReset});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.pause),
          onPressed: onPause,
        ),
        IconButton(
          icon: Icon(Icons.refresh),
          onPressed: onReset,
        ),
      ],
    );
  }
}
