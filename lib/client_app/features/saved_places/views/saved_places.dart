
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../../home/views/confirmation_location.dart';

class SavedPlacesScreen extends StatefulWidget {
  const SavedPlacesScreen({super.key});

  @override
  State<SavedPlacesScreen> createState() => _SavedPlacesScreenState();
}

class _SavedPlacesScreenState extends State<SavedPlacesScreen> {
  int selectedTaxiIndex = 0;
  int selectedBusIndex = 0;

  final List<String> taxiLocations = [
    "Indiana Jonas East Region",
    "Old Alf High Way Blog",
    "St Agnes Parish Gotey",
    "Rt Flag Metro Town High School",
  ];

  final List<String> busLocations = [
    "Indiana Jonas East Region",
    "Old Alf High Way Blog",
    "St Agnes Parish Gotey",
    "Rt Flag Metro Town High School",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // AppBar style exactly as screenshot
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => Navigator.pop(context),
                  ),

                  const Spacer(),

                  const Text(
                    "Saved locations",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const Spacer(),

                  const SizedBox(width: 48), // Balance center alignment
                ],
              ),
            ),

            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  const SizedBox(height: 10),

                  const Text(
                    "Taxi",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const SizedBox(height: 10),
                  ...List.generate(taxiLocations.length, (index) {
                    return _buildLocationItem(
                      title: taxiLocations[index],
                      selected: selectedTaxiIndex == index,
                      onTap: () {
                        setState(() {
                          selectedTaxiIndex = index;
                        });
                      },
                    );
                  }),

                  const SizedBox(height: 20),

                  const Text(
                    "Bus",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const SizedBox(height: 10),
                  ...List.generate(busLocations.length, (index) {
                    return InkWell(
                      onTap: () {
                        Get.to(ConfirmLocationScreen());
                      },
                      child: _buildLocationItem(
                        title: busLocations[index],
                        selected: selectedBusIndex == index,
                        onTap: () {
                          setState(() {
                            selectedBusIndex = index;
                          });
                        },
                      ),
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLocationItem({
    required String title,
    required bool selected,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          GestureDetector(
            onTap: onTap,
            child: Icon(
              selected
                  ? Icons.radio_button_checked
                  : Icons.radio_button_unchecked,
              color: selected ? const Color(0xFF2B6777) : Colors.grey,
              size: 22,
            ),
          ),

          const SizedBox(width: 10),

          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
          ),

          const SizedBox(width: 10),

          GestureDetector(
            onTap: () {
              // delete action
            },
            child: const Icon(
              Icons.close,
              color: Colors.red,
              size: 22,
            ),
          ),
        ],
      ),
    );
  }
}
