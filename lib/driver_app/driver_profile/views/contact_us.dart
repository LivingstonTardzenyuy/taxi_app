import 'package:flutter/material.dart';
import 'package:taxi_app/client_app/authentication/widgets/auth_text_field.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> with SingleTickerProviderStateMixin {
  final TextEditingController _searchController = TextEditingController();
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.index = 1; // show Contact Us by default for this screen
  }

  @override
  void dispose() {
    _searchController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(icon: const Icon(Icons.arrow_back, color: Colors.black87), onPressed: () => Navigator.of(context).pop()),
        title: const Text('Contact us', style: TextStyle(color: Colors.black87)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
        child: Column(
          children: [
            AuthTextField(hint: 'Search', controller: _searchController),
            const SizedBox(height: 12),
            TabBar(controller: _tabController, tabs: const [Tab(text: 'FAQ'), Tab(text: 'Contact Us')], indicatorColor: Theme.of(context).primaryColor, labelColor: Theme.of(context).primaryColor, unselectedLabelColor: Colors.black54),
            const SizedBox(height: 12),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  // FAQ placeholder
                  Center(child: Text('FAQ content - use Help center screen for full FAQ', style: TextStyle(color: Colors.black54))),
                  _contactList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _contactList() {
    final items = [
      {'icon': Icons.headset_mic, 'label': 'Customer service'},
      {'icon': Icons.whatsapp, 'label': 'Whatsapp'},
      {'icon': Icons.language, 'label': 'Website'},
      {'icon': Icons.facebook, 'label': 'Facebook'},
      {'icon': Icons.twitter, 'label': 'Twitter'},
      {'icon': Icons.camera_alt, 'label': 'Instagram'},
    ];

    return ListView.separated(
      itemCount: items.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, i) {
        final it = items[i];
        return GestureDetector(
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8), border: Border.all(color: const Color(0xFFECECEC))),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Row(children: [Icon(it['icon'] as IconData, color: Colors.black54), const SizedBox(width: 12), Text(it['label'] as String, style: const TextStyle(color: Colors.black87))]), const Icon(Icons.arrow_forward_ios, color: Colors.black54)]),
          ),
        );
      },
    );
  }
}
