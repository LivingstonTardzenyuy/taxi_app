import 'package:flutter/material.dart';
import 'package:taxi_app/theme/colors.dart';
import 'package:taxi_app/client_app/authentication/widgets/primary_button.dart';
import 'otp_verification.dart';

class ArrivedAtDestinationScreen extends StatelessWidget {
  const ArrivedAtDestinationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black87),
        title: const Text('Arrived at destination', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w600)),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Positioned.fill(child: Image.asset('assets/booking/booking.jpg', fit: BoxFit.cover)),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.45,
              decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
              child: Column(
                children: [
                  const SizedBox(height: 8),
                  Container(width: 60, height: 6, margin: const EdgeInsets.symmetric(vertical: 8), decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(6))),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    child: Column(children: [
                      const SizedBox(height: 8),
                      Container(
                          height: 100, width: 100, child: const Center(child: Icon(Icons.location_on_outlined, size: 48, color: AppColors.primaryColor))),
                      const SizedBox(height: 12),
                      const Text('Arrived At Customer Location',
                          style: TextStyle(
                                fontSize: 21, fontWeight: FontWeight.w700)),
                      const SizedBox(height: 6),
                      const Text('Manroe Platoon Street',
                          style: TextStyle(color: Colors.black)),
                      const SizedBox(height: 45),
                      SizedBox(width: double.infinity,
                          child: PrimaryButton(
                              label: 'Ask For OTP',
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (_) => const OtpVerificationScreen()
                                )); })),
                    ]),
                  ),
                ],
              ),
            ),
          ),
          SafeArea(child: Padding(padding: const EdgeInsets.all(8.0), child: Align(alignment: Alignment.topLeft, child: CircleAvatar(backgroundColor: Colors.white70, child: IconButton(icon: const Icon(Icons.arrow_back, color: Colors.black87), onPressed: () => Navigator.of(context).pop()))))),
        ],
      ),
    );
  }
}
