import 'package:flutter/material.dart';
import '../widgets/auth_header.dart';
import '../widgets/auth_text_field.dart';
import '../widgets/social_button.dart';
import '../widgets/primary_button.dart';

class SignInScreenClient extends StatefulWidget {
  const SignInScreenClient({Key? key}) : super(key: key);

  @override
  State<SignInScreenClient> createState() => _SignInScreenClientState();
}

class _SignInScreenClientState extends State<SignInScreenClient> {
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
            mainAxisAlignment: MainAxisAlignment.center,
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
              AuthTextField(hint: 'Password', controller: _password, obscure: true, showPasswordToggle: true),
              const SizedBox(height: 12),
              Align(alignment: Alignment.centerRight, child: TextButton(onPressed: () {}, child: const Text('Forgot Password?'))),
              const SizedBox(height: 12),
              PrimaryButton(label: 'Sign In', onPressed: _signIn),
              const SizedBox(height: 12),

              TextButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const SignInScreenClient()),
                ),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Don\'t have an account? ',
                        style: TextStyle(
                          color: const Color(0xFF6E6E6E),
                        ),
                      ),
                      TextSpan(
                        text: 'Create Account',
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
              // TextButton(onPressed: () => Navigator.push(context,
              //     MaterialPageRoute(builder: (_) =>
              //     const      // TextButton(onPressed: () => Navigator.push(context,
              //     MaterialPageRoute(builder: (_) =>
              //     const      // TextButton(onPressed: () => Navigator.push(context,
              //     MaterialPageRoute(builder: (_) =>
              //     const SizedBox.shrink())), child: const Text('Don\'t have an account? Create Account'))
            ],
          ),
        ),
      ),
    );
  }
}
