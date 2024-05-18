import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scrabble_timer/Models/timerstate.dart';

import 'splashscreen.dart';
import 'home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TimerState(),
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: 'Lato',
          primarySwatch: Colors.blue,
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: Color.fromARGB(
                255, 21, 47, 65), // Set your desired cursor color here
            selectionColor: Color.fromARGB(
                255, 21, 47, 65), // Set your desired selection color here
            selectionHandleColor: Color.fromARGB(255, 21, 47,
                65), // Set your desired selection handle color here
          ),
          inputDecorationTheme: InputDecorationTheme(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Color.fromARGB(
                      255, 21, 47, 65)), // Set your desired border color here
            ),
          ),
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => SplashScreen(),
          '/home': (context) => HomeScreen(),
        },
      ),
    );
  }
}
