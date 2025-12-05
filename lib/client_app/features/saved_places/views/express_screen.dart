import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import 'mathea_express_screen.dart';

class ExpressScreen extends StatefulWidget {
  const ExpressScreen({super.key});

  @override
  State<ExpressScreen> createState() => _ExpressScreenState();
}

class _ExpressScreenState extends State<ExpressScreen> {
  String departureTown = "Yaounde";
  String destinationTown = "Maroua";

  final List<Map<String, dynamic>> agencies = [
    {
      "name": "Real Luxury",
      "rating": 3,
      "distance": "1.2km away",
    },
    {
      "name": "Driven Travel Agency",
      "rating": 4,
      "distance": "300m away",
    },
    {
      "name": "Top Gear",
      "rating": 5,
      "distance": "6km away",
    },
    {
      "name": "Saint Charles",
      "rating": 2,
      "distance": "100m away",
    },
    {
      "name": "Artificial",
      "rating": 3,
      "distance": "12km away",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// -------------------- TOP BAR --------------------
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.arrow_back_ios, size: 20),
                  ),
                  const Spacer(),
                  const Text(
                    "Agencies",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(flex: 2),
                ],
              ),

              const SizedBox(height: 25),

              /// -------------------- DROPDOWNS --------------------
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Departure Town",
                          style: TextStyle(fontSize: 14),
                        ),
                        const SizedBox(height: 6),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          height: 48,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey.shade300),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: departureTown,
                              icon: const Icon(Icons.arrow_drop_down),
                              items: ["Yaounde", "Douala", "Bafoussam", "Ngaoundere"]
                                  .map((e) => DropdownMenuItem(
                                value: e,
                                child: Text(e),
                              ))
                                  .toList(),
                              onChanged: (value) {
                                setState(() {
                                  departureTown = value!;
                                });
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Destination",
                          style: TextStyle(fontSize: 14),
                        ),
                        const SizedBox(height: 6),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          height: 48,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey.shade300),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: destinationTown,
                              icon: const Icon(Icons.arrow_drop_down),
                              items: ["Maroua", "Garoua", "Bamenda", "Bertoua"]
                                  .map((e) => DropdownMenuItem(
                                value: e,
                                child: Text(e),
                              ))
                                  .toList(),
                              onChanged: (value) {
                                setState(() {
                                  destinationTown = value!;
                                });
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 25),

              /// -------------------- AGENCY LIST --------------------
              Expanded(
                child: ListView.builder(
                  itemCount: agencies.length,
                  itemBuilder: (context, index) {
                    final agency = agencies[index];
                    return GestureDetector(
                      onTap: () {
                        Get.to(MatheaExpressScreen());
                        // print("You clicked me to book me");
                        // ScaffoldMessenger.of(context).showSnackBar(
                        //   const SnackBar(
                        //     content: Text("You clicked me to book me"),
                        //   ),
                        // );
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 14),
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: const Color(0xFFEFF9F8),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.directions_bus, size: 40, color: Color(0xFF0A6C72)),
                            const SizedBox(width: 14),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    agency["name"],
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF094148),
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Row(
                                    children: List.generate(
                                      5,
                                          (starIndex) => Icon(
                                        Icons.star,
                                        size: 18,
                                        color: starIndex < agency["rating"]
                                            ? const Color(0xFF0A6C72)
                                            : Colors.grey.shade400,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Text(
                              agency["distance"],
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey.shade700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
