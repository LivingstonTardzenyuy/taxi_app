import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:taxi_app/client_app/authentication/widgets/auth_text_field.dart';
import 'package:taxi_app/client_app/authentication/widgets/primary_button.dart';
import '../../../theme/colors.dart';
import 'charge_funds3.dart';

class ChargeFunds2 extends StatelessWidget {
  const ChargeFunds2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: const BackButton(color: Colors.black),
        centerTitle: true,
        title: const Text(
          'Charge funds',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// Balance Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
              decoration: BoxDecoration(
                color: const Color(0xFF0E6F6C),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Balance',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    '\$550',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            /// Select Payment Method
            const Text(
              'Fill in the amount you want to deposit below',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),


            const SizedBox(height: 12),

            /// Mobile Payment Options
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _mobilePayCard('MTN', Icons.phone_android),
                const SizedBox(width: 15),
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text("Min Amount"),
                          Text("\$20",
                            style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w800
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text("Max Amount"),
                          Text("\$500",
                              style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w800
                          ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 40),

            /// Card Payment
            AuthTextField(
                hint: "Wallet Number",
                // prefixIcon: ,
            ),
            const SizedBox(height: 15,),
            AuthTextField(
              hint: "Wallet Number",
              prefixIcon: Icon(Icons.wallet_outlined),
            ),

            Spacer(),
            Container(
              padding: const EdgeInsets.only(bottom: 30),
              width: double.infinity,
              child: PrimaryButton(
                  label: "Confirm Deposit",
                  onPressed: () {
                    Get.to(ChargeFunds3());
                  }),
            )
          ],
        ),
      ),
    );
  }

  /// Mobile Payment Card
  Widget _mobilePayCard(String label, IconData icon) {
    return Container(
      height: 120,
      width: 170,
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
