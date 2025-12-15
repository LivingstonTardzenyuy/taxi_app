import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
// no direct AppColors usage here yet
import 'package:taxi_app/client_app/authentication/widgets/primary_button.dart';
import '../../../agencyAdmin/admin_payment/view/confirm_card.dart';
import '../../../client_app/authentication/widgets/auth_text_field.dart';
import '../../../theme/colors.dart';

class AddCardDriverScreen extends StatefulWidget {
  const AddCardDriverScreen({Key? key}) : super(key: key);

  @override
  State<AddCardDriverScreen> createState() => _AddCardDriverScreenState();
}

class _AddCardDriverScreenState extends State<AddCardDriverScreen> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _number = TextEditingController();
  final TextEditingController _expiry = TextEditingController();
  final TextEditingController _cvv = TextEditingController();
  bool _saveCard = false;

  @override
  void dispose() {
    _name.dispose();
    _number.dispose();
    _expiry.dispose();
    _cvv.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.6,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        title: const Text('Add card', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w600)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Card visual
              Container(
                width: double.infinity,
                height: 160,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: const LinearGradient(
                    colors: [AppColors.primaryColor, AppColors.primaryColor],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        'VISA',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 30,
                        ),
                      ),
                    ),

                    Text(
                      '**** **** **** 7223',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        letterSpacing: 2,
                      ),
                    ),

                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: const [
                              Text('Card Holder',
                                  style: TextStyle(color: Colors.grey, fontSize: 12)),
                              SizedBox(height: 4),
                              Text('Tim Timothy',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.white70)),
                            ],
                          ),
                        ),
                        Spacer(),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: const [
                                // Text('Expiry',
                                Text('Expiry',
                                    style: TextStyle(color: Colors.grey, fontSize: 12)),
                                SizedBox(height: 4),
                                Text('03/26',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w800,
                                        color: Colors.white70)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),


              const SizedBox(height: 18),

              const Text(
                  'Card holder name',
                  style: TextStyle(fontWeight: FontWeight.w600)),
              const SizedBox(height: 8),
              AuthTextField(hint: 'Mr Mccall',
                controller: _name,
              ),

              const SizedBox(height: 12),
              const Text('Card number', style: TextStyle(fontWeight: FontWeight.w600)),
              const SizedBox(height: 8),
              AuthTextField(hint: '5665 545 8996',
                controller: _number,
                keyboardType: TextInputType.number,),

              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Expiry date', style: TextStyle(fontWeight: FontWeight.w600)),
                        const SizedBox(height: 8),
                        AuthTextField(

                          hint: '12/12', controller: _expiry,
                          keyboardType: TextInputType.datetime,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('CVV', style: TextStyle(fontWeight: FontWeight.w600)),
                        const SizedBox(height: 8),
                        AuthTextField(hint: '000',
                          controller: _cvv,
                          keyboardType: TextInputType.number,
                          obscure: true,
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.grey
                    )
                ),
                child: CheckboxListTile(
                  value: _saveCard,
                  contentPadding: EdgeInsets.zero,
                  onChanged: (v) => setState(() => _saveCard = v ?? false),
                  title: const Text('Save Card'),
                  controlAffinity: ListTileControlAffinity.leading,
                ),
              ),

              const SizedBox(height: 150,),
              Container(
                width: double.infinity,
                child: PrimaryButton(
                  label: 'Save',
                  onPressed: () {
                    // TODO: perform validation and submit card to backend
                    Get.to(ConfirmCard());
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
