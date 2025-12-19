import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taxi_app/client_app/authentication/widgets/primary_button.dart';
import 'package:taxi_app/theme/colors.dart';

class CancelBookingScreen extends StatefulWidget {
  const CancelBookingScreen({Key? key}) : super(key: key);

  @override
  State<CancelBookingScreen> createState() => _CancelBookingScreenState();
}

class _CancelBookingScreenState extends State<CancelBookingScreen> {
  final List<String> _options = [
    'Rider Not Available',
    'Rider Wants To Book Another Cab',
    'Rider Misbehave',
    'Taxi Breakdown',
    'Puncture',
    'Other',
  ];
  int _selected = -1;
  final TextEditingController _otherCtrl = TextEditingController();

  void _showSuccessSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) {
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.5,
          minChildSize: 0.3,
          maxChildSize: 0.8,
          builder: (_, controller) => Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
            ),
            child: Column(
              children: [
                Container(width: 40, height: 6, decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(4))),
                const SizedBox(height: 18),
                // simple illustration
                Container(
                    height: 150, width: 150,
                    child: Image.asset("assets/onboarding/onboarding_four.png")),
                const SizedBox(height: 8),
                const Text('Booking Canceled Successfully', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                const SizedBox(height: 8),
                const Text('Your booking with CRN #9489wu9 has been canceled successfully', textAlign: TextAlign.center, style: TextStyle(color: Colors.black54)),
                // const Spacer(),
                const SizedBox(height: 48),

                SizedBox(
                  width: double.infinity,
                  child: PrimaryButton(
                    label: 'Done',
                    onPressed: () {
                      // close sheet and screen
                      Navigator.of(context).pop();
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _otherCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black87),
        title: const Text('Cancel taxi booking', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w600)),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              const Text('Please select the reason for cancelling', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
              const SizedBox(height: 12),
              Expanded(
                child: ListView.builder(
                  itemCount: _options.length,
                  itemBuilder: (context, index) {
                    final option = _options[index];
                    return RadioListTile<int>(
                      value: index,
                      groupValue: _selected,
                      onChanged: (v) => setState(() => _selected = v ?? -1),
                      title: Text(option),
                      activeColor: AppColors.primaryColor,
                    );
                  },
                ),
              ),
              if (_selected == _options.length - 1) ...[
                const Text('Other', style: TextStyle(fontWeight: FontWeight.w600)),
                const SizedBox(height: 8),
                Container(
                  height: 100,
                  decoration: BoxDecoration(border: Border.all(color: const Color(0xFFECECEC)), borderRadius: BorderRadius.circular(8)),
                  padding: const EdgeInsets.all(8),
                  child: TextField(
                    controller: _otherCtrl,
                    maxLines: null,
                    decoration: const InputDecoration(border: InputBorder.none, hintText: 'Placeholder'),
                  ),
                ),
                const SizedBox(height: 12),
              ],
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 30.0),
                  child: PrimaryButton(
                    label: 'Cancel Ride',
                    onPressed: () {
                      // validate selection
                      if (_selected == -1) {
                        Get.snackbar('Select reason', 'Please select a reason for cancelling', backgroundColor: Colors.white);
                        return;
                      }
                      _showSuccessSheet();
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
