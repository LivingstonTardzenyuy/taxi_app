import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:taxi_app/client_app/bottom_navigation_bar.dart';
import 'package:taxi_app/driver_app/home/views/home.dart';

import '../../../authentication/widgets/primary_button.dart';

class TipDriverScreen extends StatefulWidget {
  const TipDriverScreen({super.key});

  @override
  State<TipDriverScreen> createState() => _TipDriverScreenState();
}

class _TipDriverScreenState extends State<TipDriverScreen> {
  int? selectedTip;
  final List<int> tipOptions = [5, 10, 15, 20, 25];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const Spacer(),
                  const Text(
                    "Tip Driver",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  const Spacer(),
                  const SizedBox(width: 40),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    const SizedBox(height: 90),

                    // Avatar
                    Image.asset("assets/booking/profile.png"),

                    const SizedBox(height: 12),

                    const Text(
                      "Kendrick Anne",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),

                    const SizedBox(height: 4),

                    const Text(
                      "Land Rover - YT8765Rt",
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),

                    const SizedBox(height: 22),

                    // Rating summary
                    const Text(
                      "You rated Kendrick Anne\n4 Stars",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 19,
                      ),
                    ),

                    const SizedBox(height: 15),

                    const Text(
                      "Do You Want To Add A Tip For Kendrick?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey,
                      ),
                    ),

                    const SizedBox(height: 25),

                    // Add tip label
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Add a tip for Kendrick",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      ),
                    ),

                    const SizedBox(height: 12),

                    // Tip buttons
                    Wrap(
                      spacing: 12,
                      children: tipOptions.map((tip) {
                        final bool isSelected = selectedTip == tip;

                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedTip = tip;
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 12),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: isSelected
                                    ? const Color(0xFF2B6777)
                                    : Colors.grey.shade300,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              "\$$tip",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: isSelected
                                    ? const Color(0xFF2B6777)
                                    : Colors.black,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),

                    const SizedBox(height: 20),

                    // OR Divider
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 1,
                            color: Colors.grey.shade300,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "OR",
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 1,
                            color: Colors.grey.shade300,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    // Custom amount label
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Enter custom amount",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),

                    // Text input
                    TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Enter Custom Amount",
                        prefixIcon: const Icon(Icons.attach_money_rounded),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey.shade300, width: 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Color(0xFF2B6777)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        contentPadding: const EdgeInsets.all(14),
                      ),
                    ),

                    const SizedBox(height: 35),
                  ],
                ),
              ),
            ),

            // Bottom Buttons
            Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          "No, thanks",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(width: 14),

                    Expanded(
                      child: PrimaryButton(
                        label: "Pay Tip",
                        onPressed: () {
                          Get.offAll(ClientBottomNavigationBar());
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
