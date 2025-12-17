import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:taxi_app/driver_app/booking/views/pre_booked.dart';
import 'package:taxi_app/theme/colors.dart';
import 'package:taxi_app/client_app/authentication/widgets/primary_button.dart';

class DriverEarningScreen extends StatelessWidget {
	const DriverEarningScreen({Key? key}) : super(key: key);

	Widget _statCard(String title, String value, IconData icon) {
		return Expanded(
			child: Container(
				padding: const EdgeInsets.all(12),
				decoration: BoxDecoration(
					color: Colors.white,
					borderRadius: BorderRadius.circular(8),
					border: Border.all(color: const Color(0xFFECECEC)),
				),
				child: Column(
					crossAxisAlignment: CrossAxisAlignment.start,
					mainAxisAlignment: MainAxisAlignment.start,
					children: [
						Column(
								crossAxisAlignment: CrossAxisAlignment.start,
								children: [Icon(icon, size: 18, color: AppColors.primaryColor),
							const SizedBox(height: 8),
							Text(title, style: const TextStyle(fontSize: 12, color: Colors.black54))]),
						const SizedBox(height: 8),
						Text(value, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
					],
				),
			),
		);
	}

	Widget _listItem(String name) {
		return ListTile(
			leading: Image.asset(
				"assets/images/img.png"
			),
			// leading: const CircleAvatar(backgroundColor: Color(0xFFEEF6F6), child: Icon(Icons.person, color: AppColors.primaryColor)),
			title: Text(name, style: const TextStyle(fontWeight: FontWeight.w600)),
			subtitle: const Text('2km | 30mins | \$12'),
		);
	}

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				backgroundColor: Colors.white,
				elevation: 0,
				iconTheme: const IconThemeData(color: Colors.black87),
				title: const Text('Total earned', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w600)),
				centerTitle: true,
			),
			body: Container(
				color: const Color(0xFFF7F7F7),
				padding: const EdgeInsets.all(16),
				child: Column(
					crossAxisAlignment: CrossAxisAlignment.start,
					children: [
						Row(children: [
							_statCard('Total Hour', '3', Icons.access_time),
							const SizedBox(width: 10),
							_statCard('Total Distance', '12km', Icons.location_on),
							const SizedBox(width: 10),
							_statCard('Earnings', '\$255', Icons.monetization_on),
						]),
						const SizedBox(height: 16),
						Expanded(
							child: InkWell(
								onTap: () {
									Get.to(PreBookedScreen());
								},
							  child: Card(
							  	shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
							  	child: ListView(
							  		children: [
							  			_listItem('Kendrick Anne'),
							  			const Divider(height: 1),
							  			_listItem('Kendrick Anne'),
							  			const Divider(height: 1),
							  			_listItem('Kendrick Anne'),
							  		],
							  	),
							  ),
							),
						),
					],
				),
			),
		);
	}
}
