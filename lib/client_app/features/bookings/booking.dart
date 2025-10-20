import 'package:flutter/material.dart';


class BookingScreen extends StatelessWidget {
  const BookingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Destination'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // TODO: Implement back navigation
          },
        ),
      ),
      body: Stack(
        children: [
          // Background Image
          Image.asset(
            'assets/booking/background_image.png', // Replace with the actual path
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),

          // Content
          Center(
            child: Card(
              margin: const EdgeInsets.all(20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _DestinationOption(text: '10 Up Stream Strange Town'),
                    const Divider(),
                    _DestinationOption(text: 'End Of Upcid Road Down Town'),
                    const Divider(),
                    _DestinationOption(text: 'Long Avenue Saint James'),
                    const SizedBox(height: 20),
                    // TODO: Use PrimaryButton here
                    ElevatedButton(
                      onPressed: () {
                        // TODO: Implement confirm location action
                      },
                      child: const Text('Confirm Location'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DestinationOption extends StatelessWidget {
  const _DestinationOption({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          const Icon(Icons.location_on),
          const SizedBox(width: 10),
          Text(text),
        ],
      ),
    );
  }
}