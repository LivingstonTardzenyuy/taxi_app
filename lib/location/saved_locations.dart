import 'package:flutter/material.dart';
import 'package:taxi_app/client_app/authentication/widgets/primary_button.dart';

class SavedLocationsScreen extends StatefulWidget {
  const SavedLocationsScreen({Key? key}) : super(key: key);

  @override
  State<SavedLocationsScreen> createState() => _SavedLocationsScreenState();
}

class _SavedLocationsScreenState extends State<SavedLocationsScreen> {
  int _selected = 0;

  final List<String> _items = [
    'Indiana Jonas East Region',
    'Old Alf Hign Way Blog',
    'St Agnes Parish Gotey',
    'Rt Flag Metro Town High School',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved locations', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w600)),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black87),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                itemCount: _items.length,
                separatorBuilder: (_, __) => const Divider(height: 20),
                itemBuilder: (context, i) {
                  return Row(
                    children: [
                      Radio<int>(value: i, groupValue: _selected, onChanged: (v) => setState(() => _selected = v ?? 0)),
                      const SizedBox(width: 8),
                      Expanded(child: Text(_items[i], style: const TextStyle(fontSize: 15))),
                      IconButton(icon: const Icon(Icons.close, color: Colors.redAccent), onPressed: () {}),
                    ],
                  );
                },
              ),
            ),

            // Continue button area
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                child: PrimaryButton(label: 'Continue', onPressed: () { Navigator.of(context).pop(); }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
