import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:taxi_app/theme/colors.dart';

import 'add_payment.dart';
// primary_button not needed in this screen

class ChargeFundsSelectScreen extends StatelessWidget {
  const ChargeFundsSelectScreen({Key? key}) : super(key: key);

  Widget _mobileTile(String label) {
    return InkWell(
      onTap: () {
        Get.to(PaymentAdd());
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey.shade200),
        ),
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 56,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Center(child: Text(label[0], style: const TextStyle(fontWeight: FontWeight.w700))),
            ),
            const SizedBox(height: 8),
            Text(label, style: const TextStyle(fontSize: 12)),
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
              const Text('Select payment method', style: TextStyle(fontWeight: FontWeight.w600)),
              const SizedBox(height: 12),

              const Text('Mobile payment', style: TextStyle(fontWeight: FontWeight.w600)),
              const SizedBox(height: 8),
              SizedBox(
                height: 100,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, i) => _mobileTile(['Atica', 'Liva', 'Ztos'][i]),
                  separatorBuilder: (_, __) => const SizedBox(width: 12),
                  itemCount: 3,
                ),
              ),

              const SizedBox(height: 16),
              const Text('Card', style: TextStyle(fontWeight: FontWeight.w600)),
              const SizedBox(height: 8),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: const LinearGradient(colors: [AppColors.primaryColor,AppColors.primaryColor]),
                  boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0,6))],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Visa Debit *******234', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
                    SizedBox(height: 8),
                    Text('Asingi Payo', style: TextStyle(color: Colors.white70)),
                    SizedBox(height: 8),
                    Text('Expired', style: TextStyle(color: Colors.white70)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
