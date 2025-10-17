import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taxi_app/client_app/authentication/screens/forgot_password/verification_screen_password_reset.dart';
import 'package:taxi_app/client_app/authentication/screens/sign_in_client.dart';
import 'package:taxi_app/client_app/authentication/widgets/auth_header.dart';
import 'package:taxi_app/client_app/authentication/widgets/auth_text_field.dart';
import 'package:taxi_app/client_app/authentication/widgets/primary_button.dart';

class ForgotPasswordTwo extends StatefulWidget {
  const ForgotPasswordTwo({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordTwo> createState() => _ForgotPasswordTwoState();
}

class _ForgotPasswordTwoState extends State<ForgotPasswordTwo> {
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  void _createPassword() {
    // Add your password creation logic here
    Get.to(() =>  VerificationScreenPasswordResetClient());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const AuthHeader(
                  title: 'New Password',
                  subtitle:
                      'A code was sent to your email address. Please enter the code below',
                ),
                const SizedBox(height: 40),

                // New Password Field
                AuthTextField(
                  hint: 'New Password',
                  controller: _newPasswordController,
                  obscure: true,
                  keyboardType: TextInputType.visiblePassword,
                  showPasswordToggle: true,
                ),
                const SizedBox(height: 20),

                // Confirm Password Field
                AuthTextField(
                  hint: 'Confirm Password',
                  controller: _confirmPasswordController,
                  obscure: true,
                  keyboardType: TextInputType.visiblePassword,
                  showPasswordToggle: true,
                ),
                const SizedBox(height: 40),

                // Create Password Button
                SizedBox(
                  width: double.infinity,
                  child: PrimaryButton(
                    label: 'Create Password',
                    onPressed: _createPassword,
                  ),
                ),
                const SizedBox(height: 25),

                // Cancel Button
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(
                      color: Color(0xFF3A3A3A),
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
