import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:taxi_app/agencyAdmin/drivers/views/driver_add_request.dart';
import 'package:taxi_app/theme/colors.dart';

class DriverDetailScreen extends StatelessWidget {
  const DriverDetailScreen({Key? key}) : super(key: key);

  Widget _labelValue(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Icon(icon, color: Colors.grey.shade600, size: 18),
        const SizedBox(width: 8),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(label, style: const TextStyle(color: Colors.black54)), const SizedBox(height: 4), Text(value, style: const TextStyle(fontWeight: FontWeight.w600))])),
      ]),
    );
  }

  Widget _docTile(String title, String asset) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.grey.shade100, image: DecorationImage(image: AssetImage(asset), fit: BoxFit.cover)),
      height: 160,
      width: double.infinity,
      child: InkWell(
        onTap: () {
          Get.to(DriverAddRequestScreen());
        },
        child: Stack(
          children: [
            Positioned.fill(child: Container()),
            Positioned(
              left: 8,
              top: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(color: Colors.white.withOpacity(0.8), borderRadius: BorderRadius.circular(6)),
                child: Text(title, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.6,
        leading: Padding(padding: const EdgeInsets.only(left: 12.0), child: IconButton(icon: const Icon(Icons.menu, color: Colors.black87), onPressed: () {})),
        centerTitle: true,
        title: const Text('Drivers', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w600)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(children: [
              CircleAvatar(radius: 28, backgroundColor: AppColors.onboardingColor, child: const Icon(Icons.person, color: Colors.white, size: 34)),
              const SizedBox(width: 12),
              Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                            children:  [
                              Text('Kendrick Anne',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700
                                  )),
                              SizedBox(width: 8),
                              Spacer(),
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color(0xFFDEFDFF),

                                ),
                                child: Text('ACTIVE', style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600)),
                              )
                            ]),
                        const SizedBox(height: 6), Row(children: const [Icon(Icons.star, color: Colors.orange, size: 14), SizedBox(width: 6), Text('(923 Reviews)', style: TextStyle(color: Colors.black54))])])),
            ]),

            const SizedBox(height: 12),

            // details
            _labelValue(Icons.badge_outlined, 'Driver ID', 'WES876'),
            _labelValue(Icons.phone, 'Phone Number', '+168 123 5566'),
            _labelValue(Icons.email_outlined, 'Email', 'Email.Com'),
            _labelValue(Icons.alt_route, 'Route', 'Aston City <-> Ashton Valley Bay'),
            _labelValue(Icons.calendar_today_outlined, 'Register Date', '10 Dec 2025 13:56'),

            const SizedBox(height: 12),
            const Divider(),
            const SizedBox(height: 12),
            const Text('Document Details', style: TextStyle(fontWeight: FontWeight.w700)),
            const SizedBox(height: 12),

            // Grid with 2 items per row, each item is a large card
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: (1 / 0.6),
              children: [
                _docTile('Bank Details', 'assets/booking/booking.jpg'),
                _docTile('Profile Photo', 'assets/images/img.png'),
                _docTile('Driver License', 'assets/booking/booking.jpg'),
                _docTile('Card', 'assets/booking/booking.jpg'),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
