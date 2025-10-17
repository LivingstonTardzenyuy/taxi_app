import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/route_manager.dart';
import 'package:taxi_app/client_app/authentication/screens/forgot_password/forgot_password_two.dart';
import 'package:taxi_app/client_app/authentication/screens/notification_enabled.dart';
import 'package:taxi_app/client_app/authentication/screens/sign_in_client.dart';
import 'package:taxi_app/client_app/authentication/widgets/auth_header.dart';
import 'package:taxi_app/client_app/authentication/widgets/auth_text_field.dart';
import 'package:taxi_app/client_app/authentication/widgets/primary_button.dart';

class ForgotPasswordOne extends StatefulWidget {
  const ForgotPasswordOne({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordOne> createState() => _ForgotPasswordOneState();
}

class _ForgotPasswordOneState extends State<ForgotPasswordOne> {
  final TextEditingController _email = TextEditingController();

  void _forgotPasswordOne() {
    Get.to(() => const ForgotPasswordTwo());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center, // centers vertically
              children: [
                const SizedBox(height: 60),
                const Center(
                  child: AuthHeader(
                  title: 'Forgot Password',
                  subtitle: 'A code was sent to your email address. Please enter the code below',
                ),
                ),
                const SizedBox(height: 30),
                AuthTextField(
                  hint: 'Email Address',
                  controller: _email,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 20),

                TextButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const SignInScreenClient(),
                    ),
                  ),
                  child: RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: 'Did not recieve code? ',
                          style: TextStyle(
                            color: Color(0xFF6E6E6E),
                          ),
                        ),
                        TextSpan(
                          text: 'Resend Code',
                          style: TextStyle(
                            color: Color(0xFF3A3A3A),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                  const SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  child: PrimaryButton(
                    label: 'Continue',
                    onPressed: _forgotPasswordOne,
                  ),
                ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    'Back',
                    style: TextStyle(color: Color(0xFF3A3A3A)),
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
