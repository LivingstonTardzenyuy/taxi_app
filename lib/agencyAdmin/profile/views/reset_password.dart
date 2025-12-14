import 'package:flutter/material.dart';
import 'package:taxi_app/client_app/authentication/widgets/auth_text_field.dart';
import 'package:taxi_app/client_app/authentication/widgets/primary_button.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.6,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        title: const Text('Profile', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w600)),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Reset Password', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
              const SizedBox(height: 18),

              // Current password with forgot link to the right
              Row(
                children: [
                  Expanded(child: AuthTextField(hint: 'Current password', obscure: true)),
                  const SizedBox(width: 8),
                  TextButton(onPressed: () {}, child: const Text('Forgot password?', style: TextStyle(color: Colors.black54))),
                ],
              ),

              const SizedBox(height: 12),
              const Text('New password', style: TextStyle(fontWeight: FontWeight.w600)),
              const SizedBox(height: 8),
              AuthTextField(hint: '*****', obscure: true),

              const SizedBox(height: 12),
              const Text('Confirm new password', style: TextStyle(fontWeight: FontWeight.w600)),
              const SizedBox(height: 8),
              AuthTextField(hint: '********', obscure: true),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: PrimaryButton(label: 'Update', onPressed: () {}),
      ),
    );
  }
}
