import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:taxi_app/driver_app/home/views/home.dart';
import '../../../client_app/authentication/widgets/primary_button.dart';
import '../../../theme/colors.dart';

class CarPUCScreen extends StatefulWidget {
  const CarPUCScreen({Key? key}) : super(key: key);

  @override
  State<CarPUCScreen> createState() => _CarPUCScreenState();
}

class _CarPUCScreenState extends State<CarPUCScreen> {

  File? frontFile;
  File? backFile;
  String? frontName;
  String? backName;
  int? frontSize;
  int? backSize;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: const BackButton(color: Colors.black),
        centerTitle: true,
        title: const Text(
          'Car PUC',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// Instructions
            _buildInstruction('Upload A Valid PUC Slip'),
            const SizedBox(height: 16),
            _buildInstruction('Upload PDF/JPEG/PNG'),

            const SizedBox(height: 60),

            /// Section Title
            const Text(
              'Attach PUC Details',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w800,
              ),
            ),

            const SizedBox(height: 10),

            /// Upload Box
            GestureDetector(
              onTap: _pickDocument,
              child: Container(
                width: double.infinity,
                height: 120,
                decoration: BoxDecoration(
                  // color: const Color(0xFFF7F7F7),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: const Color(0xFFDADADA),
                    width: 1,
                  ),
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

            const SizedBox(height: 16),

            /// Uploaded File Preview
            if (frontFile != null) ...[
              Stack(
                children: [
                  Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  Positioned(
                    top: -6,
                    right: -6,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          frontFile = null;
                          frontName = null;
                          frontSize = null;
                        });
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black,
                        ),
                        child: const Icon(Icons.close, size: 16, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 6),

              Text(
                '${frontName ?? ''}\n${_formatSize(frontSize)}',
                style: const TextStyle(fontSize: 11, color: Colors.grey),
              ),
            ],

            const Spacer(),

            /// Done Button
            Container(
              padding: const EdgeInsets.only(bottom: 30),
              width: double.infinity,
              child: PrimaryButton(
                label: 'Done',
                height: 48,
                onPressed: () {
                  Get.offAll(DriverHomeScreen());
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  /// Instruction Row
  Widget _buildInstruction(String text) {
    return Row(
      children: [
        const Icon(Icons.check_circle, size: 18, color: Colors.black),
        const SizedBox(width: 8),
        Text(
          text,
          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  /// Pick Document
  Future<void> _pickDocument() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png', 'pdf'],
    );

    if (result == null || result.files.isEmpty) return;

    final picked = result.files.first;
    final path = picked.path;
    if (path == null) return;

    setState(() {
      frontFile = File(path);
      frontName = picked.name;
      frontSize = picked.size;
    });
  }

  String _formatSize(int? bytes) {
    if (bytes == null) return '';
    return '${(bytes / 1024).toStringAsFixed(0)}kb';
  }
}
