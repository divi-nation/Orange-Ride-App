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
    double buttonWidth = MediaQuery.of(context).size.width * 0.9; // 90% of screen width
    double socialButtonSize = MediaQuery.of(context).size.width * 0.15; // 15% of screen width for social buttons

    return Scaffold(
      backgroundColor: Colors.white, // Set Scaffold background color to white
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Logo
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: Center(
                  child: Image.asset(
                    'assets/images/logo.png', // Replace with your logo asset path
                    height: 100,
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              // Welcome back text
              const Center(
                child: Text(
                  'Welcome back!',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              // Login to your account text
              const Center(
                child: Text(
                  'Login to your account',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),
              const SizedBox(height: 30.0),
              // Input fields: Email or Phone Number, Password
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Email or Phone Number input
                    Container(
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(16.0), // Increased border radius
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 2,
        blurRadius: 5,
        offset: const Offset(0, 3),
      ),
    ],
  ),
  child: Row(
    children: [
      Container(
        width: 48.0, // Increased width
        height: 48.0, // Increased height
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: const Icon(
          Icons.person_outline, // Outlined icon
          color: Colors.orange,
        ),
      ),
      Expanded(
        child: SizedBox(
          height: 30.0, // Set fixed height
          child: TextFormField(
            decoration: const InputDecoration(
              labelText: 'Username',
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0), // Adjusted padding
            ),
            style: TextStyle(fontSize: 12.0), // Reduced font size
          ),
        ),
      ),
    ],
  ),
),
const SizedBox(height: 16.0),
// Password input
Container(
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(16.0), // Increased border radius
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 2,
        blurRadius: 5,
        offset: const Offset(0, 3),
      ),
    ],
  ),
  child: Row(
    children: [
      Container(
        width: 48.0, // Increased width
        height: 48.0, // Increased height
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: const Icon(
          Icons.lock_outline, // Outlined icon
          color: Colors.orange,
        ),
      ),
      Expanded(
        child: SizedBox(
          height: 30.0, // Set fixed height
          child: TextFormField(
            obscureText: !_isPasswordVisible,
            decoration: InputDecoration(
              labelText: 'Password',
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0), // Adjusted padding
              suffixIcon: IconButton(
                icon: Icon(
                  _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    _isPasswordVisible = !_isPasswordVisible;
                  });
                },
              ),
            ),
            style: TextStyle(fontSize: 12.0), // Reduced font size
          ),
        ),
      ),
    ],
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
                    const SizedBox(height: 30.0),
                    // Sign In Button
                    SizedBox(
                      width: buttonWidth,
                      child: ElevatedButton(
                        onPressed: () {
                          // Handle Log In button tap
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange, // Button background color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0), // Adjust border radius
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 12.0),
                          child: Text(
                            'Sign in',
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
                    // Social media sign-in buttons
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
                            child: Image.asset('assets/images/google_logo.png'), // Change this to your Google logo asset path
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
                            child: Image.asset('assets/images/facebook_logo.png'), // Change this to your Facebook logo asset path
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
                            child: Image.asset('assets/images/apple_logo.png'), // Change this to your Apple logo asset path
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
                            'Sign up here',
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
