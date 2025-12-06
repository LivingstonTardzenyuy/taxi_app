import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taxi_app/client_app/authentication/widgets/primary_button.dart';
import 'package:taxi_app/client_app/features/bookings/views/ride_accepted_message.dart';
import 'package:taxi_app/client_app/features/bookings/views/schedule_ride.dart';

class RideFindScreen extends StatelessWidget {
  const RideFindScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Image.asset(
            'assets/booking/booking.jpg',
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
                      // Animated Loading Indicator with Car Icon
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Ride Found",
                            style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w800
                            ),
                          ),
                          Text("23 mins")
                        ],
                      ),
                      const SizedBox(height: 20),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Row(
                          children: [
                            // Avatar
                            Container(
                              width: 46,
                              height: 46,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFFDDEFF8), // Light teal-like background
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: Image.asset(
                                  "assets/profile_icon.png", // your avatar illustration
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),

                            const SizedBox(width: 14),

                            // Name + Car Model
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Kendrick Anne",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(height: 2),
                                  Text(
                                    "Land Rover",
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.grey.shade600,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            // Price + Plate Number (Right aligned)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const Text(
                                  "\$300",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  "WE25681RT",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Book Land Rover Button
                      Row(
                        children: [
                          Expanded(
                            child: TextButton(
                                onPressed: () {},
                                child: Text('Cancle')
                            ),
                          ),
                          Expanded(
                            child: Container(
                              // width: double.infinity,
                              child: PrimaryButton(
                                label: 'Send Request',
                                onPressed: () {
                                  Get.to(() => const RideAcceptedMessage());

                                  // Add booking confirmation logic here
                                },
                              ),
                            ),
                          ),
                        ],
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
}
