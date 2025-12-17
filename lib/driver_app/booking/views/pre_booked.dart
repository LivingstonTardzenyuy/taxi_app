import 'package:flutter/material.dart';
import 'package:taxi_app/theme/colors.dart';
import 'package:taxi_app/client_app/authentication/widgets/primary_button.dart';

class PreBookedScreen extends StatelessWidget {
  const PreBookedScreen({Key? key}) : super(key: key);

  Widget _infoRow(IconData icon, String text) {
    return Row(
        children: [
          Icon(icon, size: 16, color: AppColors.primaryColor),
          const SizedBox(width: 8),
          Text(text, style: const TextStyle(color: Colors.black87))]);
  }

  Widget _locations() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        ListTile(leading: Icon(Icons.radio_button_checked, color: AppColors.primaryColor), title: Text('Reding Town Last Town')),
        ListTile(leading: Icon(Icons.location_on, color: Colors.black54), title: Text('Manroe Platoon Street')),
      ],
    );
  }

  Widget _card(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8), border: Border.all(color: const Color(0xFFECECEC))),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          Image.asset("assets/images/img.png"),
          const SizedBox(width: 12),
          Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
            Text('Kendrick Anne', style: TextStyle(fontWeight: FontWeight.w700)), SizedBox(height: 4), Text('CRN: #Oioie837', style: TextStyle(color: Colors.black54, fontSize: 12))])),
        ]),
        const SizedBox(height: 24),
        Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          _infoRow(Icons.place, '5.2km'),
          const SizedBox(width: 12),
          _infoRow(Icons.access_time, '55 Mins'),
          const SizedBox(width: 12),
          _infoRow(Icons.monetization_on, '\$20'),
        ]),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
                'Date And Time:', style: TextStyle(color: Colors.black54, fontSize: 12)),
            const SizedBox(height: 4),
            const Text('12/12/12 | 13:00', style: TextStyle(fontWeight: FontWeight.w600)),

          ],
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Ride Type:', style: TextStyle(color: Colors.black54, fontSize: 12)),
            const SizedBox(height: 4),
            Container(padding: const EdgeInsets.all(8), decoration: BoxDecoration(color: const Color(0xFFF7F7F7), borderRadius: BorderRadius.circular(6)), child: const Text('Shared')),

          ],
        ),
        const SizedBox(height: 12),
        _locations(),
        const SizedBox(height: 12),
        PrimaryButton(label: 'Cancel Ride', onPressed: () {}),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black87),
        title: const Text('Pre booked', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w600)),
        centerTitle: true,
      ),
      body: Container(
        color: const Color(0xFFF7F7F7),
        padding: const EdgeInsets.all(16),
        child: Column(children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8), decoration: BoxDecoration(color: const Color(0xFFF7F7F7), borderRadius: BorderRadius.circular(20)), child: const Text('Bus')),
              const SizedBox(width: 12),
              Container(padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)), child: const Text('Taxi')),
            ]),
          ),
          const SizedBox(height: 16),
          _card(context),
        ]),
      ),
    );
  }
}
