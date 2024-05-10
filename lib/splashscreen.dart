import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Use a short delay before navigating to ensure context is available.
    Future.delayed(Duration(milliseconds: 3000), () {
      Navigator.of(context).pushReplacementNamed('/home');
    });

    // Add any initialization logic here, such as loading data or assets.
    // Example:
    // Future.delayed(Duration(seconds: 3), () {
    //   Navigator.of(context).pushReplacementNamed('/home');
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255), // Customize the background color if needed.
      body: Center(
        child: Image.asset('assets/Logo.png'), // Adjust the asset path.
      ),
    );
  }
}
