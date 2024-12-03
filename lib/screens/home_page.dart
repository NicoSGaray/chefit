import 'package:flutter/material.dart';
import 'package:chefit/data/dummy_data.dart'; // Import the dummy data
import 'settings_page.dart'; // Import the settings page
import 'profile_detail_page.dart'; // Import the profile detail page

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Search query state
  String searchQuery = ''; // Tracks the current search query

  // Settings variables
  bool filterByLocation = false;
  double maxPrice = 50.0;
  String selectedFoodType = 'All';
  Map<String, bool> dietaryPreferences = {
    'Vegetarian': false,
    'Vegan': false,
    'Gluten-Free': false,
    'Halal': false,
    'Kosher': false,
  };

  // Method to handle settings changes
  void _updateSettings(
    bool filterByLocation,
    double maxPrice,
    String selectedFoodType,
    Map<String, bool> dietaryPreferences,
  ) {
    setState(() {
      this.filterByLocation = filterByLocation;
      this.maxPrice = maxPrice;
      this.selectedFoodType = selectedFoodType;
      this.dietaryPreferences = dietaryPreferences;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> filteredProfiles = _getFilteredProfiles();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Navigate to SettingsPage and pass the current settings
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SettingsPage(
                    filterByLocation: filterByLocation,
                    maxPrice: maxPrice,
                    selectedFoodType: selectedFoodType,
                    dietaryPreferences: dietaryPreferences,
                    onSave: _updateSettings, // Pass the update function
                  ),
                ),
              );
            },
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  searchQuery = value; // Update the search query
                });
              },
              decoration: InputDecoration(
                hintText: 'Search...', // Placeholder text
                prefixIcon: const Icon(Icons.search), // Search icon
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ),
        ),
      ),
      body: filteredProfiles.isEmpty
          ? Center(child: const Text('No Chefs Found', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)))
          : ListView.builder(
              itemCount: filteredProfiles.length,
              itemBuilder: (context, index) {
                final profile = filteredProfiles[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage(profile['image']),
                    ),
                    title: Text(profile['name']),
                    subtitle: Text(profile['bio']),
                    trailing: Text(
                      '${profile['rating']} ★',
                      style: const TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfileDetailPage(profile: profile),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
    );
  }

  List<Map<String, dynamic>> _getFilteredProfiles() {
    // Filter profiles based on the settings and search query
    return dummyProfiles.where((profile) {
      // Apply search query filter
      if (!profile['name'].toLowerCase().contains(searchQuery.toLowerCase()) &&
          !profile['bio'].toLowerCase().contains(searchQuery.toLowerCase())) {
        return false;
      }

      // Apply food type filter
      if (selectedFoodType != 'All' &&
          profile['meals'].every((meal) {
            return meal['name'].toLowerCase() != selectedFoodType.toLowerCase();
          })) {
        return false;
      }

      // Apply max price filter
      for (var meal in profile['meals']) {
        if (meal['price'] > maxPrice) {
          return false;
        }
      }

      // Apply dietary preferences filter
      for (final preference in dietaryPreferences.keys) {
        if (dietaryPreferences[preference] == true && !profile['dietary'][preference]) {
          return false;
        }
      }

      return true;
    }).toList();
  }
}