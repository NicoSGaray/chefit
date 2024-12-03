import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class SettingsPage extends StatefulWidget {
  final bool filterByLocation;
  final double maxPrice;
  final String selectedFoodType;
  final Map<String, bool> dietaryPreferences;
  final Function(bool, double, String, Map<String, bool>) onSave;

  const SettingsPage({
    super.key,
    required this.filterByLocation,
    required this.maxPrice,
    required this.selectedFoodType,
    required this.dietaryPreferences,
    required this.onSave,
  });

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late bool filterByLocation;
  late double maxPrice;
  late String selectedFoodType;
  late Map<String, bool> dietaryPreferences;

  @override
  void initState() {
    super.initState();
    // Initialize settings from passed values
    filterByLocation = widget.filterByLocation;
    maxPrice = widget.maxPrice;
    selectedFoodType = widget.selectedFoodType;
    dietaryPreferences = widget.dietaryPreferences;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            SwitchListTile(
              title: const Text('Filter by Current Location'),
              value: filterByLocation,
              onChanged: (value) {
                setState(() {
                  filterByLocation = value;
                });
              },
            ),
            const Divider(),
            const Text('Set Maximum Price'),
            Slider(
              value: maxPrice,
              min: 0,
              max: 100,
              divisions: 20,
              label: '\$${maxPrice.toStringAsFixed(0)}',
              onChanged: (value) {
                setState(() {
                  maxPrice = value;
                });
              },
            ),
            Text('Maximum Price: \$${maxPrice.toStringAsFixed(0)}'),
            const Divider(),
            const Text('Select Food Type'),
            DropdownButton<String>(
              value: selectedFoodType,
              items: ['All', 'American', 'Mexican', 'Italian', 'Indian', 'Chinese', 'Japanese']
                  .map((type) => DropdownMenuItem<String>(value: type, child: Text(type)))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedFoodType = value!;
                });
              },
            ),
            const Divider(),
            const Text('Dietary Preferences'),
            Column(
              children: dietaryPreferences.keys.map((preference) {
                return CheckboxListTile(
                  title: Text(preference),
                  value: dietaryPreferences[preference],
                  onChanged: (value) {
                    setState(() {
                      dietaryPreferences[preference] = value!;
                    });
                  },
                );
              }).toList(),
            ),
            const Divider(),
            ElevatedButton(
              onPressed: () {
                widget.onSave(filterByLocation, maxPrice, selectedFoodType, dietaryPreferences);
                Navigator.pop(context); // Return to the HomePage
              },
              child: const Text('Save Settings'),
            ),
          ],
        ),
      ),
    );
  }
}