import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taxi_app/client_app/authentication/widgets/primary_button.dart';
import 'package:taxi_app/theme/colors.dart';

import 'emergency_contact.dart';

class SosEmergencyScreen extends StatelessWidget {
  const SosEmergencyScreen({Key? key}) : super(key: key);

  void _showConfirmSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (_) {
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.45,
          minChildSize: 0.25,
          maxChildSize: 0.9,
          builder: (context, controller) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(width: 40, height: 6, decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(6))),
                  const SizedBox(height: 12),
                  // Expanded(
                  //   child:
                  // ),
                  SingleChildScrollView(
                    controller: controller,
                    child: Column(
                      children: [
                        Container(
                            height: 80, width: 100,
                            child: Icon(
                                Icons.report_problem_outlined,
                              size: 60,
                            )),
                        const SizedBox(height: 25),
                        const Text('Continue To Send Alert?', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
                        const SizedBox(height: 12),
                      ],
                    ),
                  ),
                  const SizedBox(height: 62),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () => Navigator.of(context).pop(),
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                            ),
                            child: const Text('Cancel', style: TextStyle(color: Colors.black87)),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: PrimaryButton(
                            label: 'Send Alert',
                            onPressed: () {
                              Get.to(EmergencyContactScreen());
                              // Navigator.of(context).pop();
                              // Get.snackbar('Alert sent', 'Emergency alert sent to your contacts', backgroundColor: Colors.white);
                            },
                            height: 52,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _card(BuildContext context, IconData icon, String title) {
    return GestureDetector(
      onTap: () => _showConfirmSheet(context),
      child: Container(
        width: double.infinity,
        height: 190,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFFECECEC)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(backgroundColor: const Color(0xFFFFECEC), radius: 22, child: Icon(icon, color: Colors.redAccent)),
            const SizedBox(height: 32),
            Text(title, textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black87),
        title: const Text('sos', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w600)),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 140),
            CircleAvatar(
                radius: 50,
                backgroundColor: const Color(0xFFE55050),
                child: Icon(
                    Icons.warning_amber_rounded,
                    color: Colors.white, size: 46)),
            const SizedBox(height: 12),
            const Text(
                'Use In Case Of Emergency',
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 25
                ),
            ),
            const SizedBox(height: 80),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(child: _card(context, Icons.phone, 'Call Police\nControl Room')),
                  const SizedBox(width: 12),
                  Expanded(child: _card(context, Icons.report_problem_outlined, 'Alert Your\nEmergency Contact')),
                ],
              ),
            ),
            const SizedBox(height: 18),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text('Company tracks location data for a safer and smooth ride', textAlign: TextAlign.center, style: TextStyle(color: Colors.black54)),
            ),
          ],
        ),
      ),
    );
  }
}
