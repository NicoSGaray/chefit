import 'package:flutter/material.dart';

// widget for Messages page
class MessagesPage extends StatelessWidget {
  const MessagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(
          255, 242, 185, 125), // different background color for messages
      child: Center(
        child: Text(
          'Messages Page', // text displayed on the Messages page
          style: Theme.of(context)
              .textTheme
              .headlineMedium, // sets text style from theme
        ),
      ),
    );
  }
}