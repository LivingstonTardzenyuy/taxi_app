import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:taxi_app/client_app/authentication/widgets/primary_button.dart';

import 'booking_details.dart';

class Vip70SeaterScreen extends StatelessWidget {
  const Vip70SeaterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(Icons.arrow_back, color: Colors.black),
        centerTitle: true,
        title: const Text(
          'VIP 70 seater',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Choose seat(s)",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              child: Container(
                width: screenWidth,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Column(
                  children: [
                    // DRIVER ICON
                    const Icon(Icons.directions_bus, size: 45, color: Colors.grey),
                    const SizedBox(height: 20),

                    // FIRST ROW (selected + booked + stairs)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(children: [
                          _selectedSeat(),
                          _selectedSeat(),
                          _selectedSeat(),
                          _selectedSeat(),
                        ]),
                        _stairsIcon(),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        _bookedSeat(), _bookedSeat(), _bookedSeat(), _bookedSeat(),
                      ],
                    ),

                    const SizedBox(height: 15),

                    _seatRow([0, 0, 0, 0]),
                    _seatRow([0, 0, 0, 0]),
                    _seatRow([1, 1, 0, 0]),
                    _seatRow([0, 0, 1, 0]),
                    _seatRow([0, 0, 0, 0]),
                    _seatRow([1, 0, 0, 1]),

                    const SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerRight,
                      child: _stairsIcon(),
                    )
                  ],
                ),
              ),
            ),
          ),

          // Continue Button
          Container(
            margin: const EdgeInsets.all(20),
            width: double.infinity,
            height: 55,
            child: PrimaryButton(
                label: "Continue",
                onPressed: (){
                  Get.to(BookingDetailsScreen());
                }
            )
          ),
        ],
      ),
    );
  }

  Widget _seat(bool booked) {
    return Container(
      width: 40,
      height: 40,
      margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade400),
        color: booked ? Colors.white : Colors.white,
      ),
      child: booked
          ? const Icon(Icons.close, size: 22, color: Colors.red)
          : null,
    );
  }

  Widget _selectedSeat() {
    return Container(
      width: 40,
      height: 40,
      margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFF0F6F6E),
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Icon(Icons.check, size: 22, color: Colors.white),
    );
  }

  Widget _bookedSeat() => _seat(true);

  Widget _seatRow(List<int> seats) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(children: seats.map((s) => _seat(s == 1)).toList()),
        Row(children: seats.take(2).map((s) => _seat(s == 1)).toList()),
      ],
    );
  }

  Widget _stairsIcon() {
    return const Icon(Icons.stairs, size: 40, color: Colors.grey);
  }
}
