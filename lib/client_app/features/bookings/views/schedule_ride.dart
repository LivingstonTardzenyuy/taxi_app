import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'find_ride.dart';

class ScheduleRideScreen extends StatefulWidget {
  const ScheduleRideScreen({Key? key}) : super(key: key);

  @override
  State<ScheduleRideScreen> createState() => _ScheduleRideScreenState();
}

class _ScheduleRideScreenState extends State<ScheduleRideScreen> {
  DateTime selectedDate = DateTime.now();
  bool rideNow = true;
  final today = DateTime.now();
  late final normalizedToday = DateTime(today.year, today.month, today.day);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/booking/booking.jpg',
              fit: BoxFit.cover,
            ),
          ),

          // Optional overlay for better contrast
          Container(color: Colors.black.withOpacity(0.2)),

          // App Bar
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Get.back(),
                  ),
                  Spacer(),
                  const Text(
                    "Book ride",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Spacer(),
                  Text('.')
                ],
              ),
            ),
          ),

          // Bottom Sheet
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Handle bar
                  Container(
                    width: 40,
                    height: 5,
                    margin: const EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),

                  // Schedule Header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Schedule Ride",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            rideNow = true;
                          });
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: rideNow
                              ? const Color(0xFF2B6777)
                              : Colors.grey.shade200,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 8),
                        ),
                        child: Text(
                          "Ride now",
                          style: TextStyle(
                            color: rideNow ? Colors.white : Colors.black87,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),

                  // Date Picker
                  SizedBox(
                    height: 150,
                    child: CupertinoDatePicker(
                      mode: CupertinoDatePickerMode.date,
                      initialDateTime: DateTime(selectedDate.year, selectedDate.month, selectedDate.day),
                      minimumDate: normalizedToday,
                      maximumDate: DateTime(2030),
                      onDateTimeChanged: (DateTime newDate) {
                        setState(() {
                          selectedDate = newDate;
                          rideNow = false;
                        });
                      },
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Confirm Button
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF2B6777),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () {
                        // if (rideNow) {
                        //   // Book immediate ride logic
                        //   Get.snackbar(
                        //     "Ride Booked",
                        //     "Your immediate ride is confirmed!",
                        //     backgroundColor: Colors.green.shade50,
                        //     colorText: Colors.black,
                        //   );
                        // } else {
                        //   // Schedule ride logic
                        //   Get.snackbar(
                        //     "Ride Scheduled",
                        //     "Ride scheduled for ${selectedDate.toLocal().toString().split(' ')[0]}",
                        //     backgroundColor: Colors.blue.shade50,
                        //     colorText: Colors.black,
                        //   );
                        // }
                        Get.to((RideFindScreen()));
                      },
                      child: const Text(
                        "Confirm",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
