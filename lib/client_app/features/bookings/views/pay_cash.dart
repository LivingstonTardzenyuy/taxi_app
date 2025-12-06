import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taxi_app/client_app/features/bookings/views/rate_ride_screen.dart';

import '../../../authentication/widgets/primary_button.dart';
// import your PrimaryButton here

class PayCashScreen extends StatelessWidget {
  const PayCashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Pay cash",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ),

      body: Column(
        children: [
          const SizedBox(height: 80),

          /// Wallet icon
          CircleAvatar(
            radius: 45,
            backgroundColor: const Color(0xFF0E6C69),
            child: const Icon(Icons.account_balance_wallet_outlined,
                color: Colors.white, size: 40),
          ),

          const SizedBox(height: 12),

          const Text(
            "Pay Cash",
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 30),

          /// Trip Route Box
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Pickup Row
                  Row(
                    children: [
                      const Icon(Icons.location_on_outlined, color: Color(0xFF0E6C69)),
                      const SizedBox(width: 10),
                      const Expanded(
                        child: Text(
                          "Reding Town Last Town",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 3),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Text(
                          "2km",
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  /// Divider line (vertical route indicator)
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Container(
                      width: 2,
                      height: 18,
                      color: Colors.grey.shade300,
                    ),
                  ),

                  const SizedBox(height: 10),

                  /// Drop-off Row
                  Row(
                    children: const [
                      Icon(Icons.place, color: Colors.grey),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          "Manroe Platoon Street",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 30),
          Spacer(),
          /// Driver Info
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Image.asset("assets/booking/profile.png", scale: 2,),
                const SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Kendrick Anne",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "Land Rover",
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          /// Total Price
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: const [
                Text(
                  "Total:",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(width: 8),
                Text(
                  "\$300",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),

          // const Spacer(),
          const SizedBox(height: 20,),
          /// Primary Button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Container(
              width: double.infinity,
              child: PrimaryButton(
                label: "Cash Paid",
                onPressed: () {
                  Get.to(RateRideScreen());
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
