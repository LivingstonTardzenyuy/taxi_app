import 'package:flutter/material.dart';
import 'package:taxi_app/client_app/authentication/widgets/primary_button.dart';

class DriverInfoTab extends StatelessWidget {
  const DriverInfoTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(   // <-- FIX: prevents overflow
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 35,
                child: Image.asset("assets/images/img.png"),
              ),
              const SizedBox(width: 8,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Kendircik Anne",
                    style: TextStyle(
                      fontWeight: FontWeight.w800, fontSize: 18
                    ),
                  ),
                  Text(
                    "Driver",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(height: 10,),
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
                  onPressed: () {},
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

