import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:taxi_app/client_app/authentication/widgets/primary_button.dart';
import 'package:taxi_app/client_app/bottom_navigation_bar.dart';
import 'package:taxi_app/client_app/features/bookings/views/book_ride_details_screen.dart';

import '../../../../common/widgets/location_rounded.dart';
import '../../../authentication/widgets/auth_text_field.dart';


class ConfirmPickupLocation extends StatelessWidget {
  const ConfirmPickupLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController pickUpController = TextEditingController();

    return Scaffold(
        body: Stack(
          children: [
            Image.asset(
              'assets/booking/booking.jpg',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),

            Column(
              children: [
                const SizedBox(height: 140),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: LocationInputField(hintText: 'Placibo Rety street down town 2234',),
                )
              ],
            ),
            Positioned(
              top: 60,
              left: 0,
              right: 0,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.arrow_back, color: Colors.black),
                  ),
                  Spacer(),
                  Text(
                    "Destination",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                  ),
                  Spacer(),
                  Text('.'),
                ],
              ),
            ),
            // Spacer(),
            Positioned(
              left: 0,
              right: 0,
              bottom: 20,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: PrimaryButton(
                  label: "Confirm Location",
                  onPressed: () {
                    Get.to(BookRideDetailsScreen());
                  },
                ),
              ),
            )
          ],
        )
    );
  }
}

class _DestinationOption extends StatelessWidget {
  const _DestinationOption({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          const Icon(Icons.location_on),
          const SizedBox(width: 10),
          Text(text),
        ],
      ),
    );
  }
}