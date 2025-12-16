import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:taxi_app/client_app/authentication/widgets/auth_text_field.dart';
import 'package:taxi_app/client_app/authentication/widgets/primary_button.dart';
import 'package:taxi_app/driver_app/driver_profile/views/update_documents.dart';

class PersonalInfoScreen extends StatefulWidget {
  const PersonalInfoScreen({Key? key}) : super(key: key);

  @override
  State<PersonalInfoScreen> createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
  final TextEditingController _nameController = TextEditingController(text: 'Kendrick Anne');
  final TextEditingController _phoneController = TextEditingController(text: '+123 455 6578 1212');
  final TextEditingController _emailController = TextEditingController(text: 'Email@Email.Com');

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    super.dispose();
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
        title: const Text('Your profile', style: TextStyle(color: Colors.black87)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
        child: Column(
          children: [
            const SizedBox(height: 8),
            const CircleAvatar(radius: 42, backgroundColor: Color(0xFFE0F7F7), child: Icon(Icons.person, size: 40, color: Colors.white)),
            const SizedBox(height: 8),
            Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4), decoration: BoxDecoration(color: const Color(0xFFE0F7F7), borderRadius: BorderRadius.circular(16)), child: const Text('EDIT', style: TextStyle(fontSize: 12, color: Colors.black54))),
            const SizedBox(height: 12),

            AuthTextField(hint: 'Name', controller: _nameController),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(child: AuthTextField(hint: 'Phone', controller: _phoneController)),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.all(15),
                  height: 55,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: Colors.grey
                    )
                  ),
                  child: InkWell(
                    onTap: () {},
                    child: Text('Change'),
                  ),
                )
                // ElevatedButton(onPressed: () {}, style: ElevatedButton.styleFrom(backgroundColor: Colors.white, foregroundColor: Colors.black87), child: const Text('Change'))
              ],
            ),
            const SizedBox(height: 12),
            AuthTextField(hint: 'Email', controller: _emailController),
            const SizedBox(height: 12),
            GestureDetector(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8), border: Border.all(color: const Color(0xFFECECEC))),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: const [Text('City You Drive In', style: TextStyle(color: Colors.black87)), Icon(Icons.arrow_drop_down, color: Colors.black54)]),
              ),
            ),
            const SizedBox(height: 12),
            GestureDetector(
              onTap: () => Navigator.of(context).pushNamed('/driver/profile/documents'),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8), border: Border.all(color: const Color(0xFFECECEC))),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: const [Text('Update Document Details', style: TextStyle(color: Colors.black87)), Icon(Icons.arrow_forward_ios, color: Colors.black54)]),
              ),
            ),
            const Spacer(),
            Container(
              width: double.infinity,
              child: Padding(
                  padding: const EdgeInsets.only(bottom: 55),
                  child: PrimaryButton(
                      label: "Update",
                      onPressed: () {
                        Get.to(UpdateDocumentsScreen());
                      }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
