// lib/screens/authentication/auth_01.dart

import 'package:flutter/material.dart';
import 'auth_02.dart'; // Import the screen you want to navigate to
import 'auth_03.dart'; // Import the screen you want to navigate to

class Auth01 extends StatelessWidget {
  const Auth01({super.key});

  @override
  Widget build(BuildContext context) {
    double buttonWidth = MediaQuery.of(context).size.width * 0.9; // 90% of screen width

    return Scaffold(
      backgroundColor: Colors.white, // Set Scaffold background color to white

      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // First line: Skip button on the right side
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 3.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      // Implement skip functionality here
                    },
                    child: const Text(
                      'Skip',
                      style: TextStyle(
                        color: Color.fromARGB(255, 70, 70, 70),
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Spacer for second line
            const SizedBox(height: 10.0), // Adjust height as needed
            // Image spanning lines 3-5
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5, // Adjust width as needed
              child: Image.asset('assets/images/logo.png'), // Change this to your image asset path
            ),
            // Spacer for the remaining lines
            // Line 6: Bold text
            const Text(
              'Welcome',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            // Line 7: Small text under bold text
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 8.0),
              child: Text(
                'Have a better riding experience',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13.0,
                  color: Colors.grey[600],
                ),
              ),
            ),
            // Buttons
            const SizedBox(height: 90.0),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 5.0),

              width: buttonWidth,
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to Auth02 screen when button is tapped
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Auth02()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 248, 120, 69), // Button background color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0), // Adjust border radius
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.0),
                  child: Text(
                    'Create an Account',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12.0), // Adjust vertical spacing between buttons
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 5.0),
              width: buttonWidth,
              child: OutlinedButton(
                onPressed: () {
                  // Handle Log In button tap
                   Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Auth03()),
                  );
                },
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Color.fromARGB(255, 248, 118, 42)), // Border color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0), // Adjust border radius
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.0),
                  child: Text(
                    'Log In',
                    style: TextStyle(
                      color: Color.fromARGB(255, 243, 131, 33),
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10.0), // Adjust vertical spacing below buttons
          ],
        ),
      ),
    );
  }
}
