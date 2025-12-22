import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taxi_app/client_app/bus_healer/views/departure_town.dart';
import 'package:taxi_app/client_app/features/bookings/views/searching_ride_screen.dart';
import 'package:taxi_app/client_app/features/home/views/pick_up.dart';
import 'package:taxi_app/driver_app/payment/views/payment_methods.dart';
import 'package:taxi_app/theme/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedOption = "taxi"; // default selected
  bool isBalanceVisible = true; // Track whether balance is visible
  double walletBalance = 1250.50; // Example wallet balance

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/booking/booking.jpg',
              fit: BoxFit.cover,
            ),
          ),

          // Wallet container
          Positioned(
            top: 135,
            left: 16,  // Add left padding
            right: 16, // Add right padding
            child: Column(
              children: [
                Container(
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        // Wallet Icon
                        Container(
                          padding: const EdgeInsets.all(12),
                          // decoration: BoxDecoration(
                          //   color: AppColors.primaryColor.withOpacity(0.1),
                          //   borderRadius: BorderRadius.circular(12),
                          // ),
                          child: Icon(
                            Icons.wallet_outlined,
                            size: 32,
                            color: Colors.black,
                          ),
                        ),

                        const SizedBox(width: 16),

                        // Balance information
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Balance',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[600],
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  Text(
                                    isBalanceVisible ? '\$$walletBalance' : '******',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.primaryColor,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isBalanceVisible = !isBalanceVisible;
                                      });
                                    },
                                    child: Icon(
                                      isBalanceVisible ? Icons.visibility : Icons.visibility_off,
                                      size: 20,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        // Add money button
                        InkWell(
                          onTap: () {
                            Get.to(PaymentMethodsScreen());
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color(0xFF226E73),
                            ),
                            height: 30, width: 30,
                            child: Icon(Icons.add,
                                color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 35,),
                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,

                  ),
                  child: Row(
                    children: [
                      Icon(Icons.local_hospital),
                      const SizedBox(width: 8,),
                      Text(
                        "Current Location",
                        style: TextStyle(
                        ),
                      ),
                      Spacer(),
                      Icon(Icons.calendar_month, color: Colors.black,)
                    ],
                  ),
                ),
                const SizedBox(height: 50,),
                TextButton(
                    onPressed: () {
                      Get.to(DepartureTownScreen());
                    },
                    child: Text(
                      "Travelling",
                      style: TextStyle(
                          fontSize: 18, color: Colors.black

                      ),
                    )
                )
              ],
            ),
          ),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () => Get.back(),
                  ),
                ],
              ),
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 15),
                  Text(
                    "Where to?",
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                  ),

                  const SizedBox(height: 35),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedOption = "taxi";
                            Get.to(PickUpScreen());
                          });
                        },
                        child: _buildVehicleOption(
                          title: 'BOOK A TAXI',
                          subTitle: 'Inter City',
                          icon: Icons.local_taxi,
                          isSelected: selectedOption == "taxi",
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedOption = "bus";
                          });
                        },
                        child: _buildVehicleOption(
                          title: 'BOOK A BUS',
                          subTitle: 'Long Distance',
                          icon: Icons.directions_bus,
                          isSelected: selectedOption == "bus",
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVehicleOption({
    required String title,
    required String subTitle,
    required IconData icon,
    required bool isSelected,
  }) {
    return Container(
      width: 150,
      height: 205,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(
          color: isSelected ? const Color(0xFF226E73) : Colors.grey.shade300,
        ),
        borderRadius: BorderRadius.circular(12),
        color: isSelected ? const Color(0xFF226E73) : Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(
            icon,
            size: 80,
            color: isSelected ? Colors.white : AppColors.primaryColor,
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: isSelected ? Colors.white : AppColors.primaryColor,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subTitle,
            style: TextStyle(
              fontSize: 11,
              color: isSelected ? Colors.white : AppColors.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}