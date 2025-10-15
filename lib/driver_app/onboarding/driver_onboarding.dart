import 'package:flutter/material.dart';
import '../../theme/colors.dart';
import '../../common/widgets/onboarding_page.dart';
import '../../common/widgets/onboarding_indicator.dart';

class DriverOnboarding extends StatefulWidget {
  const DriverOnboarding({Key? key}) : super(key: key);

  @override
  State<DriverOnboarding> createState() => _DriverOnboardingState();
}

class _DriverOnboardingState extends State<DriverOnboarding> {
  final PageController _controller = PageController();
  int _current = 0;

  final List<Map<String, String>> _pages = [
    {
      'image': 'assets/onboarding/onboarding_two.png',
      'title': 'Accept Rides Easily',
      'subtitle': 'Receive ride requests, navigate, and complete trips with a simple tap.'
    },
    {
      'image': 'assets/onboarding/onboarding_three.png',
      'title': 'Track Earnings',
      'subtitle': 'See daily earnings, trip history and performance at a glance.'
    },
    {
      'image': 'assets/onboarding/onboarding_four.png',
      'title': 'Schedule & Manage',
      'subtitle': 'Manage your schedule, accept pre-bookings and stay in control.'
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
    // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const Scaffold(body: Center(child: Text('Driver Login / Home')))));
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
                      TextButton(onPressed: _next, child: Text(_current == _pages.length - 1 ? 'Done' : 'Next >', style: const TextStyle(color: AppColors.primaryColor))),
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
