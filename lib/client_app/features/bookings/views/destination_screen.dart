import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taxi_app/client_app/authentication/widgets/primary_button.dart';
import 'package:taxi_app/client_app/features/bookings/views/book_ride_screen.dart';

class DestinationScreen extends StatelessWidget {
  const DestinationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 🖼 Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/booking/booking.jpg',
              fit: BoxFit.cover,
            ),
          ),

          // 🧱 Foreground Content
          SafeArea(
            child: Container(
              padding: const EdgeInsets.all(16),
              // color: Colors.black.withOpacity(0.3), // overlay for readability
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Custom App Bar
                  // IconButton(
                  //     onPressed: () {
                  //       Get.back();
                  //     },
                  //     icon: Icon(Icons.arrow_back)
                  // ),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.black),
                        onPressed: () => Get.back(),
                      ),
                      Spacer(),
                      const Text(
                        'Destination',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      Spacer(),
                      Text('.')
                    ],
                  ),

                  const SizedBox(height: 16),

                  // Destination List (Fixed height inside Expanded)
                  Expanded(
                    child: SingleChildScrollView(
                      child: Container(
                        height: 235,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.grey[100],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                children: [
                                  _buildDestinationItem(
                                    '10 Up Stream Strange Town',
                                    Icons.location_on_outlined,
                                  ),
                                  const Divider(),
                                  _buildDestinationItem(
                                    'End Of Upoid Road Down Town',
                                    Icons.location_on_outlined,
                                  ),
                                  const Divider(),
                                  _buildDestinationItem(
                                    'Long Avenue Saint James',
                                    Icons.location_on_outlined,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // ✅ Confirm Location Button at the bottom (height ~80)
                  Container(
                    width: double.infinity,
                    height: 60,
                    child: PrimaryButton(
                      label: 'Confirm Location',
                      onPressed: () {
                        Get.to(() => const BookRideScreen());
                        
                      },
                    ),
                  )
                 
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDestinationItem(String title, IconData icon) {
    return ListTile(
      leading: Icon(icon, color: const Color(0xFF2B6777)),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
      // contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      onTap: () {},
    );
  }
}
