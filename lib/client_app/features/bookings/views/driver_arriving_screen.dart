import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taxi_app/client_app/features/bookings/views/driver_arrived.dart';

import '../../../authentication/widgets/primary_button.dart';
// import your PrimaryButton here

class DriverArrivingScreen extends StatelessWidget {
  const DriverArrivingScreen({super.key});

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
            child: Container(
              height: MediaQuery.of(context).size.height * 0.38,
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
                        "Driver Arriving",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        "12 mins away",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 25),
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
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 22,
                            backgroundColor: Colors.white,
                            child: const Icon(Icons.call_outlined, color: Colors.grey),
                          ),
                          const SizedBox(width: 10),
                          CircleAvatar(
                            radius: 22,
                            backgroundColor: Colors.white,
                            child: const Icon(Icons.message_outlined, color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Car Number", style: TextStyle(color: Colors.black54)),
                          SizedBox(height: 4),
                          Text("YTE 998 UY", style: TextStyle(fontWeight: FontWeight.w600)),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Car Description", style: TextStyle(color: Colors.black54)),
                          SizedBox(height: 4),
                          Text("Gray Toyota Yaris", style: TextStyle(fontWeight: FontWeight.w600)),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Price", style: TextStyle(color: Colors.black54)),
                          SizedBox(height: 4),
                          Text("\$300", style: TextStyle(fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ],
                  ),

                  // const Spacer(),
                  const SizedBox(height: 25,),
                 Container(
                   width: double.infinity,
                   child: PrimaryButton(
                      label: "Cancel Ride",
                      onPressed: () {
                        Get.to(DriverArrivedScreen());
                      },
                    ),
                 ),
                  const SizedBox(height: 5),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
