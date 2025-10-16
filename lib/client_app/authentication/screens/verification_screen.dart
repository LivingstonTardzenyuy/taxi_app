import 'package:flutter/material.dart';
import 'package:taxi_app/client_app/authentication/screens/sign_in_client.dart';
import '../controllers/auth_controller.dart';
import '../widgets/primary_button.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({Key? key}) : super(key: key);

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final AuthController _ctrl = AuthController();

  // 5 boxes instead of 4
  final List<TextEditingController> _fields =
  List.generate(5, (_) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(5, (_) => FocusNode());

  String get code => _fields.map((c) => c.text).join();

  void _verify() async {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const SignInScreenClient()),
    );
  }

  void _resend() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Code resent')),
    );
  }

  @override
  void dispose() {
    for (final c in _fields) {
      c.dispose();
    }
    for (final f in _focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Verification Code',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'A code was sent to your email address.\nPlease enter the code below',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                  ),
                  const SizedBox(height: 40),

                  // OTP fields
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                      5,
                          (i) => SizedBox(
                        width: 50,
                        height: 55,
                        child: TextField(
                          controller: _fields[i],
                          focusNode: _focusNodes[i],
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          maxLength: 1,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          decoration: InputDecoration(
                            counterText: '',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onChanged: (value) {
                            if (value.isNotEmpty && i < 4) {
                              // move to next box
                              FocusScope.of(context)
                                  .requestFocus(_focusNodes[i + 1]);
                            } else if (value.isEmpty && i > 0) {
                              // move back if deleted
                              FocusScope.of(context)
                                  .requestFocus(_focusNodes[i - 1]);
                            }
                          },
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),
                  TextButton(
                    onPressed: _resend,
                    child: RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: 'Did not receive code? ',
                            style: TextStyle(color: Color(0xFF6E6E6E)),
                          ),
                          TextSpan(
                            text: 'Resend code',
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

                  const SizedBox(height: 40),
                  SizedBox(
                    width: double.infinity,
                    child: PrimaryButton(
                      label: 'Verify',
                      onPressed: _verify,
                    ),
                  ),
                  const SizedBox(height: 8),
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
      ),
    );
  }
}
