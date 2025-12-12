import 'package:flutter/material.dart';
import 'package:taxi_app/client_app/authentication/widgets/primary_button.dart';

class PricingModelDetailScreen extends StatelessWidget {
  const PricingModelDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const primary = Color(0xFF0F6F6A);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Pricing model"),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// ---- Top Buttons ----
            Row(
              children: [
                Expanded(
                  child: PrimaryButton(
                    label: "New Driver",
                    onPressed: () {

  })
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: PrimaryButton(
                    label: "New Car",
                    color: Colors.grey,
                    onPressed: () {

                    })
                ),
              ],
            ),

            const SizedBox(height: 15),

            /// ---- Tabs: Kilometer Based / Route Based ----
            Row(
              children: [
                Expanded(
                  child: PrimaryButton(
                      label: "Kilometer Based",
                      color: Colors.white,
                      textColor: Colors.black,
                      height: 45,
                      onPressed: () {

                      })
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: PrimaryButton(
                      label: "Route Based",
                      color: Color(0xFFC5E7E9),
                      textColor: Colors.black,
                      height: 45,
                      onPressed: () {

                      })
                ),
              ],
            ),

            const SizedBox(height: 20),

            Container(
              height: 200,
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.directions_bus, size: 40),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("Comfort",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      SizedBox(height: 4),
                      Text("59 Seats",
                          style: TextStyle(color: Colors.grey, fontSize: 13)),
                    ],
                  )
                ],
              ),
            ),

            const SizedBox(height: 20),

            /// ---- Base Fare ----
            const Text("Base Fare", style: TextStyle(fontWeight: FontWeight.w600)),
            const SizedBox(height: 10),

            Row(
              children: const [
                Expanded(child: _BaseInputField(hint: "\$12")),
                SizedBox(width: 10),
                Expanded(child: _BaseInputField(hint: "\$20")),
              ],
            ),

            const SizedBox(height: 25),

            /// ---- Route Tag ----
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(50),
              ),
              child: const Text(
                "Route:     Yaounde  -  Douala",
                style: TextStyle(fontSize: 13),
              ),
            ),

            const SizedBox(height: 20),

            /// ---- Route Fields ----
            const Text("Departure town"),
            const SizedBox(height: 5),
            const _BaseInputField(hint: "Yaounde"),

            const SizedBox(height: 15),
            const Text("Destination town"),
            const SizedBox(height: 5),
            const _BaseInputField(hint: "Douala"),

            const SizedBox(height: 15),
            const Text("Price"),
            const SizedBox(height: 5),
            const _BaseInputField(hint: "Amount"),

            const SizedBox(height: 15),

            /// ---- Add New Route ----
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add),
              label: const Text("Add New Route"),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12),
                side: BorderSide(color: Colors.grey.shade400),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),

            const SizedBox(height: 20),

            /// ---- Extra ----
            const Text("Extra", style: TextStyle(fontWeight: FontWeight.w600)),
            const SizedBox(height: 10),
            Row(
              children: const [
                Expanded(child: _BaseInputField(hint: "\$12")),
                SizedBox(width: 10),
                Expanded(child: _BaseInputField(hint: "\$20")),
              ],
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

class _BaseInputField extends StatelessWidget {
  final String hint;
  const _BaseInputField({required this.hint});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: hint,
        contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
