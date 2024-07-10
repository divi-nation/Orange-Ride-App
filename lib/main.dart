import 'package:flutter/material.dart';
import 'screens/loading_screen.dart'; // Import your loading screen widget

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Orange App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoadingScreen(), // Show your loading screen initially
      debugShowCheckedModeBanner: false,
    );
  }
}
