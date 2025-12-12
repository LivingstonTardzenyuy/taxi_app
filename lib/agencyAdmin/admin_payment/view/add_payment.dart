import 'package:flutter/material.dart';
import 'package:taxi_app/client_app/authentication/widgets/auth_text_field.dart';

import '../../../client_app/authentication/widgets/primary_button.dart';
import '../../../theme/colors.dart';

class PaymentAdd extends StatelessWidget {
  const PaymentAdd({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
          title: Text("Add cart")
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text(
            //   'Card details',
            //   style: TextStyle(
            //       fontSize: 22, fontWeight: FontWeight.w800
            //   ),
            // ),
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
                children: const [
                  Text('Balance', style: TextStyle(color: Colors.white, fontSize: 16)),
                  SizedBox(height: 8),
                  Text(r'$590', style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.w700)),
                ],
              ),
            ),

            const SizedBox(height: 32,),
            Text(
              "Fill in the amount you want to add below"
            ),
            const SizedBox(height: 40,),
            AuthTextField(hint: "Wallet Number/ Phone Number"),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: Container(
                width: double.infinity,
                child: PrimaryButton(
                    label: "Confirm Deposit",
                    onPressed: () {

                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
