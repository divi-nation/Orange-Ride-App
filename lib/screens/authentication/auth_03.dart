import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/authentication/auth_02.dart';
import 'auth_02.dart';
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
        0.20; // 15% of screen width for social buttons

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
                  child:  SizedBox(height: 100,)
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
                        borderRadius: BorderRadius.circular(30.0),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(107, 156, 105, 43)
                                .withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 48.0,
                            height: 48.0,
                            margin: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(107, 156, 105, 43)
                                      .withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: const Icon(
                              Icons.person_outline,
                              color: Colors.orange,
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: 48.0,
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  labelText: 'Username',
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 8.0, horizontal: 12.0),
                                ),
                                style: const TextStyle(fontSize: 16.0),
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
                        borderRadius: BorderRadius.circular(30.0),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(107, 156, 105, 43)
                                .withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 48.0,
                            height: 48.0,
                            margin: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(107, 156, 105, 43)
                                      .withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: const Icon(
                              Icons.lock_outline,
                              color: Colors.orange,
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: 48.0,
                              child: TextFormField(
                                obscureText: !_isPasswordVisible,
                                decoration: InputDecoration(
                                  labelText: 'Password',
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 8.0, horizontal: 12.0),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _isPasswordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _isPasswordVisible =
                                            !_isPasswordVisible;
                                      });
                                    },
                                  ),
                                ),
                                style: TextStyle(fontSize: 16.0),
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
                            color: Color.fromARGB(255, 255, 139, 93),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30.0),
                    // Sign In Button
                    Container(
                      width: MediaQuery.of(context).size.width *
                          0.5, // 50% of screen width
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(158, 255, 153, 0)
                                .withOpacity(0.1), // Translucent orange shadow
                            spreadRadius: 5,
                            blurRadius: 20,
                            offset: Offset(
                                0, 10), // Moves the shadow 10 pixels down
                          ),
                        ],
                        borderRadius: BorderRadius.circular(
                            30.0), // Fully rounded border radius
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          // Handle Log In button tap
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:Color.fromARGB(255, 255, 139, 93), // Button background color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                30.0), // Fully rounded border radius
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
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10.0),
                          child: SizedBox(
                            width: socialButtonSize,
                            height: socialButtonSize * 0.7,
                            child: Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.orange.withOpacity(
                                        0.3), // Translucent orange shadow
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: Offset(
                                        0, 3), // Moves the shadow 3 pixels down
                                  ),
                                ],
                              ),
                              child: ElevatedButton(
                                onPressed: () {
                                  // Handle Google sign-up
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                                child: Image.asset(
                                    'assets/images/google.png'), // Change this to your Google logo asset path
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10.0),
                          child: SizedBox(
                            width: socialButtonSize,
                            height: socialButtonSize * 0.7,
                            child: Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.orange.withOpacity(
                                        0.3), // Translucent orange shadow
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: Offset(
                                        0, 3), // Moves the shadow 3 pixels down
                                  ),
                                ],
                              ),
                              child: ElevatedButton(
                                onPressed: () {
                                  // Handle Facebook sign-up
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                                child: Image.asset(
                                    'assets/images/facebook.png'), // Change this to your Facebook logo asset path
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10.0),
                          child: SizedBox(
                            width: socialButtonSize,
                            height: socialButtonSize * 0.7,
                            child: Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.orange.withOpacity(
                                        0.3), // Translucent orange shadow
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: Offset(
                                        0, 3), // Moves the shadow 3 pixels down
                                  ),
                                ],
                              ),
                              child: ElevatedButton(
                                onPressed: () {
                                  // Handle Apple sign-up
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                                child: Image.asset(
                                    'assets/images/apple.png'), // Change this to your Apple logo asset path
                              ),
                            ),
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Auth02()),
                            );
                          },
                          child: const Text(
                            'Sign up here',
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Color.fromARGB(255, 255, 139, 93),
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
