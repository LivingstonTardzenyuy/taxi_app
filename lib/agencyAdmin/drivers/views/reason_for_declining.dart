import 'package:flutter/material.dart';
import 'package:taxi_app/theme/colors.dart';
import 'decline_confirmation.dart';

class ReasonForDecliningScreen extends StatefulWidget {
  const ReasonForDecliningScreen({Key? key}) : super(key: key);

  @override
  State<ReasonForDecliningScreen> createState() => _ReasonForDecliningScreenState();
}

class _ReasonForDecliningScreenState extends State<ReasonForDecliningScreen> {
  int _selected = 0;
  final TextEditingController _otherCtrl = TextEditingController();

  Widget _radioItem(int idx, String label) {
    return InkWell(
      onTap: () => setState(() => _selected = idx),
      child: Row(
        children: [
          Radio<int>(value: idx, groupValue: _selected, onChanged: (v) => setState(() => _selected = v!)),
          const SizedBox(width: 8),
          Expanded(child: Text(label)),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _otherCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.6,
        leading: IconButton(icon: const Icon(Icons.arrow_back, color: Colors.black87), onPressed: () => Navigator.pop(context)),
        centerTitle: true,
        title: const Text('Reason for declining', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w600)),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              const Text('Please select the reason for declining', style: TextStyle(fontSize: 16)),
              const SizedBox(height: 18),
              _radioItem(0, 'Car Too Old'),
              _radioItem(1, 'Documents Not Complete'),
              _radioItem(2, 'Agency Full'),
              _radioItem(3, 'Other'),
              const SizedBox(height: 18),
              const Text('Other', style: TextStyle(fontWeight: FontWeight.w600)),
              const SizedBox(height: 8),
              Container(
                height: 100,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), border: Border.all(color: Colors.grey.shade300)),
                child: TextField(
                  controller: _otherCtrl,
                  maxLines: null,
                  decoration: const InputDecoration(border: InputBorder.none, contentPadding: EdgeInsets.all(12), hintText: 'Placeholder'),
                ),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (_) => const DeclineConfirmationScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  ),
                  child: const Text('Cancel Ride', style: TextStyle(fontWeight: FontWeight.w600)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
