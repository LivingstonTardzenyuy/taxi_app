import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:taxi_app/client_app/authentication/widgets/primary_button.dart';
import 'package:taxi_app/driver_app/profile/views/car_image.dart';

class CarDocumentsScreen extends StatelessWidget {
  const CarDocumentsScreen({Key? key}) : super(key: key);

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
        title: const Text('Car documents', style: TextStyle(color: Colors.black87)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
        child: Column(
          children: [
            const SizedBox(height: 8),
            _buildDocTile(context, 'Car PUC'),
            const SizedBox(height: 12),
            _buildDocTile(context, 'Car Insurance'),
            const SizedBox(height: 12),
            _buildDocTile(context, 'Car Registration Certificate'),
            const SizedBox(height: 12),
            _buildDocTile(context, 'Car Permit'),
            const Spacer(),
            Container(
              padding: const EdgeInsets.only(bottom: 40),
              width: double.infinity,
              child: PrimaryButton(
                label: 'Done',
                onPressed: () => Get.to(CarImageScreen()),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildDocTile(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        // Future: open upload or preview
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: const Color(0xFFECECEC)),
          boxShadow: const [BoxShadow(color: Color(0x0A000000), blurRadius: 4, offset: Offset(0,2))],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: const TextStyle(color: Colors.black87)),
            const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.black54),
          ],
        ),
      ),
    );
  }
}
