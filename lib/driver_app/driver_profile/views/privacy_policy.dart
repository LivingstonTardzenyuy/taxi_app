import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({Key? key}) : super(key: key);

  final String _lorem = 'Lorem ipsum faucibus mi maecenas enim sapien volutpat nibh volutpat volutpat velit sit cursus fusce velit egestas odio varius amet vitae quis ut amet ut nec suspendisse aliquam. ';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(icon: const Icon(Icons.arrow_back, color: Colors.black87), onPressed: () => Navigator.of(context).pop()),
        title: const Text('Privacy and policy', style: TextStyle(color: Colors.black87)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              const Text('Cancellation Policy', style: TextStyle(fontWeight: FontWeight.w600)),
              const SizedBox(height: 8),
              Text(_lorem * 3, style: const TextStyle(color: Colors.black54)),
              const SizedBox(height: 16),
              const Text('Terms & Conditions', style: TextStyle(fontWeight: FontWeight.w600)),
              const SizedBox(height: 8),
              Text(_lorem * 6, style: const TextStyle(color: Colors.black54)),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
