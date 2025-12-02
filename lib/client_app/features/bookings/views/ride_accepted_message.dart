import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../authentication/widgets/primary_button.dart';

class RideAcceptedMessage extends StatelessWidget {
  const RideAcceptedMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Back button
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () => Get.back(),
              ),
            ),

            const SizedBox(height: 200),

            // Center illustration
            Center(
              child: Container(
                width: 110,
                height: 110,
                decoration: const BoxDecoration(
                  color: Color(0xFFE65C57),
                  shape: BoxShape.circle,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(28),
                  child: Image.asset(
                    "assets/icons/accepted_icon.png",
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),

            // Title
            const Text(
              "Ride accepted by Kendrick",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 10),

            // Subtitle
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                "You have successfully booked your ride. You can "
                    "check your booking on the “Bookings”",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                  height: 1.4,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            const Spacer(),

            // Primary Button (Your Provided Example)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: double.infinity,
                child: PrimaryButton(
                  label: 'View E-Receipt',
                  onPressed: () {
                    // navigate or show receipt
                  },
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Track driver text
            GestureDetector(
              onTap: () {
                // Implement tracking logic
              },
              child: const Text(
                "Track driver",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
