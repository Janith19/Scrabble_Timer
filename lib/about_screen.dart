import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 21, 47, 65),
      appBar: AppBar(
        title: Text(
          '',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
        ),
        centerTitle: true,
        foregroundColor: Color.fromARGB(255, 255, 255, 255),
        backgroundColor: Color.fromARGB(255, 21, 47, 65),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Replace this with your actual logo image
            Image.asset(
              'assets/Logo2white.png',
              // Adjust height as needed
            ),
            SizedBox(height: 20),
            Text(
              '',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
