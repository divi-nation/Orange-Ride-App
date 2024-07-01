// lib/screens/setup_screens/su_screen1.dart

import 'package:flutter/material.dart';
import 'su_screen2.dart'; // Import the screen you want to navigate to

class SUScreen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set Scaffold background color to white
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // First line: Skip button on the right side
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 3.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      // Implement skip functionality here
                    },
                    child: Text(
                      'Skip',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 70, 70, 70),
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Spacer for second line
            SizedBox(height: 1.0), // Adjust height as needed
            // Image spanning lines 3-5
             Container(
              width: MediaQuery.of(context).size.width * 0.5, // Adjust width as needed
              child: Image.asset('assets/images/logo.png'), // Change this to your image asset path
            ),
            // Spacer for the remaining lines
             // Line 6: Bold text
            Text(
              'Anywhere you are',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            // Line 6: Small text under bold text
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 4.0),
              child: Text(
                'Anywhere you are you can order a bike and we will come and pick you up no matter the distance and network status',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13.0,
                  color: Colors.grey[600],
                ),
              ),
            ),
            // Button at the bottom
            Spacer(flex: 1,),
            Align(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () {
                  // Navigate to SUScreen2 when button is tapped
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SUScreen2()),
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 130.0),
                  width: 60.0,
                  height: 60.0,
                  decoration: BoxDecoration(
                    color:Color.fromARGB(255, 248, 120, 69),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
          
        ),
        
      ),
    );
  }
}