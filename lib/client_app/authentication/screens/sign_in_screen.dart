import 'package:flutter/material.dart';
import '../widgets/auth_header.dart';
import '../widgets/auth_text_field.dart';
import '../widgets/social_button.dart';
import '../widgets/primary_button.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  void _signIn() {
    Navigator.pushReplacementNamed(context, '/');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 12),
              const AuthHeader(title: 'Sign In', subtitle: 'Hey there! Ready to book your ride'),
              const SizedBox(height: 20),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                SocialButton(label: 'Google', onPressed: () {}),
                SocialButton(label: 'Facebook', onPressed: () {}),
              ]),
              const SizedBox(height: 20),
              AuthTextField(hint: 'Email Address', controller: _email, keyboardType: TextInputType.emailAddress),
              const SizedBox(height: 12),
              AuthTextField(hint: 'Password', controller: _password, obscure: true),
              const SizedBox(height: 12),
              Align(alignment: Alignment.centerRight, child: TextButton(onPressed: () {}, child: const Text('Forgot Password?'))),
              const SizedBox(height: 12),
              PrimaryButton(label: 'Sign In', onPressed: _signIn),
              const SizedBox(height: 12),
              TextButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const SizedBox.shrink())), child: const Text('Don\'t have an account? Create Account'))
            ],
          ),
        ),
      ),
    );
  }
}
