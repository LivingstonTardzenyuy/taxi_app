import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:taxi_app/client_app/features/bookings/views/arrived_at_destination.dart';

import '../../../authentication/widgets/primary_button.dart';
// import your PrimaryButton here

class DriverArrivedScreen extends StatelessWidget {
  const DriverArrivedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/booking/booking.jpg",  // replace with your real asset
              fit: BoxFit.cover,
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: InkWell(
              onTap: () {
                Get.to(ArrivedDestination());
              },
              child: Container(
                height: MediaQuery.of(context).size.height * 0.25,
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(35),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 8,
                      offset: Offset(0, -3),
                    )
                  ],
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    /// drag handle
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: 60,
                        height: 6,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    /// Row: Driver Arriving + ETA
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Active Ride",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          "45 mins from destination",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    Divider(),
                    const SizedBox(height: 15),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// Avatar
                        Image.asset("assets/images/img.png"),
                        const SizedBox(width: 15),

                        /// Name & Car brand
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

                        const Spacer(),

                        /// Phone + Chat icons
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                "300",
                              style: TextStyle(
                                fontWeight: FontWeight.w800, fontSize: 16
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              "WEDE345",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 16
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 5),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
