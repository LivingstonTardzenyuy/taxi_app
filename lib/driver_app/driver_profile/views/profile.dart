import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:taxi_app/client_app/authentication/widgets/primary_button.dart';
import 'package:taxi_app/driver_app/driver_profile/views/help_center.dart';
import 'package:taxi_app/driver_app/driver_profile/views/personal_info.dart';
import 'package:taxi_app/driver_app/driver_profile/views/privacy_policy.dart';
import 'package:taxi_app/driver_app/driver_profile/views/update_documents.dart';

class DriverProfileMenu extends StatelessWidget {
  const DriverProfileMenu({Key? key}) : super(key: key);

  Widget _menuTile(BuildContext context, IconData icon, String title, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: const Color(0xFFECECEC)),
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.black54),
            const SizedBox(width: 12),
            Expanded(child: Text(title, style: const TextStyle(color: Colors.black87))),
            const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.black54),
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
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Profile', style: TextStyle(color: Colors.black87)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
        child: Column(
          children: [
            const SizedBox(height: 8),
            // avatar
            const CircleAvatar(
              radius: 42,
              backgroundColor: Color(0xFF8ED6DB),
              child: Icon(Icons.person, size: 40, color: Colors.white),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(color: const Color(0xFFE0F7F7), borderRadius: BorderRadius.circular(16)),
              child: const Text('EDIT', style: TextStyle(fontSize: 12, color: Color(0xFF8ED6DB))),
            ),
            const SizedBox(height: 12),
            const Text('Kendrick Anne', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            const SizedBox(height: 18),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _menuTile(
                        context, Icons.person_outline,
                        'Personal information',
                        onTap: () => Get.to(PersonalInfoScreen())),
                    _menuTile(context, Icons.attach_money,
                        'Price rate',
                        onTap: () => Get.to(UpdateDocumentsScreen())),
                    _menuTile(context, Icons.notifications_none, 'Notification', onTap: () {}),
                    _menuTile(context, Icons.directions_car, 'Your rides', onTap: () {}),
                    _menuTile(context, Icons.calendar_today, 'Pre-Booked rides', onTap: () {}),
                    _menuTile(context, Icons.car_repair, 'Cars', onTap: () {}),
                    _menuTile(context, Icons.settings, 'Settings', onTap: () {}),
                    _menuTile(context, Icons.help_outline, 'Help center',
                        onTap: () {
                            Get.to(HelpCenterScreen());
                        }),
                    _menuTile(context, Icons.privacy_tip_outlined, 'Privacy and policy',
                        onTap: () {
                            Get.to(PrivacyPolicyScreen());
                        }),
                    _menuTile(context, Icons.logout, 'Logout',
                        onTap: () {
                            // Get.to()
                        }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
