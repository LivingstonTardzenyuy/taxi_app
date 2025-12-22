import 'package:flutter/material.dart';
import 'package:taxi_app/theme/colors.dart';
import 'package:taxi_app/client_app/authentication/widgets/primary_button.dart';

class TaxiLocationScreen extends StatelessWidget {
  const TaxiLocationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black87),
        title: const Text('Pick-up', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w600)),
        leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: () => Navigator.of(context).pop()),
      ),
      body: Stack(
        children: [
          Positioned.fill(child: Image.asset('assets/booking/booking.jpg', fit: BoxFit.cover)),

          // Top address chip
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              child: Row(children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                    decoration: BoxDecoration(color: Colors.white.withOpacity(0.9), borderRadius: BorderRadius.circular(8)),
                    child: Row(children: const [Icon(Icons.place, color: AppColors.primaryColor), SizedBox(width: 8), Expanded(child: Text('Placibo Retty street down town 2234', overflow: TextOverflow.ellipsis))]),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  decoration: BoxDecoration(color: Colors.white.withOpacity(0.9), shape: BoxShape.circle),
                  child: IconButton(icon: const Icon(Icons.search), onPressed: () {}),
                )
              ]),
            ),
          ),

          // small locate icon bottom-right
          Positioned(
            right: 18,
            bottom: MediaQuery.of(context).size.height * 0.18 + 70,
            child: Container(
              decoration: BoxDecoration(color: Colors.white.withOpacity(0.9), borderRadius: BorderRadius.circular(12)),
              child: IconButton(icon: const Icon(Icons.my_location, color: AppColors.primaryColor), onPressed: () {}),
            ),
          ),

          // Bottom rounded panel with Confirm Location
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.18 + 30,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8)],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(width: 60, height: 6, decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(6))),
                    const SizedBox(height: 12),
                    Row(children: [
                      Expanded(child: PrimaryButton(label: 'Confirm Location', onPressed: () {})),
                    ]),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
