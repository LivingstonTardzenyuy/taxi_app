import 'package:flutter/material.dart';
import 'package:taxi_app/theme/colors.dart';

import '../../widgets/drawer.dart';

class FeedbackScreen extends StatelessWidget {
	FeedbackScreen({Key? key}) : super(key: key);
	GlobalKey<ScaffoldState> adminScaffoldKey = GlobalKey<ScaffoldState>();

	Widget _stars(double rating) {
		final full = rating.floor();
		final half = (rating - full) >= 0.5;
		return Row(
			children: List.generate(5, (i) {
				if (i < full) return const Icon(Icons.star, color: Colors.white, size: 22);
				if (i == full && half) return const Icon(Icons.star_half, color: AppColors.primaryColor, size: 16);
				return Icon(Icons.star_border, color: Colors.grey.shade400, size: 16);
			}),
		);
	}

	Widget _driverRow(String name) {
		return Padding(
			padding: const EdgeInsets.symmetric(vertical: 8.0),
			child: Row(
				children: [
					Image.asset(
						"assets/images/img.png"
					),
					const SizedBox(width: 12),
					Expanded(child: Text(name, style: const TextStyle(fontWeight: FontWeight.w600))),
					TextButton(onPressed: () {}, child: const Text('View More', style: TextStyle(color: Colors.black54))),
				],
			),
		);
	}

	Widget _feedbackItem(String name, String date, double rating, String body) {
		return Padding(
			padding: const EdgeInsets.symmetric(vertical: 8.0),
			child: Row(
				crossAxisAlignment: CrossAxisAlignment.start,
				children: [
					Container(
						height: 40, width: 40,
					  child: Image.asset(
					  		"assets/images/img.png"
					  ),
					),
					const SizedBox(width: 12),
					Expanded(
						child: Column(
							mainAxisAlignment: MainAxisAlignment.start,
							crossAxisAlignment: CrossAxisAlignment.start,
							children: [
								Row(
									mainAxisAlignment: MainAxisAlignment.spaceBetween,
									children: [
										Text(name, style: const TextStyle(fontWeight: FontWeight.w700)),
										Text(rating.toString(), style: const TextStyle(color: Colors.black54, fontSize: 12)),
									],
								),
								const SizedBox(height: 6),
								// Row(
								// 	crossAxisAlignment: CrossAxisAlignment.start,
								// 	children: [
								//
								// 	],
								// ),
								Text(date, style: const TextStyle(color: Colors.black45, fontSize: 12)),
								const SizedBox(height: 8),
								Text(body, style: const TextStyle(color: Colors.black87)),
							],
						),
					)
				],
			),
		);
	}

	@override
	Widget build(BuildContext context) {
		final lorem = 'Lorem Ipsum Sit Phasellus Nec Vehicula Dictum Aliquam Feugiat Eget Lectus Euismod Sapien Pellentesque Orci Quis Risus Risus Enim Mauris.';

		return Scaffold(
			key: adminScaffoldKey,
			drawer: const AdminDrawer(),
			body: SafeArea(
				child: SingleChildScrollView(
					padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
					child: Column(
						crossAxisAlignment: CrossAxisAlignment.start,
						children: [
							// small highlighted label
							Center(
							  child: Container(
							  	padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
							  	// decoration: BoxDecoration(color: Colors.yellow.shade700, borderRadius: BorderRadius.circular(4)),
							  	child: Expanded(
							  			child: const Text('Feedback',
							  					style: TextStyle(
							  							fontWeight: FontWeight.w700
							  					)
							  			)
							  	),
							  ),
							),
							const SizedBox(height: 12),

							// rating card
							Container(
								width: double.infinity,
								padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 35),
								decoration: BoxDecoration(
									color: Color(0xFF73ACB1),
									borderRadius: BorderRadius.circular(10),
								),
								child: Column(
									crossAxisAlignment: CrossAxisAlignment.start,
									children: [
										const Text('3.6', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.white)),
										const SizedBox(height: 12),
										_stars(3.6),
										const SizedBox(height: 12),
										const Text('(923 Reviews)',
												style: TextStyle(
														color: Colors.white
												)),
									],
								),
							),

							const SizedBox(height: 18),
							const Text('Top Drivers', style: TextStyle(fontWeight: FontWeight.w700)),
							const SizedBox(height: 8),
							_driverRow('Kendrick Anne'),
							_driverRow('Kendrick Anne'),
							_driverRow('Kendrick Anne'),
							_driverRow('Kendrick Anne'),

							const SizedBox(height: 18),
							Container(
								padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
								decoration: BoxDecoration(color: Colors.yellow.shade700, borderRadius: BorderRadius.circular(4)),
								child: const Text('Feedbacks', style: TextStyle(fontWeight: FontWeight.w700)),
							),
							const SizedBox(height: 12),

							_feedbackItem('Kendrick Anne', '10 Jan 2025', 4.0, lorem),
							const Divider(),
							_feedbackItem('Kendrick Anne', '10 Jan 2025', 3.5, lorem),
							const Divider(),
							_feedbackItem('Kendrick Anne', '10 Jan 2025', 5.0, lorem),
							const Divider(),
							_feedbackItem('Kendrick Anne', '10 Jan 2025', 4.0, lorem),
						],
					),
				),
			),
		);
	}
}

