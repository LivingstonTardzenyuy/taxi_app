import 'package:flutter/material.dart';
import 'package:taxi_app/client_app/authentication/widgets/auth_text_field.dart';
import 'package:taxi_app/client_app/authentication/widgets/primary_button.dart';
// theme/colors not required here
import 'car_documents.dart';

class AddNewCar extends StatefulWidget {
  const AddNewCar({Key? key}) : super(key: key);

  @override
  State<AddNewCar> createState() => _AddNewCarState();
}

class _AddNewCarState extends State<AddNewCar> {
  final _carNameCtl = TextEditingController();
  final _carNumberCtl = TextEditingController();
  String? _carType;
  String? _seats;
  String? _fuelType;
  String? _carClass;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Add new car', style: TextStyle(color: Colors.black87)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          children: [
            AuthTextField(hint: 'Car Name', controller: _carNameCtl),
            const SizedBox(height: 12),
            DropdownButtonFormField<String>(
              value: _carType,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              ),
              hint: const Text('Car Type'),
              items: ['Truck', 'Sedan', 'SUV'].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
              onChanged: (v) => setState(() => _carType = v),
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<String>(
              value: _seats,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              ),
              hint: const Text('No Of Seats'),
              items: ['2', '4', '5', '6', '12', '59'].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
              onChanged: (v) => setState(() => _seats = v),
            ),
            const SizedBox(height: 12),
            AuthTextField(hint: 'Car Number', controller: _carNumberCtl),
            const SizedBox(height: 12),
            DropdownButtonFormField<String>(
              value: _fuelType,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              ),
              hint: const Text('Car Fuel Type'),
              items: ['Petrol', 'Diesel', 'Electric'].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
              onChanged: (v) => setState(() => _fuelType = v),
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<String>(
              value: _carClass,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              ),
              hint: const Text('Class'),
              items: ['A', 'B', 'C'].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
              onChanged: (v) => setState(() => _carClass = v),
            ),
            const SizedBox(height: 12),
            ListTile(
              title: const Text('Car Documents'),
              trailing: const Icon(Icons.chevron_right),
              tileColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const CarDocuments())),
            ),
            const SizedBox(height: 12),
            ListTile(
              title: const Text('Add image'),
              trailing: const Icon(Icons.chevron_right),
              tileColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              onTap: () {
                // TODO: open image picker
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
        child: SizedBox(
          height: 52,
          child: PrimaryButton(
            label: 'Add New Car',
            onPressed: () {
              // TODO: submit new car
              Navigator.of(context).pop();
            },
          ),
        ),
      ),
    );
  }
}
