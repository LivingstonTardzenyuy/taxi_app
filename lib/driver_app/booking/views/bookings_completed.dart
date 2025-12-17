import 'package:flutter/material.dart';
import 'package:taxi_app/theme/colors.dart';

class BookingsCompletedScreen extends StatelessWidget {
  const BookingsCompletedScreen({Key? key}) : super(key: key);

  Widget _infoRow(IconData icon, String text) {
    return Row(children: [Icon(icon, size: 16, color: AppColors.primaryColor), const SizedBox(width: 6), Text(text)]);
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
      body: Container(
        color: const Color(0xFFF7F7F7),
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(height: 12),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8), border: Border.all(color: const Color(0xFFECECEC))),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Row(children: [
                    Image.asset("assets/images/img.png"),
                    const SizedBox(width: 12),
                    Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [Text('Kendrick Anne', style: TextStyle(fontWeight: FontWeight.w700)), SizedBox(height: 4), Text('CRN: IIE878ES', style: TextStyle(color: Colors.black54, fontSize: 12))])),
                    const Icon(Icons.star, color: Colors.amber),
                    const SizedBox(width: 6),
                    const Text('3.8', style: TextStyle(fontWeight: FontWeight.w600))
                  ]),
                  const SizedBox(height: 42),
                  Row(children: [
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
                      const Text('Date And Time:', style: TextStyle(color: Colors.black54, fontSize: 12)),
                      const SizedBox(height: 4),
                      const Text('12/12/12 | 13:00', style: TextStyle(fontWeight: FontWeight.w600)),

                    ],
                  ),
                 const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Ride Type:', style: TextStyle(color: Colors.black54, fontSize: 12)),
                      const SizedBox(height: 8),
                      Container(padding: const EdgeInsets.all(8), decoration: BoxDecoration(color: const Color(0xFFF7F7F7), borderRadius: BorderRadius.circular(6)), child: const Text('Single')),
                    ],
                  ),
                  const SizedBox(height: 12),
                  _locations(),
                ]),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
