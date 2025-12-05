import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taxi_app/client_app/features/bookings/views/searching_ride_screen.dart';
import 'package:taxi_app/client_app/features/home/views/pick_up.dart';
import 'package:taxi_app/theme/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedOption = "taxi"; // default selected

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/booking/booking.jpg',
              fit: BoxFit.cover,
            ),
          ),

          Container(
            color: Colors.black.withOpacity(0.2),
          ),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () => Get.back(),
                  ),
                ],
              ),
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 15),
                  Text(
                    "Where to?",
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                  ),

                  const SizedBox(height: 35),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedOption = "taxi";
                            Get.to(PickUpScreen());
                          });
                        },
                        child: _buildVehicleOption(
                          title: 'BOOK A TAXI',
                          subTitle: 'Inter City',
                          icon: Icons.local_taxi,
                          isSelected: selectedOption == "taxi",
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedOption = "bus";
                          });
                        },
                        child: _buildVehicleOption(
                          title: 'BOOK A BUS',
                          subTitle: 'Long Distance',
                          icon: Icons.directions_bus,
                          isSelected: selectedOption == "bus",
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVehicleOption({
    required String title,
    required String subTitle,
    required IconData icon,
    required bool isSelected,
  }) {
    return Container(
      width: 150,
      height: 205,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(
          color: isSelected ? const Color(0xFF226E73) : Colors.grey.shade300,
        ),
        borderRadius: BorderRadius.circular(12),
        color: isSelected ? const Color(0xFF226E73).withOpacity(0.1) : Colors.white,
      ),
      child: Column(
        children: [
          Icon(
            icon,
            size: 80,
            color: isSelected ? const Color(0xFF2B6777) : Colors.black,
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: isSelected ? const Color(0xFF2B6777) : Colors.black,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subTitle,
            style: TextStyle(
              fontSize: 11,
              color: Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }
}
