// import 'package:flutter/material.dart';
// import '../../theme/colors.dart';
//
// class LogoScreen extends StatelessWidget {
// 	const LogoScreen({Key? key}) : super(key: key);
//
// 	@override
// 	Widget build(BuildContext context) {
// 		return Scaffold(
// 			backgroundColor: AppColors.primaryColor,
// 			body: Center(
// 				child: Column(
// 					mainAxisSize: MainAxisSize.min,
// 					children: [
// 						Image.asset(
// 							'assets/onboarding/app_logo.png',
// 							width: 120,
// 							height: 120,
// 							color: Colors.white,
// 						),
// 						const SizedBox(height: 16),
// 						const Text(
// 							'MATHEA',
// 							style: TextStyle(
// 								color: Colors.white,
// 								fontSize: 20,
// 								letterSpacing: 6,
// 								fontWeight: FontWeight.w600,
// 							),
// 						),
// 					],
// 				),
// 			),
// 		);
// 	}
// }



import 'dart:async';
import 'package:flutter/material.dart';
import '../../theme/colors.dart';
import 'onboarding_one.dart';

class LogoScreen extends StatefulWidget {
	const LogoScreen({Key? key}) : super(key: key);

	@override
	State<LogoScreen> createState() => _LogoScreenState();
}

class _LogoScreenState extends State<LogoScreen> {
	@override
	void initState() {
		super.initState();

		// Wait 3 seconds, then navigate to ClientOnboarding
		Timer(const Duration(seconds: 3), () {
			Navigator.pushReplacement(
				context,
				MaterialPageRoute(builder: (context) => const ClientOnboarding()),
			);
		});
	}

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			backgroundColor: AppColors.primaryColor,
			body: Center(
				child: Column(
					mainAxisSize: MainAxisSize.min,
					children: [
						Image.asset(
							'assets/onboarding/app_logo.png',
							width: 120,
							height: 120,
							color: Colors.white,
						),
						const SizedBox(height: 16),
						const Text(
							'MATHEA',
							style: TextStyle(
								color: Colors.white,
								fontSize: 20,
								letterSpacing: 6,
								fontWeight: FontWeight.w600,
							),
						),
					],
				),
			),
		);
	}
}
