// lib/screens/authentication/auth_03.dart

import 'package:flutter/material.dart';
import 'auth_04.dart';

class Auth03 extends StatefulWidget {
  const Auth03({super.key});

  @override
  _Auth03State createState() => _Auth03State();
}

class _Auth03State extends State<Auth03> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    double buttonWidth =
        MediaQuery.of(context).size.width * 0.9; // 90% of screen width
    double socialButtonSize = MediaQuery.of(context).size.width *
        0.15; // 15% of screen width for social buttons

    return Scaffold(
      backgroundColor: Colors.white, // Set Scaffold background color to white
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Back button and "Log In" text
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back_ios),
                      onPressed: () {
                        Navigator.pop(
                            context); // Navigate back to previous screen
                      },
                    ),
                    const Text(
                      'Back',
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Log In',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              // Input fields: Email or Phone Number, Password
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Email or Phone Number',
                        hintText: 'Enter your email or phone number',
                        border: OutlineInputBorder(), // Rectangular border
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      obscureText: !_isPasswordVisible,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        hintText: 'Enter your password',
                        border: const OutlineInputBorder(), // Rectangular border
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _isPasswordVisible = !_isPasswordVisible;
                            });
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {
                          // Handle Forgot Password tap
                        },
                        child: const Text(
                          'Forgot password?',
                          style: TextStyle(
                            color: Colors.orange,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                        height:
                            60.0), // Increased space above the Log In button
                    // Log In Button
                    SizedBox(
                      width: buttonWidth,
                      child: ElevatedButton(
                        onPressed: () {
                          // Handle Log In button tap
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(
                              255, 248, 120, 69), // Button background color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                8.0), // Adjust border radius
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 12.0),
                          child: Text(
                            'Log In',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    // Horizontal line with "or"
                    const Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 1.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text('or'),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 1.0,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    // Social media sign-up buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
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
                                side: const BorderSide(color: Colors.grey),
                              ),
                            ),
                            child: Image.asset(
                                'assets/images/google_logo.png'), // Change this to your Google logo asset path
                          ),
                        ),
                        SizedBox(
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
                                side: const BorderSide(color: Colors.grey),
                              ),
                            ),
                            child: Image.asset(
                                'assets/images/facebook_logo.png'), // Change this to your Facebook logo asset path
                          ),
                        ),
                        SizedBox(
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
                                side: const BorderSide(color: Colors.grey),
                              ),
                            ),
                            child: Image.asset(
                                'assets/images/apple_logo.png'), // Change this to your Apple logo asset path
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    // Don't have an account? Sign Up
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Don\'t have an account? ',
                          style: TextStyle(fontSize: 14.0),
                        ),
                        GestureDetector(
                          onTap: () {
                            // Handle Sign Up tap
                          },
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.orange,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20.0),
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
