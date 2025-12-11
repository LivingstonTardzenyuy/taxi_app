import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taxi_app/client_app/authentication/widgets/primary_button.dart';
import 'package:taxi_app/theme/colors.dart';

import '../widgets/driver_info.dart';
import '../widgets/payment.tab.dart';
import '../widgets/trip_details.dart';
import '../widgets/vehicle_info.dart';


class TripDetailsScreen extends StatefulWidget {
  const TripDetailsScreen({super.key});

  @override
  State<TripDetailsScreen> createState() => _TripDetailsScreenState();
}

class _TripDetailsScreenState extends State<TripDetailsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff3f7fa),
      appBar: AppBar(
        title: const Text("Trips"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // ---- NEW DEPARTURE BUTTON ----
            SizedBox(
              width: double.infinity,
              child: PrimaryButton(
                  label: "New Dispatch",
                  onPressed: () {

                  })
            ),
            const SizedBox(height: 16),

            // ---- TRIP CARD ----
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header row
                  Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xFFC0D7D8),
                    ),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              // crossAxisAlignment: CrossAxisAlignment.spac,
                              children: [
                                Text("JKE214D",
                                    style: GoogleFonts.poppins(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black
                                    )),
                                // Spacer(),
                                // Expanded(child: Text('.')),
                                const Text(
                                  "Assigned",
                                  style: TextStyle(color: Colors.green),
                                )
                              ],
                            ),
                            const SizedBox(height: 12),
                            Row(
                              children: const [
                                Icon(Icons.location_on,
                                    size: 16, color: Colors.black),
                                SizedBox(width: 4),
                                Text("Destiny City",
                                    style: TextStyle(color: Colors.black)),
                              ],
                            ),
                            const SizedBox(height: 12),

                            Row(
                              children: const [
                                Icon(Icons.home, size: 16, color: Colors.grey),
                                SizedBox(width: 4),
                                Text("Sit Nyoafe Town Lahtop",
                                    style: TextStyle(color: Colors.black)),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  TabBar(
                    controller: _tabController,
                    labelColor: AppColors.primaryColor,
                    unselectedLabelColor: Colors.grey,
                    indicatorColor: AppColors.primaryColor,
                    tabs: const [
                      Tab(text: "Trip-details"),
                      Tab(text: "Driver Info"),
                      Tab(text: "Vehicle"),
                      Tab(text: "Payment"),
                    ],
                  ),

                  const SizedBox(height: 20),

                  SizedBox(
                    height: 380,
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        TripDetailsTab(),
                        DriverInfoTab(),
                        VehicleInfoTab(),
                        PaymentTab(),                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20,
            ),
          ],
        ),
      ),
    );
  }

}
