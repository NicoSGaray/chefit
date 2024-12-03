import 'package:flutter/material.dart';
import 'home_page.dart';
import 'messages_page.dart';
import 'profile_page.dart';

// main screen with navigation bar
class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedIndex = 0; // tracks the current selected index

// list of pages displayed
  final List<Widget> _pages = [
     HomePage(), // home page widget
    const MessagesPage(), // messages page widget
    const ProfilePage(), // profile page widget
  ];

// updates index when another bottom is tapped
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context)
            .colorScheme
            .surface, // sets AppBar background color
        title: const Text('Chef-It!'), // title displayed
      ),
      body: _pages[_selectedIndex], // displays the selected page
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor:
            Theme.of(context).colorScheme.surface, // sets background color
        selectedItemColor:
            const Color.fromARGB(255, 53, 32, 24), // color for selected icon
        unselectedItemColor:
            const Color.fromARGB(255, 79, 56, 39), // color for unselected icons
        currentIndex: _selectedIndex, // tracks the current selected index
        onTap: _onItemTapped, // calls item when tapped
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home), // home icon
            label: 'Home', // home label
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message), // messages icon
            label: 'Messages', // messages label
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle), // profile icon
            label: 'Profile', // profile label
          ),
        ],
      ),
    );
  }
}