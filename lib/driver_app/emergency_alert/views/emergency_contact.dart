import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taxi_app/client_app/authentication/widgets/primary_button.dart';
import 'package:taxi_app/theme/colors.dart';

import '../../../client_app/authentication/widgets/auth_text_field.dart';

class EmergencyContactScreen extends StatefulWidget {
  const EmergencyContactScreen({Key? key}) : super(key: key);

  @override
  State<EmergencyContactScreen> createState() => _EmergencyContactScreenState();
}

class _EmergencyContactScreenState extends State<EmergencyContactScreen> {
  List<Map<String, dynamic>> contacts = [
    {'name': 'Deferno Ando (Bestfriend)', 'relation': 'Bestfriend', 'selected': false},
    {'name': 'Ando Deferno Ando (Room Mate)', 'relation': 'Room Mate', 'selected': false},
    {'name': 'Ed Adersi (Brother)', 'relation': 'Brother', 'selected': false},
  ];
  bool selectAll = false;

  void _openAddContactSheet() async {
    final result = await showModalBottomSheet<Map<String, String>>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) {
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.5,
          minChildSize: 0.3,
          maxChildSize: 0.9,
          builder: (_, controller) {
            final _nameCtrl = TextEditingController();
            final _relationCtrl = TextEditingController();
            String saveOption = 'Save Contact';
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
              decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
              child: Column(
                children: [
                  Container(width: 40, height: 6, decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(6))),
                  const SizedBox(height: 12),
                  const Text('Add Emergency Contact', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
                  const SizedBox(height: 12),
                  // Save option mock
                  DropdownButtonFormField<String>(
                    value: saveOption,
                    items: const [DropdownMenuItem(value: 'Save Contact', child: Text('Save Contact'))],
                    onChanged: (v) {},
                    decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)), contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14)),
                  ),
                  const SizedBox(height: 12),
                  AuthTextField(
                    hint: 'Save Contact',
                    prefixIcon: Icon(Icons.person_pin_circle_outlined),
                  ),
                  TextField(controller: _relationCtrl, decoration: InputDecoration(labelText: 'Relationship', border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)))),
                  const SizedBox(height: 62),
                  SizedBox(
                    width: double.infinity,
                    child: PrimaryButton(label: 'Done', onPressed: () {
                      final name = _nameCtrl.text.trim().isEmpty ? 'New Contact' : _nameCtrl.text.trim();
                      final rel = _relationCtrl.text.trim().isEmpty ? 'Other' : _relationCtrl.text.trim();
                      Navigator.of(context).pop({'name': name, 'relation': rel});
                    }),
                  ),
                ],
              ),
            );
          },
        );
      },
    );

    if (result != null) {
      setState(() {
        contacts.add({'name': result['name'], 'relation': result['relation'], 'selected': true});
      });
    }
  }

  void _sendAlert() {
    final selected = contacts.where((c) => c['selected'] == true).toList();
    if (selected.isEmpty && !selectAll) {
      Get.snackbar('No contact selected', 'Please select at least one emergency contact', backgroundColor: Colors.white);
      return;
    }
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) {
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.45,
          minChildSize: 0.25,
          maxChildSize: 0.9,
          builder: (_, controller) => Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
            child: Column(
              children: [
                Container(width: 40, height: 6, decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(4))),
                const SizedBox(height: 18),
                Container(height: 120, child: const Center(child: Icon(Icons.check_circle_outline, size: 72, color: AppColors.primaryColor))),
                const SizedBox(height: 8),
                const Text('Emergency Sent', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                const SizedBox(height: 8),
                const Text('Your emergency contacts have been notified.', textAlign: TextAlign.center, style: TextStyle(color: Colors.black54)),
                const Spacer(),
                SizedBox(width: double.infinity, child: PrimaryButton(label: 'Done', onPressed: () { Navigator.of(context).pop(); Navigator.of(context).pop(); })),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black87),
        title: const Text('Emergency contact', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w600)),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            children: [
              RadioListTile<bool>(
                value: true,
                groupValue: selectAll,
                onChanged: (v) {
                  setState(() {
                    selectAll = true;
                    for (var c in contacts) { c['selected'] = true; }
                  });
                },
                title: const Text('Select All'),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: ListView.separated(
                  itemCount: contacts.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 6),
                  itemBuilder: (context, i) {
                    final c = contacts[i];
                    return RadioListTile<bool>(
                      value: c['selected'] == true,
                      groupValue: c['selected'] == true,
                      onChanged: (v) {
                        setState(() {
                          contacts[i]['selected'] = !(contacts[i]['selected'] == true);
                          // if any not selected, unset selectAll
                          selectAll = contacts.every((e) => e['selected'] == true);
                        });
                      },
                      title: Text(c['name']),
                      secondary: const Icon(Icons.check_circle_outline, color: Colors.black26),
                    );
                  },
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: Column(
                  children: [
                    SizedBox(width: double.infinity, child: PrimaryButton(label: 'Send Alert', onPressed: _sendAlert)),
                    const SizedBox(height: 6),
                    TextButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color?>(Color(0xFFFFFFFF))
                      ),
                        onPressed: _openAddContactSheet,
                        child: const Text('Add new contact')),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
