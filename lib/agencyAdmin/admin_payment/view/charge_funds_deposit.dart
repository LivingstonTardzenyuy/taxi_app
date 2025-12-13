import 'package:flutter/material.dart';
import 'package:taxi_app/theme/colors.dart';
import 'package:taxi_app/client_app/authentication/widgets/primary_button.dart';
import 'package:taxi_app/client_app/authentication/widgets/auth_text_field.dart';

class ChargeFundsDepositScreen extends StatelessWidget {
  const ChargeFundsDepositScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.6,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        title: const Text('Charge funds', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w600)),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                    Text('Balance', style: TextStyle(color: Colors.white70)),
                    SizedBox(height: 8),
                    Text(r'$590', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700)),
                  ],
                ),
              ),

              const SizedBox(height: 18),
              const Text('Fill in the amount you want to deposit below', style: TextStyle(fontWeight: FontWeight.w600)),
              const SizedBox(height: 12),

              // Selected provider card with min/max info
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 64,
                      height: 64,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Center(child: Text('Atica', style: TextStyle(fontWeight: FontWeight.w700))),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('Min amount:', style: TextStyle(color: Colors.black54)),
                          SizedBox(height: 4),
                          Text(r'$20', style: TextStyle(fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: const [
                        Text('Max amount:', style: TextStyle(color: Colors.black54)),
                        SizedBox(height: 4),
                        Text(r'$500', style: TextStyle(fontWeight: FontWeight.w600)),
                      ],
                    )
                  ],
                ),
              ),

              const SizedBox(height: 12),
              AuthTextField(hint: 'Wallet Number', prefixIcon: const Icon(Icons.account_box_outlined, color: Colors.black54)),
              const SizedBox(height: 12),
              AuthTextField(hint: r'$ Amount', prefixIcon: const Icon(Icons.attach_money_outlined, color: Colors.black54)),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: PrimaryButton(label: 'Confirm Deposit', onPressed: () {}),
      ),
    );
  }
}
