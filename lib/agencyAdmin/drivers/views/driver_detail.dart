import 'package:flutter/material.dart';
// Removed duplicate import
import 'package:taxi_app/theme/colors.dart';

class DriverDetailScreen extends StatelessWidget {
  const DriverDetailScreen({Key? key}) : super(key: key);

  Widget _label(String text) => Text(text, style: const TextStyle(color: Colors.black54, fontSize: 13));
  Widget _value(String text) => Text(text, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 14));

  Widget _twoColumnRow(String leftLabel, String leftValue, String rightLabel, String rightValue) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              _label(leftLabel),
              const SizedBox(height: 6),
              _value(leftValue),
            ]),
          ),
          const SizedBox(width: 24),
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              _label(rightLabel),
              const SizedBox(height: 6),
              _value(rightValue),
            ]),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // keep app bar minimal so page context remains; main content below will match attachment
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.6,
        leading: IconButton(icon: const Icon(Icons.arrow_back, color: Colors.black87), onPressed: () => Navigator.maybePop(context)),
        centerTitle: true,
        title: const Text('Drivers', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w600)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            // Outer blue bordered box that contains the driver details and heading
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.primaryColor, width: 2),
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.white,
                  ),
                  padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 8),
                      // content area: two-column rows
                      _twoColumnRow('Name', 'Paul Axel', 'Email', 'Driver Email@Email.Com'),
                      _twoColumnRow('License Number', '592432frg4324', 'Date Of Birth', '12 Dec 2020'),
                      _twoColumnRow('Phone Number', '+145 687 9654', 'Experience Years', '14'),
                      const SizedBox(height: 16),
                      // bottom blue bar (as shown in the attachment) — render as a full-width blue strip
                      Container(height: 40, width: double.infinity, color: AppColors.primaryColor, child: Center(child: Text('BOOK RIDE', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600))))
                    ],
                  ),
                ),
                // Title overlapping the top border (small white background to mimic screenshot)
                Positioned(
                  left: 12,
                  top: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    color: Colors.white,
                    child: Text('Driver Details', style: TextStyle(color: AppColors.primaryColor, fontWeight: FontWeight.w700)),
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
