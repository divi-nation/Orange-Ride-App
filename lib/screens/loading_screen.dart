// lib/screens/loading_screen.dart

import 'package:flutter/material.dart';
import 'setup_screens/su_screen1.dart';  // Import the SUScreen1

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Simulate a loading delay of 10 seconds
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SUScreen1()),  // Navigate to SUScreen1
      );
    });

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 248, 120, 69), // Set background color to orange
      body: Center(
         child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(255, 248, 120, 69).withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Image.asset(
            'assets/images/logo.png',
            width: 200, // Set the width of the image
            height: 200, // Set the height of the image
          ),
        ),
      ),
    );
  }
}
