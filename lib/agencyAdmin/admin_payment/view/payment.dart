import 'package:flutter/material.dart';
import 'package:taxi_app/theme/colors.dart';
import 'package:taxi_app/client_app/authentication/widgets/primary_button.dart';

import 'add_card.dart';

class AdminPaymentsScreen extends StatelessWidget {
	const AdminPaymentsScreen({Key? key}) : super(key: key);

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
				title: const Text(
					'Payment methods',
					style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w600),
				),
			),
			body: SafeArea(
				child: SingleChildScrollView(
					padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
					child: Column(
						crossAxisAlignment: CrossAxisAlignment.start,
						children: [
							// Balance card
							Container(
								width: double.infinity,
								padding: const EdgeInsets.all(18),
								decoration: BoxDecoration(
									color: AppColors.primaryColor,
									borderRadius: BorderRadius.circular(12),
								),
								child: Column(
									crossAxisAlignment: CrossAxisAlignment.start,
									children: const [
										Text('Balance', style: TextStyle(color: Colors.white70)),
										SizedBox(height: 8),
										Text(r'$590', style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.w700)),
									],
								),
							),

							const SizedBox(height: 18),

											// Cash section
											const Text('Cash', style: TextStyle(fontWeight: FontWeight.w600)),
											const SizedBox(height: 8),
											_MethodCard(
												title: 'Cash',
												subtitle: null,
												leading: const Icon(Icons.money, color: Colors.black54, size: 20),
											),
											const SizedBox(height: 8),
											_AddMoreTile(onTap: () {}),

											const SizedBox(height: 12),

											// Wallet
											const Text('Wallet', style: TextStyle(fontWeight: FontWeight.w600)),
											const SizedBox(height: 8),
											const _MethodCard(
												title: 'Wallet',
												subtitle: null,
												leading: Icon(Icons.account_balance_wallet_outlined, color: Colors.black54, size: 20),
											),
											const SizedBox(height: 8),
											_AddMoreTile(onTap: () {}),

											const SizedBox(height: 12),

											// Credit card
											const Text('Credit card', style: TextStyle(fontWeight: FontWeight.w600)),
											const SizedBox(height: 8),
											_MethodCard(
												title: '****786',
												subtitle: null,
												leading: const Icon(Icons.credit_card, color: Colors.black54, size: 20),
											),
											const SizedBox(height: 8),
											_AddMoreTile(onTap: () {
												Navigator.push(
													context,
													MaterialPageRoute(builder: (_) => const AddCardScreen()),
												);
											}),

											const SizedBox(height: 12),

											// Mobile money
											const Text('Mobile money', style: TextStyle(fontWeight: FontWeight.w600)),
											const SizedBox(height: 8),
											const _MethodCard(
												title: 'MONEP PAY',
												subtitle: null,
												leading: Icon(Icons.mobile_friendly, color: Colors.black54, size: 20),
											),
											const SizedBox(height: 8),
											_AddMoreTile(onTap: () {}),

											const SizedBox(height: 12),

											// More payment methods
											const Text('More payment methods', style: TextStyle(fontWeight: FontWeight.w600)),
											const SizedBox(height: 8),
											const _MethodCard(
												title: 'Google Pay',
												subtitle: null,
												leading: Icon(Icons.payment, color: Colors.black54, size: 20),
											),
											const SizedBox(height: 8),
											_AddMoreTile(onTap: () {}),

							const SizedBox(height: 30),

							// Example action (if needed) — using PrimaryButton for consistency

						],
					),
				),
			),
		);
	}
}

class _MethodCard extends StatelessWidget {
	final String title;
	final String? subtitle;
	final Widget? leading;

	const _MethodCard({
		Key? key,
		required this.title,
		this.subtitle,
		this.leading,
	}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return Container(
			decoration: BoxDecoration(
				color: Colors.white,
				borderRadius: BorderRadius.circular(10),
				border: Border.all(color: Colors.grey.shade300),
			),
			padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
			child: Row(
				children: [
					if (leading != null) ...[
						Padding(
							padding: const EdgeInsets.only(right: 12),
							child: SizedBox(width: 28, height: 28, child: leading),
						),
					],
					Expanded(
						child: Column(
							crossAxisAlignment: CrossAxisAlignment.start,
							children: [
								Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
								if (subtitle != null) ...[
									const SizedBox(height: 6),
									Text(subtitle!, style: const TextStyle(color: Colors.black54)),
								]
							],
						),
					),
				],
			),
		);
	}
}

class _AddMoreTile extends StatelessWidget {
	final VoidCallback onTap;

	const _AddMoreTile({Key? key, required this.onTap}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return GestureDetector(
			onTap: onTap,
			child: Container(
				width: double.infinity,
				padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
				decoration: BoxDecoration(
					color: Colors.white,
					borderRadius: BorderRadius.circular(10),
					border: Border.all(color: Colors.grey.shade300),
				),
				child: Row(
					children: const [
						Icon(Icons.add, color: AppColors.primaryColor),
						SizedBox(width: 12),
						Text('+ Add more', style: TextStyle(color: AppColors.primaryColor)),
					],
				),
			),
		);
	}
}

