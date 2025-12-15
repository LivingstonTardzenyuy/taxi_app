import 'package:flutter/material.dart';
import 'package:taxi_app/client_app/authentication/widgets/primary_button.dart';

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
              padding: const EdgeInsets.only(bottom: 30),
              width: double.infinity,
              child: SizedBox(
                width: double.infinity,
                height: 52,
                child: PrimaryButton(
                  label: 'Done',
                  onPressed: () => Navigator.of(context).pop(),
                ),
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
