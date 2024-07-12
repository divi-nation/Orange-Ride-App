// lib/screens/loading_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/setup_screens/su_screen1.dart';
import 'setup_screens/su_screen1.dart';  // Import the SUScreen1

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Simulate a loading delay of 10 seconds
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SUScreen1()),  // Navigate to SUScreen1
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
                offset: const Offset(0, 3), // changes position of shadow
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
