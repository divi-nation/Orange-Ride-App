// lib/screens/authentication/auth_02.dart

import 'package:flutter/material.dart';
import 'auth_04.dart';

class Auth02 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double buttonWidth = MediaQuery.of(context).size.width * 0.9; // 90% of screen width
    double socialButtonSize = MediaQuery.of(context).size.width * 0.15; // 20% of screen width for social buttons

    return Scaffold(
      backgroundColor: Colors.white, // Set Scaffold background color to white

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Back button and "Sign Up" text
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      onPressed: () {
                        Navigator.pop(context); // Navigate back to previous screen
                      },
                    ),
                    Text(
                      'Back',
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              // Input fields: Name, Email, Phone (with country code), Gender
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Name',
                        hintText: 'Enter your name',
                        border: OutlineInputBorder(), // Rectangular border
                      ),
                    ),
                    SizedBox(height: 16.0),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Email',
                        hintText: 'Enter your email',
                        border: OutlineInputBorder(), // Rectangular border
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Row(
                      children: [
                        // Country Code Dropdown
                        Expanded(
                          flex: 1,
                          child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              labelText: 'Code',
                              hintText: 'Select',
                              border: OutlineInputBorder(), // Rectangular border
                            ),
                            items: [
                              DropdownMenuItem(
                                value: '+1',
                                child: Text('+1'),
                              ),
                              DropdownMenuItem(
                                value: '+91',
                                child: Text('+91'),
                              ),
                              DropdownMenuItem(
                                value: '+44',
                                child: Text('+44'),
                              ),
                            ],
                            onChanged: (value) {},
                          ),
                        ),
                        SizedBox(width: 16.0),
                        // Actual Phone Number Text Field
                        Expanded(
                          flex: 3,
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Phone Number',
                              hintText: 'Enter your phone number',
                              border: OutlineInputBorder(), // Rectangular border
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.0),
                    // Gender Dropdown
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        labelText: 'Gender',
                        hintText: 'Select',
                        border: OutlineInputBorder(), // Rectangular border
                      ),
                      items: [
                        DropdownMenuItem(
                          value: 'male',
                          child: Text('Male'),
                        ),
                        DropdownMenuItem(
                          value: 'female',
                          child: Text('Female'),
                        ),
                      ],
                      onChanged: (value) {},
                    ),
                    SizedBox(height: 16.0),
                    // Privacy Policy Text
                    Row(
                      children: [
                        Icon(
                          Icons.check,
                          color: Colors.green,
                          size: 16.0,
                        ),
                        SizedBox(width: 4.0),
                        Expanded(
                          child: RichText(
                            text: TextSpan(
                              text: 'By signing up, you agree to the ',
                              style: TextStyle(color: Colors.black),
                              children: [
                                TextSpan(
                                  text: 'terms of service',
                                  style: TextStyle(
                                    color: Colors.orange,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text: ' and ',
                                  style: TextStyle(color: Colors.black),
                                ),
                                TextSpan(
                                  text: 'privacy policy',
                                  style: TextStyle(
                                    color: Colors.orange,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    // Sign Up Button
                    Container(
                      width: buttonWidth,
                      child: ElevatedButton(
                        onPressed: () {
                          // Handle Sign Up button tap
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Auth04()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 248, 120, 69), // Button background color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0), // Adjust border radius
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12.0),
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    // Horizontal line with "or"
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 1.0,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text('or'),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 1.0,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    // Social media sign-up buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: socialButtonSize,
                          height: socialButtonSize,
                          child: ElevatedButton(
                            onPressed: () {
                              // Handle Google sign-up
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                side: BorderSide(color: Colors.grey),
                              ),
                            ),
                            child: Image.asset('assets/images/google_logo.png'), // Change this to your Google logo asset path
                          ),
                        ),
                        Container(
                          width: socialButtonSize,
                          height: socialButtonSize,
                          child: ElevatedButton(
                            onPressed: () {
                              // Handle Facebook sign-up
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                side: BorderSide(color: Colors.grey),
                              ),
                            ),
                            child: Image.asset('assets/images/facebook_logo.png'), // Change this to your Facebook logo asset path
                          ),
                        ),
                        Container(
                          width: socialButtonSize,
                          height: socialButtonSize,
                          child: ElevatedButton(
                            onPressed: () {
                              // Handle Apple sign-up
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                side: BorderSide(color: Colors.grey),
                              ),
                            ),
                            child: Image.asset('assets/images/apple_logo.png'), // Change this to your Apple logo asset path
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                     // Already have an account? Sign In
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account? ',
                          style: TextStyle(fontSize: 14.0),
                        ),
                        GestureDetector(
                          onTap: () {
                            // Handle Sign In tap
                          },
                          child: Text(
                            'Sign In',
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.orange,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
