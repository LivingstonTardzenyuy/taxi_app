import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:taxi_app/agencyAdmin/drivers/views/reason_for_declining.dart';
import 'package:taxi_app/theme/colors.dart';
import 'package:taxi_app/client_app/authentication/widgets/primary_button.dart';

class DriverAddRequestScreen extends StatelessWidget {
  const DriverAddRequestScreen({Key? key}) : super(key: key);

  Widget _label(String text) {
    return Text(
        text,
        style: const TextStyle(
            color: Colors.black54,
            fontSize: 12
        )
    );
  }

  Widget _value(String text) {
    return Text(
        text,
        style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14
        )
    );
  }

  Widget _twoColumnRow(
      String leftLabel,
      String leftValue,
      String rightLabel,
      String rightValue
      ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _label(leftLabel),
                  const SizedBox(height: 4),
                  _value(leftValue),
                ]
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _label(rightLabel),
                  const SizedBox(height: 4),
                  _value(rightValue),
                ]
            ),
          ),
        ],
      ),
    );
  }

  Widget _docTile(String title, String asset) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                  image: AssetImage(asset),
                  fit: BoxFit.cover
              ),
            ),
          ),
        ),
        const SizedBox(height: 6),
        Text(
            title,
            style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 13
            )
        ),
      ],
    );
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
          child: IconButton(
              icon: const Icon(Icons.menu, color: Colors.black87),
              onPressed: () {}
          ),
        ),
        centerTitle: true,
        title: const Text(
            'New driver request',
            style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.w600
            )
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 18),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Driver Details box with bordered label
                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: AppColors.primaryColor,
                            width: 2
                        ),
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.white,
                      ),
                      padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _twoColumnRow(
                                'Name',
                                'Paul Axel',
                                'Email',
                                'Driver Email@Email.Com'
                            ),
                            _twoColumnRow(
                                'License Number',
                                '592432frg4324',
                                'Date Of Birth',
                                '12 Dec 2020'
                            ),
                            _twoColumnRow(
                                'Phone Number',
                                '+145 687 9654',
                                'Experience Years',
                                '14'
                            ),
                          ]
                      ),
                    ),
                    Positioned(
                      left: 12,
                      top: 0,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 2
                        ),
                        color: Colors.white,
                        child: Text(
                            'Driver Details',
                            style: TextStyle(
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 13
                            )
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                // Driver Documents section
                const Text(
                    'Driver Documents',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 15
                    )
                ),
                const SizedBox(height: 12),

                // 2-column grid of document cards
                GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  childAspectRatio: 0.95,
                  children: [
                    _docTile('License', 'assets/booking/booking.jpg'),
                    _docTile('ID Card', 'assets/booking/booking.jpg'),
                    _docTile('Bank', 'assets/booking/booking.jpg'),
                    _docTile('NDA', 'assets/booking/booking.jpg'),
                  ],
                ),

                const SizedBox(height: 24),

                // Action buttons
                Row(
                    children: [
                      Expanded(
                              child: OutlinedButton(
                                onPressed: () => _showDeclineSheet(context),
                                style: OutlinedButton.styleFrom(
                                  backgroundColor: Colors.grey.shade300,
                                  foregroundColor: Colors.black87,
                                  padding: const EdgeInsets.symmetric(vertical: 14),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30)
                                  ),
                                  side: BorderSide.none,
                                ),
                                child: const Text(
                                    'Decline',
                                    style: TextStyle(fontWeight: FontWeight.w600)
                                ),
                              ),
                            ),
                      const SizedBox(width: 12),
                      Expanded(
                          child: PrimaryButton(
                              label: 'Accept',
                              onPressed: () {
                                // Handle accept action
                                Get.to(ReasonForDecliningScreen());
                              }
                          )
                      ),
                    ]
                ),

                const SizedBox(height: 16),
              ]
          ),
        ),
      ),
    );
  }

  void _showDeclineSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) {
        int selected = 0;
        final TextEditingController otherCtrl = TextEditingController();

        return StatefulBuilder(builder: (context, setState) {
          Widget radioItem(int idx, String text) => InkWell(
                onTap: () => setState(() => selected = idx),
                child: Row(children: [
                  Radio<int>(value: idx, groupValue: selected, onChanged: (v) => setState(() => selected = v!)),
                  const SizedBox(width: 8),
                  Expanded(child: Text(text)),
                ]),
              );

          return Padding(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              decoration: const BoxDecoration(borderRadius: BorderRadius.vertical(top: Radius.circular(18)), color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 20),
                child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
                  const SizedBox(height: 6),
                  Row(children: [
                    IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.arrow_back)),
                    const Expanded(child: Center(child: Text('Reason for declining', style: TextStyle(fontWeight: FontWeight.w600)))),
                    const SizedBox(width: 48),
                  ]),
                  const SizedBox(height: 12),
                  const Text('Please select the reason for declining', style: TextStyle(fontSize: 16)),
                  const SizedBox(height: 18),
                  radioItem(0, 'Car Too Old'),
                  radioItem(1, 'Documents Not Complete'),
                  radioItem(2, 'Agency Full'),
                  radioItem(3, 'Other'),
                  const SizedBox(height: 14),
                  const Text('Other', style: TextStyle(fontWeight: FontWeight.w600)),
                  const SizedBox(height: 8),
                  TextField(
                    controller: otherCtrl,
                    maxLines: 4,
                    decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)), hintText: 'Placeholder'),
                  ),
                  const SizedBox(height: 18),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Future.delayed(const Duration(milliseconds: 150), () => _showSuccessSheet(context));
                      },
                      style: ElevatedButton.styleFrom(backgroundColor: AppColors.primaryColor, padding: const EdgeInsets.symmetric(vertical: 14), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
                      child: const Text('Cancel Ride', style: TextStyle(fontWeight: FontWeight.w600)),
                    ),
                  ),
                ]),
              ),
            ),
          );
        });
      },
    );
  }

  void _showSuccessSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (ctx) => Container(
        decoration: const BoxDecoration(borderRadius: BorderRadius.vertical(top: Radius.circular(18)), color: Colors.white),
        padding: const EdgeInsets.fromLTRB(16, 24, 16, 20),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Container(width: 40, height: 4, decoration: BoxDecoration(color: Colors.grey.shade300, borderRadius: BorderRadius.circular(4))),
          const SizedBox(height: 18),
          Container(width: 72, height: 72, decoration: BoxDecoration(color: AppColors.primaryColor, shape: BoxShape.circle), child: const Icon(Icons.check, color: Colors.white, size: 36)),
          const SizedBox(height: 14),
          const Text('Reason Sent Successfully', style: TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 18),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(backgroundColor: AppColors.primaryColor, padding: const EdgeInsets.symmetric(vertical: 14), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
              child: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
            ),
          ),
        ]),
      ),
    );
  }
}