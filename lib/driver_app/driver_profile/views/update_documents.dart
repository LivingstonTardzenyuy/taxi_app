import 'package:flutter/material.dart';
import 'package:taxi_app/client_app/authentication/widgets/primary_button.dart';

class UpdateDocumentsScreen extends StatelessWidget {
  const UpdateDocumentsScreen({Key? key}) : super(key: key);

  Widget _tile(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8), border: Border.all(color: const Color(0xFFECECEC))),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text(title, style: const TextStyle(color: Colors.black87)), const Icon(Icons.arrow_forward_ios, color: Colors.black54)]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(icon: const Icon(Icons.arrow_back, color: Colors.black87), onPressed: () => Navigator.of(context).pop()),
        title: const Text('Update document details', style: TextStyle(color: Colors.black87)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
        child: Column(
          children: [
            const SizedBox(height: 8),
            _tile(context, 'Bank Account Details'),
            _tile(context, 'Profile Picture'),
            _tile(context, 'Driving Details'),
            _tile(context, 'Identification Document'),
            const Spacer(),

            Container(
                padding: const EdgeInsets.only(bottom: 55),
                width: double.infinity,
                child: PrimaryButton(
                    label: 'Update',
                    onPressed: () => Navigator.of(context).pop())
            ),
          ],
        ),
      ),
    );
  }
}
