import 'package:flutter/material.dart';
import 'package:taxi_app/client_app/authentication/widgets/auth_text_field.dart';
import 'package:taxi_app/client_app/authentication/widgets/primary_button.dart';
import 'package:taxi_app/theme/colors.dart';

class CreateSubAdminScreen extends StatefulWidget {
  const CreateSubAdminScreen({Key? key}) : super(key: key);

  @override
  State<CreateSubAdminScreen> createState() => _CreateSubAdminScreenState();
}

class _CreateSubAdminScreenState extends State<CreateSubAdminScreen> {
  final TextEditingController _nameCtrl = TextEditingController();
  final TextEditingController _emailCtrl = TextEditingController();
  final TextEditingController _passwordCtrl = TextEditingController();
  final TextEditingController _confirmCtrl = TextEditingController();

  @override
  void dispose() {
    _nameCtrl.dispose();
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
    _confirmCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
        title: const Text('Profile', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w600)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50,),
              const Text('Create Sub Admin', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
              const SizedBox(height: 18),
              Row(
                children: [
                  Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(shape: BoxShape.circle, color: AppColors.onboardingColor),
                    child: const CircleAvatar(radius: 28, backgroundColor: Colors.transparent, child: Icon(Icons.person, size: 36, color: Colors.white)),
                  ),
                  const SizedBox(width: 12),
                  Container(
                    child: PrimaryButton(

                        label: "Upload New",
                        onPressed: () {

                        }),
                  )
                ],
              ),

              const SizedBox(height: 18),

              const Text('Full name', style: TextStyle(fontWeight: FontWeight.w600)),
              const SizedBox(height: 8),
              AuthTextField(hint: 'Full name'),

              const SizedBox(height: 12),
              const Text('Email', style: TextStyle(fontWeight: FontWeight.w600)),
              const SizedBox(height: 8),
              AuthTextField(hint: 'Email@outlook.com'),

              const SizedBox(height: 12),
              const Text('Password', style: TextStyle(fontWeight: FontWeight.w600)),
              const SizedBox(height: 8),
              AuthTextField(hint: '*******', obscure: true),

              const SizedBox(height: 12),
              const Text('Confirm password', style: TextStyle(fontWeight: FontWeight.w600)),
              const SizedBox(height: 8),
              AuthTextField(hint: '*******', obscure: true),

              const SizedBox(height: 22),

              SizedBox(
                width: double.infinity,
                child: PrimaryButton(
                  label: 'Create Sub Admin',
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Sub admin created (mock)')));
                    Navigator.of(context).pop();
                  },
                ),
              ),
              const SizedBox(height: 20),
              Center(child: Container(width: 56, height: 6, decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(6)))),
            ],
          ),
        ),
      ),
    );
  }
}
