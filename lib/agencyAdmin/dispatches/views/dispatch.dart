import 'package:flutter/material.dart';
import 'package:taxi_app/theme/colors.dart';
import 'package:taxi_app/client_app/authentication/widgets/primary_button.dart';

class DispatchScreen extends StatelessWidget {
  const DispatchScreen({Key? key}) : super(key: key);

  Widget _filterRow(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8), border: Border.all(color: Colors.grey.shade300)),
              child: Row(children: const [Icon(Icons.search, color: Colors.grey), SizedBox(width: 8), Expanded(child: Text('Search', style: TextStyle(color: Colors.black54)))]),
            ),
          ),
          const SizedBox(width: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8), border: Border.all(color: Colors.grey.shade300)),
            child: Row(children: const [Text('Status', style: TextStyle(color: Colors.black87)), SizedBox(width: 6), Icon(Icons.arrow_drop_down)]),
          ),
        ],
      ),
    );
  }

  Widget _dispatchCard(BuildContext context, {required String code, required String line1, required String line2, bool highlighted = false, String? rightLabel}) {
    final bg = highlighted ? AppColors.primaryColor : Colors.white;
    final textColor = highlighted ? Colors.white : Colors.black87;
    final rightTextColor = highlighted ? Colors.white : Colors.black54;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(8), border: Border.all(color: Colors.grey.shade200)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(code, style: TextStyle(fontWeight: FontWeight.w700, color: textColor)), const SizedBox(height: 6), Text(line1, style: TextStyle(color: textColor)), const SizedBox(height: 2), Text(line2, style: TextStyle(color: textColor))]),
          const Spacer(),
          if (rightLabel != null) Text(rightLabel, style: TextStyle(color: rightTextColor, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final items = List.generate(6, (i) => {
      'code': 'JKEJHD',
      'l1': 'Destiny City',
      'l2': 'St Nyobe Town Lefteg'
    });

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
        title: const Text('Assign Driver', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w600)),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
              child: SizedBox(width: double.infinity, child: PrimaryButton(label: 'New Dispatch', onPressed: () {})),
            ),

            // map preview
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              height: 220,
              decoration: BoxDecoration(color: Colors.grey.shade100, borderRadius: BorderRadius.circular(8), border: Border.all(color: Colors.grey.shade200)),
              child: Stack(
                children: [
                  Positioned.fill(child: Image.asset('assets/booking/booking.jpg', fit: BoxFit.cover)),
                  // mock route and pin
                  Positioned(left: 28, top: 40, child: Icon(Icons.location_on, color: AppColors.primaryColor, size: 28)),
                  Positioned(left: 56, top: 110, right: 56, child: Container(height: 3, color: Colors.transparent)),
                  Center(child: Text('Sarahl Avenue', style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w600))),
                ],
              ),
            ),

            const SizedBox(height: 12),
            _filterRow(context),

            // list
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, i) {
                  final itm = items[i];
                  final highlighted = i == 1;
                  final rightLabel = highlighted ? 'Not assigned' : (i == 2 ? 'Christopher Tine' : 'Not assigned');
                  return _dispatchCard(context, code: itm['code']!, line1: itm['l1']!, line2: itm['l2']!, highlighted: highlighted, rightLabel: rightLabel);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
