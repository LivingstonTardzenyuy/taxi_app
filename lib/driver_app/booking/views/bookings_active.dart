import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:taxi_app/theme/colors.dart';
import 'package:taxi_app/client_app/authentication/widgets/primary_button.dart';

import 'cancel_booking.dart';

class BookingsActiveScreen extends StatelessWidget {
  const BookingsActiveScreen({Key? key}) : super(key: key);

  Widget _infoRow(IconData icon, String text) {
    return Row(children: [Icon(icon, size: 16, color: Colors.black54), const SizedBox(width: 6), Text(text)]);
  }

  Widget _locations() {
    return Column(
      children: const [
        ListTile(leading: Icon(Icons.radio_button_checked, color: AppColors.primaryColor), title: Text('Reding Town Last Town')),
        ListTile(leading: Icon(Icons.location_on, color: Colors.black54), title: Text('Manroe Platoon Street')),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black87),
        title: const Text('Bookings', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w600)),
        centerTitle: true,
      ),
      body: Container(
        color: const Color(0xFFF7F7F7),
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8), decoration: BoxDecoration(color: const Color(0xFFF7F7F7), borderRadius: BorderRadius.circular(20)), child: const Text('Bus')),
              const SizedBox(width: 12),
              Container(padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)), child: const Text('Taxi')),
            ]),
          ),
          const SizedBox(height: 12),
          Row(children: const [
            Text('Active', style: TextStyle(fontWeight: FontWeight.w700)),
            SizedBox(width: 16),
            Text('Completed', style: TextStyle(color: Colors.black54)),
            SizedBox(width: 16),
            Text('Cancelled', style: TextStyle(color: Colors.black54))
          ]),
          const SizedBox(height: 12),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8), border: Border.all(color: const Color(0xFFECECEC))),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Row(children: [
                    const CircleAvatar(backgroundColor: Color(0xFFEEF6F6), child: Icon(Icons.person, color: AppColors.primaryColor)),
                    const SizedBox(width: 12),
                    Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [Text('Kendrick Anne', style: TextStyle(fontWeight: FontWeight.w700)), SizedBox(height: 4), Text('CRN: #Oioie837', style: TextStyle(color: Colors.black54, fontSize: 12))])),
                  ]),
                  const SizedBox(height: 12),
                  Row(children: [
                    _infoRow(Icons.place, '5.2km'),
                    const SizedBox(width: 12),
                    _infoRow(Icons.access_time, '55 Mins'),
                    const SizedBox(width: 12),
                    _infoRow(Icons.monetization_on, '\$20'),
                  ]),
                  const SizedBox(height: 12),
                  const Text('Date And Time:', style: TextStyle(color: Colors.black54, fontSize: 12)),
                  const SizedBox(height: 4),
                  const Text('12/12/12 | 13:00', style: TextStyle(fontWeight: FontWeight.w600)),
                  const SizedBox(height: 12),
                  const Text('Ride Type:', style: TextStyle(color: Colors.black54, fontSize: 12)),
                  const SizedBox(height: 8),
                  Container(padding: const EdgeInsets.all(8), decoration: BoxDecoration(color: const Color(0xFFF7F7F7), borderRadius: BorderRadius.circular(6)), child: const Text('Single')),
                  const SizedBox(height: 12),
                  _locations(),
                  const SizedBox(height: 12),
                  // Map placeholder
                  Container(
                    height: 140,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Colors.grey[300]),
                    child: ClipRRect(borderRadius: BorderRadius.circular(8), child: Image.asset('assets/images/map_placeholder.png', fit: BoxFit.cover)),
                  ),
                  const SizedBox(height: 12),
                  PrimaryButton(label: 'Cancel Ride', onPressed: () {
                    Get.to(CancelBookingScreen());
                  }),
                ]),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
