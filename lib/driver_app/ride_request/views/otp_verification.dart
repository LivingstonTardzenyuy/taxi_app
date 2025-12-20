import 'package:flutter/material.dart';
import 'package:taxi_app/theme/colors.dart';
import 'package:taxi_app/client_app/authentication/widgets/primary_button.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({Key? key}) : super(key: key);

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final List<TextEditingController> _controllers = List.generate(4, (_) => TextEditingController());

  @override
  void dispose() {
    for (var c in _controllers) {
      c.dispose();
    }
    super.dispose();
  }

  Widget _otpField(int index) {
    return SizedBox(
      width: 56,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: TextField(
          controller: _controllers[index],
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          maxLength: 1,
          decoration: InputDecoration(
            counterText: '',
            contentPadding: const EdgeInsets.all(12), // Padding for all sides
            border: OutlineInputBorder(), // Optional: Adds a border
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.primaryColor), // Change color if needed
            ),
          ),
          onChanged: (v) {
            if (v.isNotEmpty && index < 3) {
              FocusScope.of(context).nextFocus();
            }
            if (v.isEmpty && index > 0) {
              FocusScope.of(context).previousFocus();
            }
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('OTP Verification'),
      //   backgroundColor: Colors.white,
      //   elevation: 0,
      //   centerTitle: true,
      //   iconTheme: const IconThemeData(color: Colors.black87),
      // ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 25),
        child: Column(
          children: [
            const SizedBox(height: 220),
            const Text('Enter OTP from rider',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600)),
            const SizedBox(height: 12),
            const Text(
                'We sent a PIN to your customer’s mobile number' ,
                style: TextStyle(color: Colors.black, fontSize: 14),
                textAlign: TextAlign.center, ),
            const SizedBox(height: 84),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: List.generate(4, (i) => _otpField(i))),
            const SizedBox(height: 75),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Did not recieve code?"),
                TextButton(onPressed: () {}, child: const Text('Resend code', style: TextStyle(color: AppColors.primaryColor))),
              ],
            ),
            const SizedBox(height: 15,),
            SizedBox(width: double.infinity, child: PrimaryButton(label: 'Verify And Start Ride', onPressed: () { Navigator.of(context).popUntil((route) => route.isFirst); })),
            const SizedBox(height: 42),
            TextButton(onPressed: () {}, child: const Text('Cancel', style: TextStyle(color: AppColors.primaryColor))),
          ],
        ),
      ),
    );
  }
}
