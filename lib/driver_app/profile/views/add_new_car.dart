import 'package:flutter/material.dart';
import 'package:taxi_app/client_app/authentication/widgets/auth_text_field.dart';
import 'package:taxi_app/client_app/authentication/widgets/primary_button.dart';
import 'package:taxi_app/theme/colors.dart';
import 'car_documents.dart';
import 'car_image.dart';

class AddNewCarScreen extends StatefulWidget {
  const AddNewCarScreen({Key? key}) : super(key: key);

  @override
  State<AddNewCarScreen> createState() => _AddNewCarScreenState();
}

class _AddNewCarScreenState extends State<AddNewCarScreen> {
  String carType = 'Select';
  String seats = 'Select';
  String fuelType = 'Select';

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
        title: const Text('Add new car', style: TextStyle(color: Colors.black87)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            const AuthTextField(hint: 'Car Name'),
            const SizedBox(height: 12),
            _buildDropdownTile('Car Type', carType, () async {
              final picked = await _showOptions(['Sedan', 'Hatchback', 'SUV']);
              if (picked != null) setState(() => carType = picked);
            }),
            const SizedBox(height: 12),
            _buildDropdownTile('No Of Seats', seats, () async {
              final picked = await _showOptions(['2', '4', '5', '6', '7']);
              if (picked != null) setState(() => seats = picked);
            }),
            const SizedBox(height: 12),
            const AuthTextField(hint: 'Car Number'),
            const SizedBox(height: 12),
            _buildDropdownTile('Car Fuel Type', fuelType, () async {
              final picked = await _showOptions(['Petrol', 'Diesel', 'CNG', 'Electric']);
              if (picked != null) setState(() => fuelType = picked);
            }),
            const SizedBox(height: 12),
            _buildNavTile('Car Documents', () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const CarDocumentsScreen()))),
            const SizedBox(height: 12),
            _buildNavTile('Add Image', () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const CarImageScreen()))),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 52,
              child: PrimaryButton(
                label: 'Add New Car',
                onPressed: () {
                  // TODO: Hook up save logic
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdownTile(String title, String value, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
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
            Row(children: [
              Text(value == 'Select' ? '' : value, style: const TextStyle(color: Colors.black54)),
              const SizedBox(width: 8),
              const Icon(Icons.arrow_drop_down, color: Colors.black54),
            ])
          ],
        ),
      ),
    );
  }

  Widget _buildNavTile(String title, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
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

  Future<String?> _showOptions(List<String> options) async {
    return showModalBottomSheet<String>(
      context: context,
      builder: (ctx) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: options.map((o) => ListTile(title: Text(o), onTap: () => Navigator.of(ctx).pop(o))).toList(),
        );
      }
    );
  }
}
