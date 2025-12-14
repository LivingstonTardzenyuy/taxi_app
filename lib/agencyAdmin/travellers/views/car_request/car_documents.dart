import 'package:flutter/material.dart';
import 'package:taxi_app/client_app/authentication/widgets/primary_button.dart';

class CarDocuments extends StatelessWidget {
  const CarDocuments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final docs = ['Car PUC', 'Car Insurance', 'Car Registration Certificate', 'Car Permit'];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Car documents', style: TextStyle(color: Colors.black87)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) => ListTile(
                  title: Text(docs[index]),
                  trailing: const Icon(Icons.chevron_right),
                  tileColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  onTap: () {
                    // TODO: open document upload/view
                  },
                ),
                separatorBuilder: (context, index) => const SizedBox(height: 12),
                itemCount: docs.length,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: SizedBox(
                height: 52,
                child: PrimaryButton(
                  label: 'Done',
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
