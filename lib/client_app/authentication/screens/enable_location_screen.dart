import 'package:flutter/material.dart';
import '../../../theme/colors.dart';
import '../widgets/primary_button.dart';

class EnableLocationScreen extends StatelessWidget {
  const EnableLocationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.onboardingColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 60),
              Image.asset('assets/onboarding/onboarding_four.png', width: 200, height: 200),
              const SizedBox(height: 24),
              Text('Enable Location Access', style: Theme.of(context).textTheme.titleLarge?.copyWith(color: AppColors.primaryColor, fontSize: 22, fontWeight: FontWeight.w700)),
              const SizedBox(height: 8),
              Text('Lorem ipsum Porttitor Mauris Sit Habitasse Magna Urna Nulla Ullamcorper Purus Leo.', textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyMedium),
              const Spacer(),
              PrimaryButton(label: 'Allow Location Access', onPressed: () => Navigator.pushReplacementNamed(context, '/')),
              TextButton(onPressed: () => Navigator.pushReplacementNamed(context, '/'), child: const Text('Later'))
            ],
          ),
        ),
      ),
    );
  }
}
