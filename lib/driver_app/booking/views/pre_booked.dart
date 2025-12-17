import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:taxi_app/driver_app/booking/views/bookings_active.dart';
import 'cancel_booking.dart';
import 'package:taxi_app/theme/colors.dart';
import 'package:taxi_app/client_app/authentication/widgets/primary_button.dart';

import 'bookings_cancelled.dart';
import 'bookings_completed.dart';
import 'bookings_tabbed.dart';

class PreBookedScreen extends StatefulWidget {
  const PreBookedScreen({Key? key}) : super(key: key);

  @override
  State<PreBookedScreen> createState() => _PreBookedScreenState();
}

class _PreBookedScreenState extends State<PreBookedScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget _infoRow(IconData icon, String text) {
    return Row(children: [Icon(icon, size: 16, color: AppColors.primaryColor), const SizedBox(width: 8), Text(text, style: const TextStyle(color: Colors.black87))]);
  }

  Widget _locations() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        ListTile(leading: Icon(Icons.radio_button_checked, color: AppColors.primaryColor), title: Text('Reding Town Last Town')),
        ListTile(leading: Icon(Icons.location_on, color: Colors.black54), title: Text('Manroe Platoon Street')),
      ],
    );
  }

  Widget _card(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 40),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8), border: Border.all(color: const Color(0xFFECECEC))),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          Image.asset("assets/images/img.png"),
          const SizedBox(width: 12),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [Text('Kendrick Anne', style: TextStyle(fontWeight: FontWeight.w700)), SizedBox(height: 4), Text('CRN: #Oioie837', style: TextStyle(color: Colors.black54, fontSize: 12))])),
        ]),
        const SizedBox(height: 24),
        Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          _infoRow(Icons.place, '5.2km'),
          const SizedBox(width: 12),
          _infoRow(Icons.access_time, '55 Mins'),
          const SizedBox(width: 12),
          _infoRow(Icons.monetization_on, '\$20'),
        ]),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Date And Time:', style: TextStyle(color: Colors.black54, fontSize: 12)),
            const SizedBox(height: 4),
            const Text('12/12/12 | 13:00', style: TextStyle(fontWeight: FontWeight.w600)),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Ride Type:', style: TextStyle(color: Colors.black54, fontSize: 12)),
            const SizedBox(height: 4),
            Container(padding: const EdgeInsets.all(8), decoration: BoxDecoration(color: const Color(0xFFF7F7F7), borderRadius: BorderRadius.circular(6)), child: const Text('Shared')),
          ],
        ),
        const SizedBox(height: 12),
        _locations(),
        const SizedBox(height: 12),
        Center(child: Image.asset("assets/images/img.png")),
        const SizedBox(height: 12),

        Container(
            width: double.infinity,
            child: PrimaryButton(
                label: 'Cancel Ride',
                onPressed: () {
                  // navigate to cancel booking screen
                  Get.to(const CancelBookingScreen());
                }
            )),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black87),
        title: const Text('Pre booked', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w600)),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(84),
          child: Column(children: [
            Padding(padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8), child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(color: const Color(0xFFE8E8E8), borderRadius: BorderRadius.circular(8)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8), child: const Text('Bus')),
                  const SizedBox(width: 12),
                  Container(padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8), child: const Text('Taxi')),
                ],
              ),
            )),
            TabBar(controller: _tabController, indicatorColor: AppColors.primaryColor, labelColor: Colors.black87, unselectedLabelColor: Colors.black54, tabs: const [Tab(text: 'Active'), Tab(text: 'Completed'), Tab(text: 'Cancelled')]),
          ]),
        ),
      ),
      body: TabBarView(controller: _tabController, children: [
        SingleChildScrollView(padding: const EdgeInsets.all(16), child: _card(context)),
        const BookingsCompletedScreen(),
        const BookingsCancelledScreen(),
      ]),
    );
  }
}
