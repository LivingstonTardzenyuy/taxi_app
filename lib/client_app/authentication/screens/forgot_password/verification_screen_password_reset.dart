import 'package:flutter/material.dart';
import 'package:taxi_app/client_app/authentication/screens/sign_in_client.dart';
import 'package:taxi_app/client_app/authentication/widgets/primary_button.dart';

class VerificationScreenPasswordResetClient extends StatefulWidget {
  const VerificationScreenPasswordResetClient({Key? key}) : super(key: key);

  @override
  State<VerificationScreenPasswordResetClient> createState() =>
      _VerificationScreenPasswordResetClientState();
}

class _VerificationScreenPasswordResetClientState
    extends State<VerificationScreenPasswordResetClient> {
  final List<TextEditingController> _fields =
      List.generate(5, (_) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(5, (_) => FocusNode());

  String get code => _fields.map((c) => c.text).join();

  void _verify() {
    // Handle verification logic here
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const SignInScreenClient()),
    );
  }

  void _resend() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Verification code resent')),
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
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF3A3A3A),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'A code was sent to your email address.\nPlease enter the code below',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[700],
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 40),

                  // OTP Fields (5 Boxes)
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
                            color: Color(0xFF3A3A3A),
                          ),
                          decoration: InputDecoration(
                            counterText: '',
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: Color(0xFFC7C7C7)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: Color(0xFFC7C7C7)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: Color(0xFF3A3A3A)),
                            ),
                          ),
                          onChanged: (value) {
                            if (value.isNotEmpty && i < 4) {
                              FocusScope.of(context)
                                  .requestFocus(_focusNodes[i + 1]);
                            } else if (value.isEmpty && i > 0) {
                              FocusScope.of(context)
                                  .requestFocus(_focusNodes[i - 1]);
                            }
                          },
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  // Resend Code Text
                  TextButton(
                    onPressed: _resend,
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: 'Did not receive code? ',
                            style: TextStyle(
                              color: Color(0xFF6E6E6E),
                              fontSize: 15,
                            ),
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

                  const SizedBox(height: 35),

                  // Verify Button
                  SizedBox(
                    width: double.infinity,
                    child: PrimaryButton(
                      label: 'Verify',
                      onPressed: _verify,
                    ),
                  ),

                  const SizedBox(height: 15),

                  // Back Button
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text(
                      'Back',
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
      ),
    );
  }
}
