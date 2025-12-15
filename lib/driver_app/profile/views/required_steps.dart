import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:taxi_app/client_app/authentication/widgets/primary_button.dart';
import 'profile_picture.dart';
import 'profile.dart' as driving;
import 'bank_account.dart';

class RequiredStepsScreen extends StatelessWidget {
  const RequiredStepsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Required Steps', style: TextStyle(color: Colors.black87)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Required Steps', style: TextStyle(color: Colors.black87)),
            Expanded(
              child: ListView(
                children: [
                  _buildStepTile(
                    context,
                    icon: Icons.person_pin_circle_outlined,
                    title: 'Profile picture',
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const ProfilePictureScreen())),
                  ),
                  const SizedBox(height: 12),
                  _buildStepTile(
                    context,
                    icon: Icons.account_balance_wallet,
                    title: 'Bank account details',
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const BankAccountScreen())),
                  ),
                  const SizedBox(height: 12),
                  _buildStepTile(
                    context,
                    icon: Icons.drive_file_move_rtl,
                    title: 'Driver\'s details',
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const driving.DriverProfileDocuments())),
                  ),
                  const SizedBox(height: 18),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Submitted Steps', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
                  ),
                  const SizedBox(height: 10),
                  _buildSubmittedTile(context, 'Identity Card'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: SizedBox(
                height: 52,
                width: double.infinity,
                child: PrimaryButton(
                  label: 'Submit',
                  onPressed: () {
                    Get.to(ProfilePictureScreen());
                    // TODO: submit action
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStepTile(BuildContext context, {required IconData icon, required String title, required VoidCallback onTap}) {
    return Material(
      color: Colors.white,
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: const Color(0xFFECECEC)),
          ),
          child: Row(
            children: [
              const Icon(Icons.check_circle, color: Color(0xFF2F9C95), size: 13,),
              const SizedBox(width: 6,),
              Icon(icon, size: 16,),
              const SizedBox(width: 12),
              Expanded(child: Text(title, style: const TextStyle(fontSize: 14))),
              const Icon(Icons.expand_more, color: Colors.black54),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSubmittedTile(BuildContext context, String title) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFECECEC)),
      ),
      child: Row(
        children: [
          const Icon(Icons.check_circle, color: Colors.black54),
          const SizedBox(width: 12),
          Expanded(child: Text(title, style: const TextStyle(fontSize: 14))),
          const Icon(Icons.expand_more, color: Colors.black54),
        ],
      ),
    );
  }
}
