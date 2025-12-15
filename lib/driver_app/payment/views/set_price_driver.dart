import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:taxi_app/client_app/authentication/widgets/auth_text_field.dart';
import 'package:taxi_app/client_app/authentication/widgets/primary_button.dart';
import 'package:taxi_app/driver_app/payment/views/payment_methods.dart';
import 'package:taxi_app/theme/colors.dart';

class SetPriceDriverScreen extends StatefulWidget {
	const SetPriceDriverScreen({Key? key}) : super(key: key);

	@override
	State<SetPriceDriverScreen> createState() => _SetPriceDriverScreenState();
}

class _SetPriceDriverScreenState extends State<SetPriceDriverScreen> {
	final TextEditingController _priceController = TextEditingController();

	@override
	void dispose() {
		_priceController.dispose();
		super.dispose();
	}

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				backgroundColor: Colors.white,
				elevation: 0,
				leading: IconButton(
					icon: const Icon(Icons.arrow_back, color: Colors.black87),
					onPressed: () => Navigator.of(context).pop(),
				),
				title: const Text('Price rate', style: TextStyle(color: Colors.black87)),
				centerTitle: true,
			),
			body: Padding(
				padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
				child: Column(
					crossAxisAlignment: CrossAxisAlignment.start,
					children: [
						const SizedBox(height: 8),
						const Text('Enter price rate', style: TextStyle(color: Colors.black87)),
						const SizedBox(height: 8),
						AuthTextField(
							hint: 'Price rate',
							controller: _priceController,
							keyboardType: TextInputType.numberWithOptions(decimal: true),
						),
						const Spacer(),
						Container(
							padding: const EdgeInsets.only(bottom: 30),
							child: SizedBox(
								width: double.infinity,
								height: 52,
								child: PrimaryButton(
									label: 'Update Price',
									color: AppColors.primaryColor,
									onPressed: () {
										// TODO: Save the price and close
										Get.to(PaymentMethodsScreen());
									},
								),
							),
						)
					],
				),
			),
		);
	}
}
