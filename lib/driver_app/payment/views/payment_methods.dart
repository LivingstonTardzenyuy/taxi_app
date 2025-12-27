import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:taxi_app/client_app/authentication/widgets/primary_button.dart';
import 'package:taxi_app/driver_app/payment/views/add_cart_driver.dart';
import 'package:taxi_app/theme/colors.dart';

class PaymentMethodsScreen extends StatelessWidget {
  const PaymentMethodsScreen({Key? key}) : super(key: key);

  Widget _sectionTile({required String title, Widget? trailing, VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: const Color(0xFFDDDDDD)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: const TextStyle(color: Colors.black87)),
            if (trailing != null) trailing else const SizedBox.shrink(),
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
        title: const Text('Payment methods', style: TextStyle(color: Colors.black87)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Balance card
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
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15)
                  ),
                  height: 65,
                  child: Card(
                    color: Color(0xFFFFFFFF),
                    child: InkWell(
                      onTap: () {
                        Get.to(AddCardDriverScreen());
                      },
                      child: Center(child: const Text(
                          'Fund account',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w800
                          )
                        )
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              const Text('Cash', style: TextStyle(fontWeight: FontWeight.w600)),
              const SizedBox(height: 8),
              _sectionTile(title: 'Cash', trailing: const Icon(Icons.arrow_upward, color: Colors.black54)),
              const SizedBox(height: 16),

              const Text('Wallet', style: TextStyle(fontWeight: FontWeight.w600)),
              const SizedBox(height: 8),
              _sectionTile(title: 'Wallet', trailing: const SizedBox.shrink()),
              const SizedBox(height: 16),

              const Text('Credit card', style: TextStyle(fontWeight: FontWeight.w600)),
              const SizedBox(height: 8),
              _sectionTile(
                title: '••••786',
                trailing: Row(mainAxisSize: MainAxisSize.min, children: const [Icon(Icons.credit_card, color: Colors.black54), SizedBox(width: 8), Icon(Icons.add, color: Colors.black54)]),
              ),
              const SizedBox(height: 16),

              const Text('Mobile money', style: TextStyle(fontWeight: FontWeight.w600)),
              const SizedBox(height: 8),
              _sectionTile(title: 'MONEP PAY', trailing: const SizedBox.shrink()),
              const SizedBox(height: 16),

              const Text('More payment methods', style: TextStyle(fontWeight: FontWeight.w600)),
              const SizedBox(height: 8),
              _sectionTile(title: 'Google Pay', trailing: const SizedBox.shrink()),
              const SizedBox(height: 12),
              _sectionTile(title: 'Transaction history', trailing: const SizedBox.shrink()),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
