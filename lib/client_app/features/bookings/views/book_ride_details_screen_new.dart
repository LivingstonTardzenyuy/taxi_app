import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taxi_app/client_app/features/bookings/views/searching_ride_screen_new.dart';

class BookRideDetailsScreen extends StatelessWidget {
  const BookRideDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Image.asset(
            'assets/booking/city_background.jpg',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          
          // Content
          SafeArea(
            child: Column(
              children: [
                // Custom App Bar
                Container(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () => Get.back(),
                      ),
                      const Text(
                        'Book Ride',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),

                const Spacer(),

                // Bottom Sheet
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Vehicle Selection
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildVehicleOption(
                            'Land Rover',
                            '8.1/km',
                            '5 Seats Capacity',
                            'assets/booking/car_icon.png',
                            isSelected: true,
                          ),
                          _buildVehicleOption(
                            'Tesla Cyber Truck',
                            '12.0/km',
                            '4 Seats Capacity',
                            'assets/booking/truck_icon.png',
                            isSelected: false,
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),

                      // Additional Options
                      _buildExpandableOption('Cash', Icons.payments_outlined),
                      const SizedBox(height: 16),
                      _buildExpandableOption('Book for self', Icons.person_outline),
                      const SizedBox(height: 16),
                      _buildExpandableOption('Apply promo', Icons.local_offer_outlined),

                      const SizedBox(height: 32),

                      // Book Button
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF2B6777),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () {
                            Get.to(() => const SearchingRideScreen());
                          },
                          child: const Text(
                            'Book Land Rover',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVehicleOption(
    String title,
    String price,
    String capacity,
    String iconPath,
    {bool isSelected = false}
  ) {
    return Container(
      width: 150,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(
          color: isSelected ? const Color(0xFF2B6777) : Colors.grey.shade300,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(12),
        color: isSelected ? const Color(0xFF2B6777).withOpacity(0.1) : Colors.white,
      ),
      child: Column(
        children: [
          Image.asset(iconPath, height: 60),
          const SizedBox(height: 12),
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: isSelected ? const Color(0xFF2B6777) : Colors.black,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            price,
            style: TextStyle(
              fontSize: 14,
              color: isSelected ? const Color(0xFF2B6777) : Colors.grey,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            capacity,
            style: TextStyle(
              fontSize: 12,
              color: isSelected ? const Color(0xFF2B6777) : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExpandableOption(String title, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFF2B6777)),
          const SizedBox(width: 12),
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          const Icon(Icons.keyboard_arrow_right, color: Colors.grey),
        ],
      ),
    );
  }
}