import 'package:flutter/material.dart';
import 'theme.dart';
import 'screens/login_screen.dart'; // Import the login screen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chef-It!',
      theme: appTheme,
      home: const LoginScreen(), // Set LoginScreen as the initial page
    );
  }
}