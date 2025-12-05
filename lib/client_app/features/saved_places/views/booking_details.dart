import 'package:flutter/material.dart';

class BookingDetailsScreen extends StatelessWidget {
  const BookingDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(Icons.arrow_back, color: Colors.black),
        centerTitle: true,
        title: const Text(
          'Booking details',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),

          // MAIN WHITE CARD
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _rowItem('Agency:', 'Mathea Express'),
                _rowItem('Class:', 'VIP'),
                _rowItem('Price:', '\$60'),
                _highlightRow('Departure Town:', 'Yaounde'),
                _rowItem('Destination:', 'Maroua'),
                _rowItem('Departure Time:', '10:00'),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // BUS DETAILS CARD
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Row(
                      children: [
                        Icon(Icons.directions_bus, color: Colors.teal, size: 28),
                        SizedBox(width: 6),
                        Text(
                          'Bus Number: YT6573IU',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Text('55 Seats', style: TextStyle(color: Colors.grey)),
                  ],
                ),

                const SizedBox(height: 20),

                const Text('Seats', style: TextStyle(fontWeight: FontWeight.w600)),
                const SizedBox(height: 6),

                _seatRow('Seat #', '2'),
                _seatRow('Seat #', '3'),
                _seatRow('Seat #', '4'),

                const SizedBox(height: 20),

                const Text('Driver', style: TextStyle(fontWeight: FontWeight.w600)),
                const SizedBox(height: 4),
                const Text('Fernando Ferine', style: TextStyle(color: Colors.black87)),

                const SizedBox(height: 20),

                const Text('Other', style: TextStyle(fontWeight: FontWeight.w600)),
                const SizedBox(height: 8),

                Row(
                  children: const [
                    Icon(Icons.wifi, size: 18, color: Colors.teal),
                    SizedBox(width: 6),
                    Icon(Icons.wc, size: 18, color: Colors.teal),
                    SizedBox(width: 6),
                    Icon(Icons.restaurant, size: 18, color: Colors.teal),
                    SizedBox(width: 6),
                    Icon(Icons.ac_unit, size: 18, color: Colors.teal),
                  ],
                )
              ],
            ),
          ),

          const Spacer(),

          // CONFIRM BUTTON
          Container(
            margin: const EdgeInsets.all(20),
            width: double.infinity,
            height: 55,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF0F6F6E),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: () {},
              child: const Text(
                'Confirm And Book',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _rowItem(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(color: Colors.black87)),
          Text(value, style: const TextStyle(fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }

  Widget _highlightRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 3),
            decoration: BoxDecoration(color: Colors.yellow.shade300),
            child: Text(title, style: const TextStyle(color: Colors.black)),
          ),
          Text(value, style: const TextStyle(fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }

  Widget _seatRow(String title, String seatNumber) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          CircleAvatar(
            radius: 14,
            backgroundColor: const Color(0xFF0F6F6E),
            child: Text(
              seatNumber,
              style: const TextStyle(color: Colors.white, fontSize: 13),
            ),
          )
        ],
      ),
    );
  }
}
