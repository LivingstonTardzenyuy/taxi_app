import 'package:flutter/material.dart';
import '../../theme/colors.dart';
import '../../common/widgets/onboarding_page.dart';
import '../../common/widgets/onboarding_indicator.dart';
import '../../client_app/authentication/screens/create_account_screen.dart';
class ClientOnboarding extends StatefulWidget {
	const ClientOnboarding({Key? key}) : super(key: key);

	@override
	State<ClientOnboarding> createState() => _ClientOnboardingState();
}

class _ClientOnboardingState extends State<ClientOnboarding> {
	final PageController _controller = PageController();
	int _current = 0;

	final List<Map<String, String>> _pages = [
		{
			'image': 'assets/onboarding/onboarding_one.png',
			'title': 'Book Your Ride From Anywhere',
			'subtitle': 'Book your ride from anywhere. No more standing in long lines or crowded stops.'
		},
		{
			'image': 'assets/onboarding/onboarding_two.png',
			'title': 'Trusted Drivers & Safety',
			'subtitle': 'All drivers are verified and trained to ensure safe, reliable journeys every time'
		},
		{
			'image': 'assets/onboarding/onboarding_three.png',
			'title': 'Quick & Easy Bookings',
			'subtitle': 'Choose your ride, set your location, and confirm. It\'s that simple'
		},
		{
			'image': 'assets/onboarding/onboarding_four.png',
			'title': 'Schedule Rides In Advance',
			'subtitle': 'Book your taxi or bus for later and never worry about last-minute hassles'
		},
		{
			'image': 'assets/onboarding/onboarding_five.png',
			'title': 'Save Your Favorite Places',
			'subtitle': 'Save your favorite locations for easy booking and travels'
		},
	];

	void _next() {
		if (_current < _pages.length - 1) {
			_controller.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
		} else {
			_done();
		}
	}

	void _skip() {
		_controller.animateToPage(_pages.length - 1, duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
	}

	void _done() {
		// TODO: navigate to login or home
		// Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const Scaffold(body: Center(child: Text('Login / Home')))));
		Navigator.of(context).pushReplacement(
			MaterialPageRoute(
				builder: (_) => const CreateAccountScreen(),
			),
		);
	}

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			backgroundColor: AppColors.onboardingColor,
			body: SafeArea(
				child: Column(
					children: [
						Expanded(
							child: PageView.builder(
								controller: _controller,
								itemCount: _pages.length,
								onPageChanged: (i) => setState(() => _current = i),
								itemBuilder: (context, index) {
									final p = _pages[index];
									return OnboardingPage(
										imagePath: p['image']!,
										title: p['title']!,
										subtitle: p['subtitle']!,
									);
								},
							),
						),
									Padding(
										padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
										child: Column(
											mainAxisSize: MainAxisSize.min,
											children: [
												Row(
													mainAxisAlignment: MainAxisAlignment.spaceBetween,
													children: [
														TextButton(
															onPressed: () {
																if (_current > 0) {
																	_controller.previousPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
																}
															},
															child: const Text('< Prev'),
														),
														OnboardingIndicator(itemCount: _pages.length, currentIndex: _current),
														TextButton(
															onPressed: _next,
															child: Text(_current == _pages.length - 1 ? 'Done' : 'Next >', style: const TextStyle(color: AppColors.primaryColor)),
														),
													],
												),
												const SizedBox(height: 8),
												SizedBox(
													width: double.infinity,
													child: TextButton(
														onPressed: _skip,
														child: const Text('Skip >>'),
													),
												),
											],
										),
									),
					],
				),
			),
		);
	}
}

