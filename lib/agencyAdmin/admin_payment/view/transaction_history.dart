import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:taxi_app/agencyAdmin/admin_payment/view/charge_funds_deposit.dart';
import 'package:taxi_app/agencyAdmin/admin_payment/view/charge_funds_select.dart';
import 'package:taxi_app/theme/colors.dart';

class TransactionHistoryScreen extends StatelessWidget {
  const TransactionHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final items = List.generate(4, (i) => {
      'title': r'$20 Deposit',
      'subtitle': 'Success',
      'date': '12/12/12, 5:00 AM'
    });

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.6,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        title: const Text('Transaction history', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w600)),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                  'Recent transactions',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18
                  )),
              const SizedBox(height: 12),
              Expanded(
                child: ListView.separated(
                  itemCount: items.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 8),
                  itemBuilder: (context, index) {
                    final it = items[index];
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey.shade200),
                      ),
                      child: InkWell(
                        onTap: () {
                          Get.to(ChargeFundsSelectScreen());
                        },
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 18,
                              backgroundColor: Color(0xFFD1EBED),
                              child: const Icon(Icons.download_done_sharp, color: AppColors.primaryColor),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(it['title']!, style: const TextStyle(fontWeight: FontWeight.w600)),
                                  const SizedBox(height: 4),
                                  Text(it['subtitle']!, style: const TextStyle(color: Colors.black54, fontSize: 12)),
                                ],
                              ),
                            ),
                            Text(it['date']!,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 14
                                )),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
