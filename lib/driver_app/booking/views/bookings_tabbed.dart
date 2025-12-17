import 'package:flutter/material.dart';
import 'package:taxi_app/theme/colors.dart';
import 'bookings_active.dart';
import 'bookings_completed.dart';
import 'bookings_cancelled.dart';

class BookingsTabbedPage extends StatefulWidget {
  const BookingsTabbedPage({Key? key}) : super(key: key);

  @override
  State<BookingsTabbedPage> createState() => _BookingsTabbedPageState();
}

class _BookingsTabbedPageState extends State<BookingsTabbedPage> with SingleTickerProviderStateMixin {
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

  Widget _vehicleSegment() {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8), decoration: BoxDecoration(color: const Color(0xFFF7F7F7), borderRadius: BorderRadius.circular(20)), child: const Text('Bus')),
        const SizedBox(width: 12),
        Container(padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)), child: const Text('Taxi')),
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
        title: const Text('Bookings', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w600)),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(84),
          child: Column(children: [
            Padding(padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8), child: _vehicleSegment()),
            TabBar(
              controller: _tabController,
              indicatorColor: AppColors.primaryColor,
              labelColor: Colors.black87,
              unselectedLabelColor: Colors.black54,
              tabs: const [Tab(text: 'Active'), Tab(text: 'Completed'), Tab(text: 'Cancelled')],
            ),
          ]),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          BookingsActiveScreen(),
          BookingsCompletedScreen(),
          BookingsCancelledScreen(),
        ],
      ),
    );
  }
}
