import 'package:flutter/material.dart';
 
class BusHealerSavedLocations extends StatefulWidget {
  const BusHealerSavedLocations({Key? key}) : super(key: key);

  @override
  State<BusHealerSavedLocations> createState() => _BusHealerSavedLocationsState();
}

class _BusHealerSavedLocationsState extends State<BusHealerSavedLocations> {
  int _selectedTaxi = 0;
  int _selectedBus = 0;

  final List<String> taxi = [
    'Indiana Jonas East Region',
    'Old Alf Hign Way Blog',
    'St Agnes Parish Gotey',
    'Rt Flag Metro Town High School',
  ];

  final List<String> bus = [
    'Indiana Jonas East Region',
    'Old Alf Hign Way Blog',
    'St Agnes Parish Gotey',
    'Rt Flag Metro Town High School',
  ];

  Widget _section(String title, List<String> items, int selected, ValueChanged<int> onSelect) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
        ),
        ...List.generate(items.length, (i) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
            child: Row(
              children: [
                Radio<int>(value: i, groupValue: selected, onChanged: (v) => onSelect(v ?? 0)),
                const SizedBox(width: 8),
                Expanded(child: Text(items[i], style: const TextStyle(fontSize: 14))),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.close, color: Colors.redAccent),
                )
              ],
            ),
          );
        })
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved locations', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w600)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black87),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _section('Taxi', taxi, _selectedTaxi, (v) => setState(() => _selectedTaxi = v)),
              const SizedBox(height: 8),
              _section('Bus', bus, _selectedBus, (v) => setState(() => _selectedBus = v)),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
