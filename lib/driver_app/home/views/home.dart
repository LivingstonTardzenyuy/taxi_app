import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:taxi_app/client_app/authentication/widgets/primary_button.dart';
import 'package:taxi_app/driver_app/booking/views/earning.dart';
import 'package:taxi_app/theme/colors.dart';

import '../../booking/views/bookings.dart';
import '../../driver_profile/views/profile.dart';
import '../../emergency_alert/views/sos_emergency.dart';
import '../../ride_request/views/ride_request.dart';

class DriverHomeScreen extends StatelessWidget {
	const DriverHomeScreen({Key? key}) : super(key: key);

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

					// Dark overlay to improve contrast
					Positioned.fill(
						child: Container(color: Colors.black.withOpacity(0.15)),
					),

					SafeArea(
						child: Padding(
							padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
							child: Column(
								crossAxisAlignment: CrossAxisAlignment.start,
								children: [
									// Top row: profile icon and toggles
									Row(
										children: [
											Container(
												width: 44,
												height: 44,
												decoration: BoxDecoration(
													color: Colors.white.withOpacity(0.9),
													shape: BoxShape.circle,
												),
												child: IconButton(
														onPressed: () {
															Get.to(DriverProfileMenu());
														},
														icon: Icon(Icons.person_outline, color: Colors.black54),
												)
											),
											const Spacer(),
											Row(
												children: [
													_buildToggle('Shared', active: true),
													const SizedBox(width: 8),
													_buildToggle('Online', active: true),
												],
											),
										],
									),

									const SizedBox(height: 18),

									// Info cards
									Row(
										children: [
											Expanded(child: _infoCard(title: 'Pre Booked', value: '3', icon: Icons.calendar_today)),
											const SizedBox(width: 12),
											Expanded(child: _infoCard(title: 'Earned Today', value: '\$230', icon: Icons.account_balance_wallet)),
										],
									),
									TextButton(
											onPressed: () {
												Get.to(DriverEarningScreen());
											},
											child: Text(
													"Booking Section",
												style: TextStyle(
													fontSize: 26,
												),
											)
									),
									const SizedBox(height: 16,),
									TextButton(
											onPressed: () {
												Get.to(SosEmergencyScreen());
											},
											child: Text(
													"Emergency Section",
												style: TextStyle(
													fontSize: 26,
												),
											)
									),
									const SizedBox(height: 16,),
									TextButton(
											onPressed: () {
												Get.to(RideRequestScreen());
											},
											child: Text(
													"Ride Request Section",
												style: TextStyle(
													fontSize: 26,
												),
											)
									),
									// Expand to push button to bottom
									const Expanded(child: SizedBox()),

									// Bottom action
									Padding(
										padding: const EdgeInsets.only(bottom: 12.0),
										child: SizedBox(
											width: double.infinity,
											height: 56,
											child: PrimaryButton(
												label: 'Finding Jobs',
												color: AppColors.primaryColor,
												onPressed: () {
													// TODO: Toggle searching state
												},
											),
										),
									),
								],
							),
						),
					),
				],
			),
		);
	}

	Widget _infoCard({required String title, required String value, required IconData icon}) {
		return Container(
			padding: const EdgeInsets.all(12),
			decoration: BoxDecoration(
				color: Colors.white.withOpacity(0.9),
				borderRadius: BorderRadius.circular(8),
			),
			child: Row(
				children: [
					Container(
						padding: const EdgeInsets.all(8),
						decoration: BoxDecoration(color: AppColors.primaryColor, borderRadius: BorderRadius.circular(8)),
						child: Icon(icon, color: Colors.white, size: 18),
					),
					const SizedBox(width: 12),
					Column(
						crossAxisAlignment: CrossAxisAlignment.start,
						children: [
							Text(title, style: const TextStyle(fontSize: 12, color: Colors.black54)),
							const SizedBox(height: 6),
							Text(value, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
						],
					)
				],
			),
		);
	}

	Widget _buildToggle(String label, {bool active = false}) {
		return Container(
			padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
			decoration: BoxDecoration(
				color: active ? Colors.white.withOpacity(0.95) : Colors.white.withOpacity(0.7),
				borderRadius: BorderRadius.circular(20),
			),
			child: Row(
				children: [
					Text(label, style: const TextStyle(fontSize: 12, color: Colors.black87)),
					const SizedBox(width: 6),
					Container(
						width: 14,
						height: 14,
						decoration: BoxDecoration(
							shape: BoxShape.circle,
							border: Border.all(color: Colors.black12),
							color: active ? AppColors.primaryColor : Colors.transparent,
						),
					),
				],
			),
		);
	}
}

