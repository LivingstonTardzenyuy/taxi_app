import 'package:flutter/material.dart';

class CarImageScreen extends StatelessWidget {
  const CarImageScreen({Key? key}) : super(key: key);

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
        title: const Text('Car image', style: TextStyle(color: Colors.black87)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
        child: Column(
          children: [
            const SizedBox(height: 8),
            _buildImageTile(context, 'Front Side With Number Plate'),
            const SizedBox(height: 12),
            _buildImageTile(context, 'Chassis Number Image'),
            const SizedBox(height: 12),
            _buildImageTile(context, 'Back Side With Number Plate'),
            const SizedBox(height: 12),
            _buildImageTile(context, 'Left Side Exterior'),
            const SizedBox(height: 12),
            _buildImageTile(context, 'Right Side Exterior'),
          ],
        ),
      ),
    );
  }

  Widget _buildImageTile(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        // TODO: Launch image picker or preview
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
