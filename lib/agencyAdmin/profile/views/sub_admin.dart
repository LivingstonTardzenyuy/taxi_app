import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:taxi_app/agencyAdmin/profile/views/create_sub_admin.dart';
import 'package:taxi_app/client_app/authentication/widgets/primary_button.dart';
import 'package:taxi_app/theme/colors.dart';

class SubAdminScreen extends StatelessWidget {
  const SubAdminScreen({Key? key}) : super(key: key);

  Widget _tableRow(BuildContext context, int idx, String admin, String date, {bool highlighted = false}) {
    return Container(
      color: highlighted ? Colors.grey.shade200 : Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(width: 48, child: Text('$idx', style: const TextStyle(color: Colors.black87))),
          Text(admin, style: const TextStyle(fontWeight: FontWeight.w600)),
          SizedBox(
            width: 140,
            child: Text(date, textAlign: TextAlign.right, style: TextStyle(color: Colors.grey.shade600, fontSize: 12)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final rows = List.generate(4, (i) => ['TY00031', '10-02-2014\n14:30']);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.6,
        leading: Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: IconButton(icon: const Icon(Icons.menu, color: Colors.black87), onPressed: () {}),
        ),
        centerTitle: true,
        title: const Text('Sub admin', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w600)),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // big pill button
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: PrimaryButton(
                    label: "Create Sub Admin",
                    onPressed: () {
                      Get.to(CreateSubAdminScreen());
                    })
              ),

              const SizedBox(height: 18),

              // table header
              Container(
                decoration: BoxDecoration(border: Border(top: BorderSide(color: Colors.grey.shade200), bottom: BorderSide(color: Colors.grey.shade200))),
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                  SizedBox(width: 48, child: Text('Sr No', style: TextStyle(color: Colors.grey.shade600, fontWeight: FontWeight.w600))),
                  Row(children: [Text('Admin', style: TextStyle(color: Colors.grey.shade600, fontWeight: FontWeight.w600)), const SizedBox(width: 6), const Icon(Icons.arrow_drop_down, size: 18)]),
                  SizedBox(width: 140, child: Text('Created date', textAlign: TextAlign.right, style: TextStyle(color: Colors.grey.shade600, fontWeight: FontWeight.w600))),
                ]),
              ),

              const SizedBox(height: 6),

              // rows
              Expanded(
                child: ListView.builder(
                  itemCount: rows.length,
                  itemBuilder: (context, i) {
                    return _tableRow(context, i + 1, rows[i][0], rows[i][1], highlighted: i == 1);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
