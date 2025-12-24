import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:taxi_app/agencyAdmin/drivers/views/driver_detail.dart';
import 'package:taxi_app/client_app/authentication/widgets/auth_text_field.dart';
import 'package:taxi_app/client_app/authentication/widgets/primary_button.dart';
import 'package:taxi_app/theme/colors.dart';

class DriversListScreen extends StatelessWidget {
  const DriversListScreen({Key? key}) : super(key: key);

  Widget _headerRow() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(color: Colors.grey.shade50),
      child: Row(children: [
        SizedBox(width: 48, child: Text('ID.', style: TextStyle(color: Colors.grey.shade600, fontWeight: FontWeight.w600))),
        const SizedBox(width: 6),
        Expanded(child: Text('Driver', style: TextStyle(color: Colors.grey.shade600, fontWeight: FontWeight.w600))),
        Expanded(child: Text('Phone number', style: TextStyle(color: Colors.grey.shade600, fontWeight: FontWeight.w600))),
        SizedBox(width: 48, child: Center(child: Icon(Icons.star_border, color: Colors.grey.shade400, size: 18))),
      ]),
    );
  }

  Widget _driverRow(int id, String name, String phone, {bool highlighted = false}) {
    return InkWell(
      onTap: () {
        Get.to(DriverDetailScreen());
      },
      child: Container(
        color: highlighted ? Colors.grey.shade200 : Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        child: Row(children: [
          SizedBox(width: 48, child: Text('$id')),
          const SizedBox(width: 6),
          Expanded(child: Text(name)),
          Expanded(child: Text(phone)),
          SizedBox(width: 48, child: Center(child: Icon(Icons.star, color: highlighted ? AppColors.primaryColor : Colors.grey.shade400, size: 18))),
        ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final rows = List.generate(6, (i) => ['Jonathan Fred', '+146 556 5556']);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.6,
        leading: Padding(padding: const EdgeInsets.only(left: 12.0), child: IconButton(icon: const Icon(Icons.menu, color: Colors.black87), onPressed: () {})),
        centerTitle: true,
        title: const Text('Drivers', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w600)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(height: 8),
            // Search
            AuthTextField(hint: 'Search'),
            const SizedBox(height: 12),

            // Filter button
            SizedBox(width: double.infinity, child: PrimaryButton(label: 'Filter', onPressed: () {

            })),
            const SizedBox(height: 12),

            // Table header
            Card(elevation: 0, child: Column(children: [
              _headerRow(),
              const Divider(height: 0),
              // rows
              ...List.generate(rows.length, (i) {
                final r = rows[i];
                return _driverRow(i + 1, r[0], r[1], highlighted: i == 1);
              })
            ])),
          ]),
        ),
      ),
    );
  }
}
