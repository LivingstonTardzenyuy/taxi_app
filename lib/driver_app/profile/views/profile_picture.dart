import 'dart:io';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:taxi_app/client_app/authentication/widgets/primary_button.dart';
import 'package:taxi_app/driver_app/profile/views/bank_account.dart';

class ProfilePictureScreen extends StatefulWidget {
  const ProfilePictureScreen({Key? key}) : super(key: key);

  @override
  State<ProfilePictureScreen> createState() => _ProfilePictureScreenState();
}

class _ProfilePictureScreenState extends State<ProfilePictureScreen> {
  File? pictureFile;
  String? pictureName;
  int? pictureSize;

  Future<void> _pickPicture() async {
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
      pictureFile = File(path);
      pictureName = picked.name;
      pictureSize = picked.size;
    });
  }

  String _formatBytes(int bytes, [int decimals = 1]) {
    if (bytes <= 0) return '0 B';
    const suffixes = ['B', 'KB', 'MB', 'GB', 'TB'];
    var i = (math.log(bytes) / math.log(1024)).floor();
    return ((bytes / math.pow(1024, i)).toStringAsFixed(decimals)) + ' ' + suffixes[i];
  }

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
        title: const Text('Profile picture', style: TextStyle(color: Colors.black87)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 38),
            _buildBullet('Please Upload A Clear Selfie'),
            const SizedBox(height: 12),
            _buildBullet('The Selfie Should Have The Applicant\'s Face Alone'),
            const SizedBox(height: 12),
            _buildBullet('Upload PDF/JPEG/PNG'),
            const SizedBox(height: 14),

            GestureDetector(
              onTap: _pickPicture,
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
            if (pictureFile != null)
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
                              child: Image.file(pictureFile!, fit: BoxFit.cover),
                            ),
                          ),
                          Positioned(
                            right: 0,
                            top: 0,
                            child: GestureDetector(
                              onTap: () => setState(() { pictureFile = null; pictureName = null; pictureSize = null; }),
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
                      Expanded(child: Text('${pictureName ?? ''}\n${pictureSize != null ? _formatBytes(pictureSize!) : ''}', style: const TextStyle(fontSize: 12, color: Colors.black54))),
                    ],
                  ),
                  const SizedBox(height: 18),
                ],
              ),

            const Spacer(),
            Container(
              padding: const EdgeInsets.only(bottom: 35),
              child: SizedBox(
                width: double.infinity,
                height: 52,
                child: PrimaryButton(
                  label: 'Update',
                  onPressed: () {
                    Get.to(BankAccountScreen());
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
        Expanded(child: Text(text, style: const TextStyle(fontSize: 15, color: Colors.black87))),
      ],
    );
  }
}
