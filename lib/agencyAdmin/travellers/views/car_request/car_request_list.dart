import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:taxi_app/agencyAdmin/travellers/views/car_request/add_new_car.dart';
import 'package:taxi_app/theme/colors.dart';
import 'car_request_detail.dart';

class CarRequestList extends StatefulWidget {
  const CarRequestList({Key? key}) : super(key: key);

  @override
  State<CarRequestList> createState() => _CarRequestListState();
}

class _CarRequestListState extends State<CarRequestList> {
  bool showNewDriver = true;

  final List<Map<String, String>> rows = List.generate(6, (index) => {
        'id': '${index + 1}',
        'name': 'Jonathan Fred',
        'phone': '+456 555 5556'
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Padding(
          padding: EdgeInsets.only(left: 12.0),
          child: Icon(Icons.menu, color: Colors.black87),
        ),
        title: const Text('Car request', style: TextStyle(color: Colors.black87, fontSize: 16)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Get.to(AddNewCar());
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: !showNewDriver ? AppColors.primaryColor : const Color(0xFFDADADA),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: Text('New Car', style: TextStyle(color: !showNewDriver ? Colors.white : Colors.black87)),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => showNewDriver = true),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: showNewDriver ? AppColors.primaryColor : const Color(0xFFDADADA),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: Text('New Driver', style: TextStyle(color: showNewDriver ? Colors.white : Colors.black87)),
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
          const SizedBox(height: 18),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: rows.length,
              itemBuilder: (context, index) {
                final r = rows[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) => const CarRequestDetail()));
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6),
                      boxShadow: const [BoxShadow(color: Color(0x0A000000), blurRadius: 2, offset: Offset(0,1))],
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: 36, child: Text(r['id']!, style: const TextStyle(fontWeight: FontWeight.w600))),
                        const SizedBox(width: 12),
                        Expanded(child: Text(r['name']!, style: const TextStyle(fontWeight: FontWeight.w600))),
                        const SizedBox(width: 12),
                        Text(r['phone']!, style: const TextStyle(color: Colors.black54)),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
