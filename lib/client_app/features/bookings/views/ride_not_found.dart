import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:taxi_app/client_app/features/bookings/views/driver_arriving_screen.dart';

import '../../../authentication/widgets/primary_button.dart';
// import your PrimaryButton here

class RideNotFoundScreen extends StatelessWidget {
  const RideNotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Book ride",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 17,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),

      body: Column(
        children: [

          Expanded(
            flex: 2,
            child: Container(color: Colors.white),
          ),

          Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(35),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: Offset(0, -2),
                  )
                ],
              ),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [

                  /// The small grey drag handle
                  Container(
                    width: 60,
                    height: 6,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),

                  const SizedBox(height: 25),

                  /// Illustration image
                  Image.asset(
                    "assets/booking/tesla_cyber_truck.png",
                    height: 120,
                    fit: BoxFit.contain,
                  ),

                  const SizedBox(height: 25),

                  /// Title
                  const Text(
                    "Ride Not Found",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.black87,
                    ),
                  ),

                  const SizedBox(height: 8),

                  /// Subtext
                  const Text(
                    "Please try again in a few minutes",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),

                  const Spacer(),

                  /// Custom Button
                  Container(
                    width: double.infinity,
                    child: PrimaryButton(
                      label: "Try Again",
                      onPressed: () {
                        Get.to(DriverArrivingScreen());
                      },
                    ),
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
}
