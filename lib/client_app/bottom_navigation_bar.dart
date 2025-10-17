import 'package:flutter/material.dart';
import 'package:taxi_app/client_app/features/bookings/booking.dart';
import 'package:taxi_app/client_app/features/chat/chat.dart';
import 'package:taxi_app/client_app/features/home/home.dart';
import 'package:taxi_app/client_app/features/profile/profile.dart';
import 'package:taxi_app/client_app/features/saved_places/saved_places.dart';
import 'package:taxi_app/theme/colors.dart';

class ClientBottomNavigationBar extends StatefulWidget {
  const ClientBottomNavigationBar({Key? key}) : super(key: key);

  @override
  State<ClientBottomNavigationBar> createState() => _ClientBottomNavigationBarState();
}

class _ClientBottomNavigationBarState extends State<ClientBottomNavigationBar> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const BookingScreen(),
    const ChatScreen(),
    const SavedPlacesScreen(),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today_outlined),
            label: 'Bookings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on_outlined),
            label: 'Saved Places',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
