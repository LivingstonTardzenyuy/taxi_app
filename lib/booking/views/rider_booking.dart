import 'package:flutter/material.dart';
import 'package:taxi_app/theme/colors.dart';

class RiderBookingScreen extends StatelessWidget {
  const RiderBookingScreen({Key? key}) : super(key: key);

  Widget _infoLabel(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: Text(label, style: const TextStyle(color: Colors.black54))),
          const SizedBox(width: 8),
          Expanded(child: Text(value, textAlign: TextAlign.right, style: const TextStyle(fontWeight: FontWeight.w600))),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.6,
        leading: IconButton(icon: const Icon(Icons.arrow_back, color: Colors.black87), onPressed: () => Navigator.of(context).pop()),
        centerTitle: true,
        title: const Text('Booking', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w600)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // header CRN and status
              Row(
                children: const [
                  Expanded(child: Text('CRN: #945828543', style: TextStyle(fontWeight: FontWeight.w600))),
                  Text('Status: Booked', style: TextStyle(color: Colors.black54)),
                ],
              ),

              const SizedBox(height: 18),

              // Passenger Details
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Passenger Details', style: TextStyle(fontWeight: FontWeight.w600)),
                    const SizedBox(height: 8),
                    Row(children: [
                      Image.asset("assets/images/img.png"),
                      const SizedBox(width: 12),
                      Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [Text('Kendrick Anne', style: TextStyle(fontWeight: FontWeight.w700)), SizedBox(height:4), Text('+123 456 654 54', style: TextStyle(color: Colors.black54))]))
                    ]),
                    const SizedBox(height: 8),
                    const Text('Booking For', style: TextStyle(color: Colors.black54)),
                    const SizedBox(height: 4),
                    const Text('Self', style: TextStyle(fontWeight: FontWeight.w600)),
                    const SizedBox(height: 8),
                    const Text('Booking Date', style: TextStyle(color: Colors.black54)),
                    const SizedBox(height: 4),
                    const Text('10 Dec 2025 13:34', style: TextStyle(fontWeight: FontWeight.w600)),
                  ],
                ),
              ),

              const SizedBox(height: 12),

              // Driver and vehicle details
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  const Text('Driver And Vehicle Details', style: TextStyle(fontWeight: FontWeight.w600)),
                  const SizedBox(height: 8),
                  Row(children: [
                    Image.asset("assets/images/img.png"),
                    const SizedBox(width: 12),
                    Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [Text('Kendrick Anne', style: TextStyle(fontWeight: FontWeight.w700)), SizedBox(height:4), Text(' +123 456 654 54', style: TextStyle(color: Colors.black54))]))
                  ]),
                  const SizedBox(height: 8),
                  const Text('Vehicle Number', style: TextStyle(color: Colors.black54)),
                  const SizedBox(height: 4),
                  const Text('DY4858BD', style: TextStyle(fontWeight: FontWeight.w600)),
                ]),
              ),

              const SizedBox(height: 12),

              // Booking Details
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  const Text('Booking Details', style: TextStyle(fontWeight: FontWeight.w600)),
                  const SizedBox(height: 8),
                  _infoLabel('Travel Now?', 'Later Day'),
                  _infoLabel('Pre Booking For', '10 Dec 2025 13:34'),
                  _infoLabel('Departure Town', 'Yaounde'),
                  _infoLabel('Destination', 'Maroua'),
                  _infoLabel('Class', 'Comfort'),
                  _infoLabel('Seat Number', '30'),
                ]),
              ),

              const SizedBox(height: 12),

              // Payment details
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  const Text('Payment Details', style: TextStyle(fontWeight: FontWeight.w600)),
                  const SizedBox(height: 8),
                  Row(children: const [Expanded(child: Text('Payment Status', style: TextStyle(color: Colors.black54))), Text('Paid', style: TextStyle(fontWeight: FontWeight.w600))]),
                  const SizedBox(height: 8),
                  Row(children: const [Expanded(child: Text('Payment Type', style: TextStyle(color: Colors.black54))), Text('Card', style: TextStyle(fontWeight: FontWeight.w600))]),
                  const SizedBox(height: 8),
                  Row(children: const [Expanded(child: Text('Fare', style: TextStyle(color: Colors.black54))), Text('\$25', style: TextStyle(fontWeight: FontWeight.w600))]),
                ]),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
