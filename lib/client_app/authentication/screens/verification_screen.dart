import 'package:flutter/material.dart';
import '../controllers/auth_controller.dart';
import '../widgets/primary_button.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({Key? key}) : super(key: key);

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final AuthController _ctrl = AuthController();
  final List<TextEditingController> _fields = List.generate(4, (_) => TextEditingController());

  String get code => _fields.map((c) => c.text).join();

  void _verify() async {
    final ok = await _ctrl.verifyOtp(code);
    if (ok) Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const SizedBox.shrink()));
    else ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Invalid code')));
  }

  void _resend() {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Code resent')));
  }

  @override
  Widget build(BuildContext context) {
  // final email = ModalRoute.of(context)?.settings.arguments as String? ?? '';
    return Scaffold(
      appBar: AppBar(title: const Text('Verification Code'), backgroundColor: Colors.transparent, elevation: 0),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Text('A code was sent to your email address. Please enter the code below'),
              const SizedBox(height: 20),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: List.generate(4, (i) => SizedBox(width: 50, child: TextField(controller: _fields[i], textAlign: TextAlign.center, keyboardType: TextInputType.number)))),
              const SizedBox(height: 20),
              PrimaryButton(label: 'Verify', onPressed: _verify),
              TextButton(onPressed: _resend, child: const Text('Did not receive code? Resend code')),
              TextButton(onPressed: () => Navigator.pop(context), child: const Text('Back')),
            ],
          ),
        ),
      ),
    );
  }
}
