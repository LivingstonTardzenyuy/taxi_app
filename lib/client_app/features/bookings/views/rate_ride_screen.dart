import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taxi_app/client_app/features/bookings/views/tip_driver.dart';

import '../../../authentication/widgets/primary_button.dart';

class RateRideScreen extends StatefulWidget {
  const RateRideScreen({super.key});

  @override
  State<RateRideScreen> createState() => _RateRideScreenState();
}

class _RateRideScreenState extends State<RateRideScreen> {
  int selectedRating = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Column(
          children: [
            // Top App Bar
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
                    "Rate ride",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  const SizedBox(width: 48),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    const SizedBox(height: 20),

                    // Circular avatar placeholder
                    Image.asset("assets/booking/profile.png"),

                    const SizedBox(height: 16),

                    const Text(
                      "Kendrick Anne",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),

                    const SizedBox(height: 4),

                    const Text(
                      "Land Rover - YT8765Rt",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),

                    const SizedBox(height: 35),

                    const Text(
                      "How was your trip with\nKendrick Anne",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    const SizedBox(height: 20),

                    const Text(
                      "Your Overall Ratings",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),

                    const SizedBox(height: 10),

                    // Rating Stars
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(5, (index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() => selectedRating = index + 1);
                          },
                          child: Icon(
                            index < selectedRating
                                ? Icons.star
                                : Icons.star_border,
                            color: Colors.grey,
                            size: 30,
                          ),
                        );
                      }),
                    ),

                    const SizedBox(height: 150),

                    // Detailed review field
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Add detailed review",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),

                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.grey.shade300,
                        ),
                      ),
                      child: const TextField(
                        maxLines: 4,
                        decoration: InputDecoration(
                          hintText: "Placeholder",
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(12),
                        ),
                      ),
                    ),

                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),

            // Bottom Buttons
            Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    // No thanks text
                    Expanded(
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          "No, thanks",
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(width: 10),

                    // Submit button
                    Expanded(
                      child: PrimaryButton(
                        label: "Submit",
                        onPressed: () {
                          Get.to(TipDriverScreen());
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}