import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:taxi_app/theme/colors.dart';
import 'package:taxi_app/client_app/authentication/widgets/primary_button.dart';

import 'arrived_at_destination.dart';

class CustomerLocationScreen extends StatelessWidget {
  final bool showCountdown;
  const CustomerLocationScreen({Key? key, this.showCountdown = false}) : super(key: key);

  Widget _locationRow(IconData icon, String title) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: const Color(0xFFF7F7F7)),
      child: Row(children: [Icon(icon, color: AppColors.primaryColor), const SizedBox(width: 12), Expanded(child: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)))]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black87),
        title: const Text('Customer location', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w600)),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Positioned.fill(child: Image.asset('assets/booking/booking.jpg', fit: BoxFit.cover)),

          if (showCountdown)
            Positioned(
              top: MediaQuery.of(context).size.height * 0.24,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  width: 110,
                  height: 90,
                  decoration: BoxDecoration(color: Colors.white.withOpacity(0.85), shape: BoxShape.circle),
                  child: Center(child: Column(mainAxisSize: MainAxisSize.min, children: const [Text('03', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700)), SizedBox(height: 6), Text('Seconds', style: TextStyle(color: Colors.black54))])),
                ),
              ),
            ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.44,
              decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
              child: Column(children: [
                const SizedBox(height: 8),
                Container(width: 60, height: 6, margin: const EdgeInsets.symmetric(vertical: 8), decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(6))),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(children: const [Expanded(child: Text('Customer Location', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700))), Text('15mins away', style: TextStyle(color: Colors.black54, fontSize: 12))]),
                ),
                const SizedBox(height: 8,),
                Divider(),
                const SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(children: [
                    const CircleAvatar(radius: 26, backgroundImage: AssetImage('assets/images/img.png'), backgroundColor: Colors.white),
                    const SizedBox(width: 18),
                    Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [Text('Kendrick Anne', style: TextStyle(fontWeight: FontWeight.w700)), SizedBox(height: 4), Text('Cash Payment', style: TextStyle(color: Colors.black54, fontSize: 12))])),
                    IconButton(onPressed: () {}, icon: const Icon(Icons.phone)),
                    IconButton(onPressed: () {}, icon: const Icon(Icons.message_outlined)),
                  ]),
                ),
                const SizedBox(height: 12),
                const SizedBox(height: 52),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SizedBox(width: double.infinity, child: PrimaryButton(
                      label: showCountdown ? 'Continue' : "Navigate To Customer's Location",
                      onPressed: () {
                        Get.to(ArrivedAtDestinationScreen());
                      })),
                ),
              ]),
            ),
          ),

          // small floating action (location icon)
          Positioned(
            right: 24,
            bottom: MediaQuery.of(context).size.height * 0.44 + 24,
            child: Container(
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24), boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6)]),
              child: IconButton(onPressed: () {}, icon: const Icon(Icons.my_location, color: AppColors.primaryColor)),
            ),
          ),
        ],
      ),
    );
  }
}
