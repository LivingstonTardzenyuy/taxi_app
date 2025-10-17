import 'package:flutter/material.dart';
import 'package:taxi_app/client_app/authentication/widgets/primary_button.dart';

class EnableLocationScreenClient extends StatelessWidget {
  const EnableLocationScreenClient({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center( // Center widget added here
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                // Image illustration
                Image.asset(
                  'assets/onboarding/enable_notification.png',
                  height: 180,
                ),
                const SizedBox(height: 40),

                // Title
                const Text(
                  'Enable Location Access',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),

                // Subtitle
                Text(
                  'Lorem Ipsum Porttitor Mauris Sit Habitasse\nMagna Urna Nulla Ullamcorper Purus Leo.',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey[600],
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 50),

                // PrimaryButton
                Container(
                  width: double.infinity,
                  child: PrimaryButton(
                  label: 'Allow Notifications',
                  onPressed: () {
                    // TODO: Handle notification permission
                  },
                ),
                ),
                const SizedBox(height: 24),

                // Later button
                GestureDetector(
                  onTap: () {
                    // TODO: Handle "Later" action
                  },
                  child: const Text(
                    'Later',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}