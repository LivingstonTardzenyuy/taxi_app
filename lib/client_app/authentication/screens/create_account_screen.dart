import 'package:flutter/material.dart';
import 'package:taxi_app/client_app/authentication/screens/sign_in_client.dart';
import '../controllers/auth_controller.dart';
import '../widgets/auth_header.dart';
import '../widgets/auth_text_field.dart';
import '../widgets/primary_button.dart';
import '../widgets/social_button.dart';
import '../widgets/terms_checkbox.dart';
import 'verification_screen.dart';
// import 'sign_in_screen.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({Key? key}) : super(key: key);

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final AuthController _ctrl = AuthController();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool _accepted = false;

  void _signUp() {
    final nameErr = _ctrl.validateName(_name.text);
    final emailErr = _ctrl.validateEmail(_email.text);
    final passErr = _ctrl.validatePassword(_password.text);
    if (nameErr == null && emailErr == null && passErr == null && _accepted) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => const VerificationScreen(), settings: RouteSettings(arguments: _email.text)));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please complete all fields and accept terms')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 80),
                const AuthHeader(title: 'Create Account', subtitle: 'Hey there! Ready to book your ride'),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SocialButton(label: 'Google', onPressed: () {}),
                    SocialButton(label: 'Facebook', onPressed: () {}),
                  ],
                ),
                const SizedBox(height: 20),
                AuthTextField(hint: 'Names', controller: _name),
                const SizedBox(height: 12),
                AuthTextField(hint: 'Email Address', controller: _email, keyboardType: TextInputType.emailAddress),
                const SizedBox(height: 12),
                AuthTextField(hint: 'Password', controller: _password, obscure: true, showPasswordToggle: true),
                const SizedBox(height: 8),
                TermsCheckbox(value: _accepted, onChanged: (v) => setState(() => _accepted = v ?? false)),
                const SizedBox(height: 12),
                Container(
                  width: double.infinity,
                  child:PrimaryButton(label: 'Sign Up', onPressed: _signUp),

                ),
                const SizedBox(height: 24),
                TextButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const SignInScreenClient()),
                  ),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Already have an account? ',
                          style: TextStyle(
                            color: const Color(0xFF6E6E6E),
                          ),
                        ),
                        TextSpan(
                          text: 'Sign in',
                          style: TextStyle(
                            color: const Color(0xFF3A3A3A),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
