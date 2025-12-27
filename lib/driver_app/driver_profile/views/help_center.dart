import 'package:flutter/material.dart';
import 'package:taxi_app/client_app/authentication/widgets/auth_text_field.dart';

import '../../../theme/colors.dart';

class HelpCenterScreen extends StatefulWidget {
  const HelpCenterScreen({Key? key}) : super(key: key);

  @override
  State<HelpCenterScreen> createState() => _HelpCenterScreenState();
}

class _HelpCenterScreenState extends State<HelpCenterScreen> with SingleTickerProviderStateMixin {
  final TextEditingController _searchController = TextEditingController();
  late TabController _tabController;
  final List<String> _chips = ['All', 'Services', 'General'];
  String _selectedChip = 'All';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
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
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Help center', style: TextStyle(color: Colors.black87)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
        child: Column(
          children: [
            AuthTextField(hint: 'Search', controller: _searchController),
            const SizedBox(height: 22),
            TabBar(
              controller: _tabController,
              indicatorColor: AppColors.primaryColor,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.black54,
              tabs: const [Tab(
                  text: 'FAQ'
              ), Tab(text: 'Contact us')],
            ),
            const SizedBox(height: 20),
            // chips
            SizedBox(
              height: 36,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, i) {
                  final chip = _chips[i];
                  final active = chip == _selectedChip;
                  return GestureDetector(
                    onTap: () => setState(() => _selectedChip = chip),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        // color: active ? Theme.of(context).primaryColor.withOpacity(0.12) : Colors.grey.shade200,
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(chip, style: TextStyle(color: active ? AppColors.primaryColor : Colors.black54)),
                    ),
                  );
                },
                separatorBuilder: (_, __) => const SizedBox(width: 8),
                itemCount: _chips.length,
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _faqView(),
                  // const SizedBox(height: 15,),
                  _contactList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _faqView() {
    return ListView(
      children: [
        _faqTile('What If I Need To Cancel A Booking?', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus.'),
        _faqTile('How To Cancel Taxi', ''),
        _faqTile('Will I Be Refunded', ''),
      ],
    );
  }

  Widget _faqTile(String title, String content) {
    return ExpansionTile(
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
      children: content.isNotEmpty ? [Padding(padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8), child: Text(content, style: const TextStyle(color: Colors.black54)))] : [],
    );
  }

  Widget _contactList() {
    final items = [
      {'icon': Icons.headset_mic, 'label': 'Customer service'},
      {'icon': Icons.headset_mic, 'label': 'Whatsapp'},
      {'icon': Icons.language, 'label': 'Website'},
      {'icon': Icons.facebook, 'label': 'Facebook'},
      {'icon': Icons.headset_mic, 'label': 'Twitter'},
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
