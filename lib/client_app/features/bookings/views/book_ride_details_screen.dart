import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taxi_app/client_app/features/bookings/views/searching_ride_screen.dart';

class BookRideDetailsScreen extends StatelessWidget {
  const BookRideDetailsScreen({Key? key}) : super(key: key);

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

          // Optional overlay to improve contrast
          Container(
            color: Colors.black.withOpacity(0.2),
          ),

          // Top app bar
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () => Get.back(),
                  ),
                  const SizedBox(width: 100),
                  const Center(
                   
                  child: Text(
                      'Book Ride',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),

          // Bottom card content
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
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 8),
                    _buildExpandableOption('Reding Town Last Town', Icons.location_on, isIcon: false),
                    _buildExpandableOption('Schedule for later date', Icons.location_on, isIcon: false),


                    // Vehicle selection
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildVehicleOption(
                          'Land Rover',
                          '8.1/km',
                                                    'Confort',

                          '5 Seats Capacity',
                         'assets/booking/land_rover.png',

                          isSelected: true,
                        ),
                        _buildVehicleOption(
                          'Tesla Cyber Truck',
                          '12.0/km',
                                                    'Off-Road',

                          '4 Seats Capacity',
                          'assets/booking/tesla_cyber_truck.png',
                          isSelected: true,
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),

                    // Additional ride details options
                    _buildExpandableOption('Cash', Icons.payments_outlined),
                    const SizedBox(height: 5),
                    _buildExpandableOption('Book for self', Icons.person_outline),
                    const SizedBox(height: 5),
                    _buildExpandableOption('Apply promo', Icons.local_offer_outlined),

                    const SizedBox(height: 10),

                    // Book Button
                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF2B6777),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
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
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVehicleOption(
    String title,
    String price,
    String priceTitle,
    String capacity,
    String iconPath, {
    bool isSelected = false,
  }) {
    return Container(
      width: 150,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(
          color: isSelected ? const Color(0xFF2B6777) : Colors.grey.shade300,
        ),
        borderRadius: BorderRadius.circular(12),
        color: isSelected ? const Color(0xFF2B6777).withOpacity(0.1) : Colors.white,
      ),
      child: Column(
        children: [
          Image.asset(iconPath, height: 60),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(priceTitle),
              Spacer(),
              Text(price)
            ]
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

  Widget _buildExpandableOption(String title, IconData icon, {bool isIcon = true}) {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      border: Border.all(color: Color(0xFFF3F8F2)),
      borderRadius: BorderRadius.circular(8),
    ),
    child: Row(
      children: [
        // Conditionally show the icon
        if (isIcon) Icon(icon, color: const Color(0xFF2B6777)),
        if (isIcon) const SizedBox(width: 12),
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        const Spacer(),
        const Icon(Icons.keyboard_arrow_down),
      ],
    ),
  );
}
}
