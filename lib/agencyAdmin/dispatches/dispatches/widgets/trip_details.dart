import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:taxi_app/agencyAdmin/dispatches/dispatches/views/dispatches.dart';
import 'package:taxi_app/client_app/authentication/widgets/primary_button.dart';

class TripDetailsTab extends StatelessWidget {
  const TripDetailsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(   // <-- FIX: prevents overflow
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _item("Trip ID", "WE34576"),
          _item("Departure Location", "Addisborn Road City"),
          _item("Destination", "Sit Palemo City"),
          _item("Departure Time", "10 Dec 2025 9:45"),
          _item("Trip No", "59"),

          const SizedBox(height: 20),

          Row(
            children: [
              Expanded(
                child: PrimaryButton(
                  color: const Color(0xFF7C8586),
                  label: "Delete",
                  onPressed: () {},
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: PrimaryButton(
                  label: "Update Details",
                  onPressed: () {
                    Get.to(DispatchScreen());
                  },
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _item(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
              )),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.w800,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
