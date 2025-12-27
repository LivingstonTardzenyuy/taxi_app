import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:taxi_app/driver_app/payment/views/charge_funds_2.dart';
import '../../../theme/colors.dart';

class ChargeFunds1 extends StatelessWidget {
  const ChargeFunds1({Key? key}) : super(key: key);

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
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 13),
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
              'Select payment method',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 16),

            const Text(
              'Mobile payment',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 12),

            /// Mobile Payment Options
            Row(
              children: [
                _mobilePayCard('MTN', Icons.phone_android),
                const SizedBox(width: 12),
                _mobilePayCard('UBA', Icons.account_balance),
                const SizedBox(width: 12),
                _mobilePayCard('ZOOS', Icons.flash_on),
              ],
            ),

            const SizedBox(height: 40),

            /// Card Payment
            const Text(
              'Card',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                color: Colors.black,
              ),
            ),

            const SizedBox(height: 10),

            /// Expired Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 8,
                children: const [
                  Text(
                      'Visa Debit *******234',
                      style: TextStyle(
                          color: Colors.white
                      )
                  ),
                  // SizedBox(height: 8),
                  Text(
                      'Asingi Payo',
                      style: TextStyle(
                          color: Colors.white
                      )
                  ),
                  Text(
                      'Expired',
                      style: TextStyle(
                          color: Colors.white
                      )
                  ),
                ],
                // const SizedBox()],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Mobile Payment Card
  Widget _mobilePayCard(String label, IconData icon) {
    return Expanded(
      child: InkWell(
        onTap: () {
          print("You just clicked me");
          Get.to(ChargeFunds2());
        },
        child: Container(
          height: 60,
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
        ),
      )
    );
  }
}
