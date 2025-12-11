import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:taxi_app/client_app/authentication/widgets/primary_button.dart';

import 'assign_driver.dart';
class AdminBookingsScreen extends StatelessWidget {
  const AdminBookingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10),

              /// TOP HEADER (Menu icon + Title)
              Row(
                children: [
                  const Icon(Icons.menu, size: 30, color: Colors.black87),
                  const Spacer(),
                  const Text(
                    "Bookings",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  const Icon(Icons.more_horiz, color: Colors.transparent),
                ],
              ),

              const SizedBox(height: 20),

              /// SEARCH BAR BOX
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade300, width: 1.2),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Search",
                          hintStyle: TextStyle(
                            color: Colors.teal.shade700,
                            fontSize: 16,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Icon(Icons.search, color: Colors.teal.shade700, size: 26),
                  ],
                ),
              ),

              
              const SizedBox(height: 16),

              /// RESET FILTERS BUTTON
              SizedBox(
                width: double.infinity,
                height: 52,
                child: PrimaryButton(
                    label: "Reset Filters",
                    onPressed: () {
                      Get.to(AssignDriverScreen());
                    }
                )
              ),

              const SizedBox(height: 25),

              /// TABLE HEADER
              Container(
                padding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Row(
                  children: [
                    _tableHeader("Sr."),
                    _tableHeader("Passenger", flex: 2, showArrow: true),
                    _tableHeader("Seat #"),
                    _tableHeader("Departure"),
                    _tableHeader("Destination"),
                  ],
                ),
              ),

              const SizedBox(height: 6),

              /// TABLE ROWS
              Column(
                children: List.generate(6, (index) {
                  bool isEven = index % 2 == 1;
                  return Container(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
                    color: isEven ? Colors.grey.shade200 : Colors.white,
                    child: Row(
                      children: [
                        _tableCell((index + 1).toString()),
                        _tableCell("Jonathan Fred", flex: 2),
                        _tableCell("Seat #"),
                        _tableCell("Yaounde"),
                        _tableCell("Maroua"),
                      ],
                    ),
                  );
                }),
              ),

              const SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }

  /// TABLE HEADER CELL
  Widget _tableHeader(String title, {int flex = 1, bool showArrow = false}) {
    return Expanded(
      flex: flex,
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          if (showArrow) const SizedBox(width: 4),
          if (showArrow)
            const Icon(Icons.keyboard_arrow_down, size: 18, color: Colors.grey),
        ],
      ),
    );
  }

  /// TABLE ROW CELL
  Widget _tableCell(String text, {int flex = 1}) {
    return Expanded(
      flex: flex,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 15,
          color: Colors.grey.shade800,
        ),
      ),
    );
  }
}
