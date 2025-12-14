import 'package:flutter/material.dart';
import 'package:taxi_app/client_app/authentication/widgets/auth_text_field.dart';
import 'package:taxi_app/client_app/authentication/widgets/primary_button.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.6,
        leading: IconButton(
          icon: const Icon(Icons.menu_rounded, color: Colors.black87),
          onPressed: () {},
        ),
        centerTitle: true,
        title: const Text('Profile', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w600)),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
          child: Column(
            children: [
              const SizedBox(height: 8),
              const Align(alignment: Alignment.centerLeft, child: Text('Full name', style: TextStyle(fontWeight: FontWeight.w600))),
              const SizedBox(height: 8),
              AuthTextField(hint: 'Full name'),
              const SizedBox(height: 12),
              const Align(alignment: Alignment.centerLeft, child: Text('Email', style: TextStyle(fontWeight: FontWeight.w600))),
              const SizedBox(height: 8),
              AuthTextField(hint: 'Example@outlook.com', keyboardType: TextInputType.emailAddress),
              const SizedBox(height: 12),
              const Align(alignment: Alignment.centerLeft, child: Text('Phone number', style: TextStyle(fontWeight: FontWeight.w600))),
              const SizedBox(height: 8),
              AuthTextField(hint: '+145 236 5896', keyboardType: TextInputType.phone),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: PrimaryButton(label: 'Reset Filters', onPressed: () {}),
      ),
    );
  }
}
