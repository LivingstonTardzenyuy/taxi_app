import 'package:flutter/material.dart';
import 'package:taxi_app/theme/colors.dart';
import 'package:taxi_app/client_app/authentication/widgets/primary_button.dart';

class RideRequestScreen extends StatelessWidget {
  const RideRequestScreen({Key? key}) : super(key: key);

  Widget _locationRow(IconData icon, String title, {String? subtitle}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: const Color(0xFFF7F7F7)),
      child: Row(children: [
        Icon(icon, color: AppColors.primaryColor),
        const SizedBox(width: 12),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: const TextStyle(fontWeight: FontWeight.w600)), if (subtitle != null) Text(subtitle, style: const TextStyle(color: Colors.black54, fontSize: 12))])),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset('assets/booking/booking.jpg', fit: BoxFit.cover),
          ),

          // Center countdown circle
          Positioned.fill(
            child: Column(
              children: [
                const SizedBox(height: 120),
                Center(
                  child: Container(
                    width: 110,
                    height: 110,
                    child: Center(
                      child: Column(mainAxisSize: MainAxisSize.min, children: const [
                        Text('03', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500)),
                        SizedBox(height: 6),
                        Text('Seconds', style: TextStyle(color: Colors.black54)),
                      ]),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Bottom sheet with ride info
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.48,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 8),
                  Container(width: 60, height: 6, margin: const EdgeInsets.symmetric(vertical: 8), decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(6))),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Row(
                      children: [
                        const Expanded(child: Text('Ride Request', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700))),
                        const Text('15mins away', style: TextStyle(color: Colors.black54, fontSize: 12)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    child: Row(
                      children: [
                        CircleAvatar(radius: 22, backgroundImage: const AssetImage('assets/images/img.png'), backgroundColor: Colors.white),
                        const SizedBox(width: 18),
                        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [Text('Kendrick Anne', style: TextStyle(fontWeight: FontWeight.w700)), SizedBox(height: 4), Text('Cash Payment', style: TextStyle(color: Colors.black54, fontSize: 12))])),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        _locationRow(Icons.radio_button_checked, 'Reding Town Last Town', subtitle: '2km'),
                        const SizedBox(height: 8),
                        _locationRow(Icons.location_on, 'Manroe Platoon Street'),
                        const SizedBox(height: 36),
                        Row(children: [
                          Expanded(
                            child: OutlinedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              style: OutlinedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 14), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100))),
                              child: const Text('Decline', style: TextStyle(color: Colors.black87)),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: PrimaryButton(label: 'Accept', onPressed: () {}, height: 48),
                          ),
                        ]),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // back button
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: CircleAvatar(backgroundColor: Colors.white70, child: IconButton(icon: const Icon(Icons.arrow_back, color: Colors.black87), onPressed: () => Navigator.of(context).pop())),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
