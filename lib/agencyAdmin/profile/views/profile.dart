import 'package:flutter/material.dart';
import 'package:taxi_app/theme/colors.dart';
// primary_button not required on this screen

class ProfileScreen extends StatelessWidget {
	const ProfileScreen({Key? key}) : super(key: key);

	Widget _tile(String label, IconData icon, {VoidCallback? onTap}) {
		return Container(
			margin: const EdgeInsets.symmetric(vertical: 6),
			decoration: BoxDecoration(
				color: Colors.white,
				borderRadius: BorderRadius.circular(8),
				border: Border.all(color: Colors.grey.shade200),
			),
			child: ListTile(
				onTap: onTap,
				leading: Container(
					width: 36,
					height: 36,
					decoration: BoxDecoration(
						color: AppColors.onboardingColor,
						borderRadius: BorderRadius.circular(8),
					),
					child: Icon(icon, color: AppColors.primaryColor, size: 18),
				),
				title: Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
				trailing: const Icon(Icons.chevron_right),
			),
		);
	}

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				backgroundColor: Colors.white,
				elevation: 0.6,
				leading: IconButton(
					icon: const Icon(Icons.arrow_back, color: Colors.black87),
					onPressed: () => Navigator.of(context).pop(),
				),
				centerTitle: true,
				title: const Text('Profile', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w600)),
			),
			body: SafeArea(
				child: SingleChildScrollView(
					padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
					child: Column(
						children: [
							Center(
								child: Column(
									children: [
										Stack(
											alignment: Alignment.center,
											children: [
												Container(
													width: 100,
													height: 100,
													decoration: BoxDecoration(
														color: AppColors.onboardingColor,
														shape: BoxShape.circle,
													),
												),
												const CircleAvatar(radius: 28, backgroundColor: Colors.transparent, child: Icon(Icons.person, size: 40, color: Colors.white)),
												Positioned(
													bottom: 0,
													child: Container(
														padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
														decoration: BoxDecoration(color: AppColors.primaryColor, borderRadius: BorderRadius.circular(20)),
														child: const Text('EDIT', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 12)),
													),
												)
											],
										),
										const SizedBox(height: 12),
										const Text('Kendrick Anne', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
										const SizedBox(height: 18),
									],
								),
							),

							_tile('Your profile', Icons.person, onTap: () {}),
							_tile('Manage password', Icons.lock_outline, onTap: () {}),
							_tile('Notification', Icons.notifications_none, onTap: () {}),
							_tile('Payment method', Icons.payment_outlined, onTap: () {}),
							_tile('Pre-Booked rides', Icons.calendar_today_outlined, onTap: () {}),
							_tile('Settings', Icons.settings_outlined, onTap: () {}),
							_tile('Sun admin', Icons.group_outlined, onTap: () {}),
							_tile('Help center', Icons.help_outline, onTap: () {}),
						],
					),
				),
			),
		);
	}
}
