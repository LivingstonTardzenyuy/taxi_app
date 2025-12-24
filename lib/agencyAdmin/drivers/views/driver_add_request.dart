import 'package:flutter/material.dart';
import 'package:taxi_app/theme/colors.dart';
import 'package:taxi_app/client_app/authentication/widgets/primary_button.dart';

class DriverAddRequestScreen extends StatelessWidget {
  const DriverAddRequestScreen({Key? key}) : super(key: key);

  // _infoPair removed — replaced by _label/_value/_twoColumnRow to match the provided design

  Widget _label(String text) => Text(text, style: const TextStyle(color: Colors.black54, fontSize: 13));
  Widget _value(String text) => Text(text, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 14));

  Widget _twoColumnRow(String leftLabel, String leftValue, String rightLabel, String rightValue) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Expanded(
        child: Row(
          children: [
            Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                _label(leftLabel),
                // const SizedBox(height: 6),
                _value(leftValue),
              ]),
            ),
            const SizedBox(width: 24),
            Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                _label(rightLabel),
                // const SizedBox(height: 6),
                _value(rightValue),
              ]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _docTile(String title, String asset) {
    return Container(
      height: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 130,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(image: AssetImage(asset), fit: BoxFit.cover),
            ),
          ),
          const SizedBox(height: 4),
          Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.6,
        leading: Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: IconButton(icon: const Icon(Icons.menu, color: Colors.black87), onPressed: () {}),
        ),
        centerTitle: true,
        title: const Text('New driver request', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w600)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 18),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            // Driver Details box matching the provided design
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
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    const SizedBox(height: 8),
                    _twoColumnRow('Name', 'Paul Axel', 'Email', 'Driver Email@Email.Com'),
                    _twoColumnRow('License Number', '592432frg4324', 'Date Of Birth', '12 Dec 2020'),
                    _twoColumnRow('Phone Number', '+145 687 9654', 'Experience Years', '14'),
                    const SizedBox(height: 16),
                    Container(height: 40, width: double.infinity, color: AppColors.primaryColor, child: Center(child: Text('BOOK RIDE', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600))))
                  ]),
                ),
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
            const SizedBox(height: 18),
            const Divider(),
            const SizedBox(height: 12),
            const Text('Driver Documents', style: TextStyle(fontWeight: FontWeight.w700)),
            const SizedBox(height: 12),

            // 2-up grid of large document cards
            GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 6,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              childAspectRatio: 1.4,
              children: [
                _docTile('License', 'assets/booking/booking.jpg'),
                _docTile('ID Card', 'assets/booking/booking.jpg'),
                _docTile('Bank', 'assets/booking/booking.jpg'),
                _docTile('NDA', 'assets/booking/booking.jpg'),
              ],
            ),

            const SizedBox(height: 18),
            Row(children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(backgroundColor: Colors.grey.shade300, foregroundColor: Colors.black87, padding: const EdgeInsets.symmetric(vertical: 14), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
                  child: const Text('Decline', style: TextStyle(fontWeight: FontWeight.w600)),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(child: PrimaryButton(label: 'Accept', onPressed: () {})),
            ])
          ]),
        ),
      ),
    );
  }
}
