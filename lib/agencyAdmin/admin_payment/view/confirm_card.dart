import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:taxi_app/agencyAdmin/admin_payment/view/add_payment.dart';
import 'package:taxi_app/agencyAdmin/admin_payment/view/transaction_history.dart';

import '../../../client_app/authentication/widgets/primary_button.dart';
import '../../../theme/colors.dart';

class ConfirmCard extends StatelessWidget {
  const ConfirmCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add cart")
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Card details',
              style: TextStyle(
                  fontSize: 22, fontWeight: FontWeight.w800
              ),
            ),
            const SizedBox(height: 10,),
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
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: Container(
                width: double.infinity,
                child: PrimaryButton(
                    label: "Confirm Payment Method",
                    onPressed: () {
                      Get.to(TransactionHistoryScreen());
                      // Get.to(PaymentAdd());
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
