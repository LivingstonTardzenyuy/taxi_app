import 'package:flutter/material.dart';
import 'package:taxi_app/client_app/authentication/widgets/primary_button.dart';

class TripDetailsTab extends StatelessWidget {
  const TripDetailsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
                  label: "Delete",
                  onPressed: (){

                  }
              )
            ),
            const SizedBox(width: 12),
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: const Text("Update Details",
                    style: TextStyle(color: Colors.white, fontSize: 15)),
              ),
            )
          ],
        )
      ],
    );
  }

  Widget _item(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style:
              const TextStyle(fontWeight: FontWeight.w500, fontSize: 14)),
          const SizedBox(height: 4),
          Text(value, style: const TextStyle(
              fontWeight: FontWeight.w800,
              color: Colors.black)),
        ],
      ),
    );
  }
}
