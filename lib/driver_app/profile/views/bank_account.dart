import 'dart:io';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:taxi_app/agencyAdmin/travellers/views/car_request/add_new_car.dart';
import 'package:taxi_app/client_app/authentication/widgets/primary_button.dart';
import 'package:taxi_app/driver_app/payment/views/set_price_driver.dart';

class BankAccountScreen extends StatefulWidget {
  const BankAccountScreen({Key? key}) : super(key: key);

  @override
  State<BankAccountScreen> createState() => _BankAccountScreenState();
}

class _BankAccountScreenState extends State<BankAccountScreen> {
  File? docFile;
  String? docName;
  int? docSize;

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
        title: const Text('Bank account details', style: TextStyle(color: Colors.black87)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            _buildBullet('Upload Bank Document (Passbook Canceled Cheque, Bank Statement, Or Digital Account Screenshot)'),
            const SizedBox(height: 8),
            _buildBullet('Upload JPEG/PNG/PDF'),
            const SizedBox(height: 18),
            GestureDetector(
              onTap: () async => await _pickDoc(),
              child: Container(
                width: double.infinity,
                height: 120,
                decoration: BoxDecoration(
                  color: const Color(0xFFF7F7F7),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: const Color(0xFFDADADA)),
                ),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(Icons.cloud_upload_outlined, size: 36, color: Colors.black45),
                      SizedBox(height: 8),
                      Text('Upload Documents', style: TextStyle(color: Colors.black54)),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            if (docFile != null)
              Column(
                children: [
                  Row(
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: 80,
                            height: 90,
                            decoration: BoxDecoration(color: const Color(0xFFEFEFEF), borderRadius: BorderRadius.circular(8)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.file(docFile!, fit: BoxFit.cover),
                            ),
                          ),
                          Positioned(
                            right: 0,
                            top: 0,
                            child: GestureDetector(
                              onTap: () => setState(() { docFile = null; docName = null; docSize = null; }),
                              child: Container(
                                width: 22,
                                height: 22,
                                decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.black54),
                                child: const Icon(Icons.close, size: 14, color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 12),
                      Expanded(child: Text('${docName ?? ''}\n${docSize != null ? _formatBytes(docSize!) : ''}', style: const TextStyle(fontSize: 12, color: Colors.black54))),
                    ],
                  ),
                  const SizedBox(height: 18),
                ],
              ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.only(bottom: 30),
              child: SizedBox(
                width: double.infinity,
                height: 52,
                child: PrimaryButton(
                  label: 'Update',
                  onPressed: () {
                    Get.to(SetPriceDriverScreen());
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBullet(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 6.0, right: 8),
          child: Icon(Icons.radio_button_unchecked, size: 16, color: Colors.black54),
        ),
        Expanded(child: Text(text, style: const TextStyle(fontSize: 13, color: Colors.black87))),
      ],
    );
  }

  Future<void> _pickDoc() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png', 'pdf'],
      withData: false,
    );
    if (result == null || result.files.isEmpty) return;
    final picked = result.files.first;
    final path = picked.path;
    if (path == null) return;
    setState(() {
      docFile = File(path);
      docName = picked.name;
      docSize = picked.size;
    });
  }

  String _formatBytes(int bytes, [int decimals = 1]) {
    if (bytes <= 0) return '0 B';
    const suffixes = ['B', 'KB', 'MB', 'GB', 'TB'];
    var i = (math.log(bytes) / math.log(1024)).floor();
    return ((bytes / math.pow(1024, i)).toStringAsFixed(decimals)) + ' ' + suffixes[i];
  }
}
