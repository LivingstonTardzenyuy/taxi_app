import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taxi_app/agencyAdmin/dispatches/dispatches/views/assigned_trip.dart';
import 'package:taxi_app/client_app/features/bookings/booking.dart';

import '../booking/views/booking.dart';

class AdminDrawer extends StatelessWidget {
  final String activePage;

  const AdminDrawer({
    super.key,
    this.activePage = "Dashboard",
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      child: Container(
        color: Colors.white,
        child: Row(
          children: [
            // LEFT MENU
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 10,
                  children: [
                    const SizedBox(height: 50,),
                    _menuItem(
                      icon: Icons.dashboard,
                      title: "Dashboard",
                      isActive: activePage == "Dashboard",
                      onTap: () {

                      }
                    ),
                    _menuItem(
                      icon: Icons.book_online_outlined,
                      title: "Bookings",
                      isActive: activePage == "Bookings",
                        onTap: () {
                          Get.to(AdminBookingsScreen());

                        }
                    ),
                    _menuItem(
                      icon: Icons.badge_outlined,
                      title: "Dispatchers",
                      isActive: activePage == "Dispatchers",
                        onTap: () {
                          Get.to(TripDetailsScreen());
                        }
                    ),
                    _menuItem(
                      icon: Icons.groups_outlined,
                      title: "Travelers",
                      isActive: activePage == "Travelers",
                        onTap: () {

                        }
                    ),
                    _menuItem(
                      icon: Icons.directions_bus_outlined,
                      title: "Drivers",
                      isActive: activePage == "Drivers",
                        onTap: () {

                        }
                    ),
                    _menuItem(
                      icon: Icons.request_page_outlined,
                      title: "Request",
                      isActive: activePage == "Request",
                        onTap: () {

                        }
                    ),
                    _menuItem(
                      icon: Icons.headphones_outlined,
                      title: "Reports",
                      isActive: activePage == "Reports",
                        onTap: () {

                        }
                    ),
                    _menuItem(
                      icon: Icons.map_outlined,
                      title: "Tracking Bookings",
                      isActive: activePage == "Tracking Bookings",
                        onTap: () {
                          Get.to(BookingScreen());
                        }
                    ),
                    _menuItem(
                      icon: Icons.local_fire_department_outlined,
                      title: "Price model",
                      isActive: activePage == "Price model",
                        onTap: () {

                        }
                    ),
                    _menuItem(
                      icon: Icons.chat_bubble_outline,
                      title: "Feedback",
                      isActive: activePage == "Feedback",
                        onTap: () {

                        }
                    ),
                    _menuItem(
                      icon: Icons.account_balance_wallet_outlined,
                      title: "Payments",
                      isActive: activePage == "Payments",
                        onTap: () {

                        }
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),

            // RIGHT DIVIDER (like screenshot)
            Container(
              width: 1,
              color: Colors.grey.shade300,
            ),
          ],
        ),
      ),
    );
  }

  Widget _menuItem({
    required IconData icon,
    required String title,
    required Function() onTap,
    bool isActive = false,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
        child: Row(
          children: [
            Icon(
              icon,
              size: 22,
              color: isActive ? const Color(0xFF0F6F6A) : Colors.grey[700],
            ),
            const SizedBox(width: 14),
            Text(
              title,
              style: TextStyle(
                fontSize: 15,
                fontWeight: isActive ? FontWeight.bold : FontWeight.w400,
                color: isActive ? const Color(0xFF0F6F6A) : Colors.grey[800],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
