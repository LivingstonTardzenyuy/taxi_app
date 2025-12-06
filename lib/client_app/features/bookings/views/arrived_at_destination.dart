import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:taxi_app/client_app/features/bookings/views/pay_cash.dart';
import 'package:taxi_app/theme/colors.dart';

import '../../../authentication/widgets/primary_button.dart';
// import your PrimaryButton here

class ArrivedDestination extends StatelessWidget {
  const ArrivedDestination({super.key});

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
              height: MediaQuery.of(context).size.height * 0.35,
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
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
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

                  CircleAvatar(
                    backgroundColor: AppColors.primaryColor,
                    radius: 40,
                    child: Center(
                      child: Image.asset("assets/booking/arrived_detination.png", scale: 2,),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    "Arrived At Destination",
                    style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w700
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Text(
                    "Manroe Platoon Street",
                    style: TextStyle(
                        fontSize: 16, color: Colors.grey, fontWeight: FontWeight.w700
                    ),
                  ),
                  const SizedBox(height: 30,),
                  Container(
                    width: double.infinity,
                    child: PrimaryButton(
                        label: "Pay Cash 300",
                        onPressed: () {
                          Get.to(PayCashScreen());
                        }),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
