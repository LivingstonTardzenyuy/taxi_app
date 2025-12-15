import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:taxi_app/client_app/authentication/widgets/auth_text_field.dart';
import 'package:taxi_app/client_app/authentication/widgets/primary_button.dart';
import 'package:taxi_app/driver_app/home/views/home.dart';
import 'package:taxi_app/theme/colors.dart';

class DriverChargeFundsScreen extends StatefulWidget {
  const DriverChargeFundsScreen({Key? key}) : super(key: key);

  @override
  State<DriverChargeFundsScreen> createState() => _DriverChargeFundsScreenState();
}

class _DriverChargeFundsScreenState extends State<DriverChargeFundsScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
        title: const Text('Charge funds', style: TextStyle(color: Colors.black87)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Balance', style: TextStyle(color: Colors.white, fontSize: 14)),
                  SizedBox(height: 8),
                  Text('\$590', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22)),
                ],
              ),
            ),
            const SizedBox(height: 12),
            const Text('Fill in the amount you want to add below', style: TextStyle(color: Colors.black54)),
            const SizedBox(height: 12),
            AuthTextField(hint: 'Wallet Number/Phone Number', controller: _controller),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 52,
              child: PrimaryButton(
                label: 'Confirm Deposit',
                color: AppColors.primaryColor,
                onPressed: () {
                  // TODO: implement deposit action
                  Get.to(DriverHomeScreen());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
