import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taxi_app/client_app/features/chat/views/chat_discussion.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Back + Chat Title (Centered)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () => Get.back(),
                  ),
                  const Spacer(),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Text(
                      "Chat",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const Spacer(),
                  const SizedBox(width: 48), // to balance the back button space
                ],
              ),
            ),

            const SizedBox(height: 10),

            // Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Container(
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 12),
                    Icon(Icons.search, color: Colors.grey.shade600, size: 22),
                    const SizedBox(width: 10),
                    const Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Search Driver",
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Chat List
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  chatTile("Kendrick Anne", "Have A Nice Day", "16:30"),
                  chatTile("Short Day", "Thanks", "16:30"),
                  chatTile("Goodluck Asopa", "Payment Recieved", "16:30"),
                  chatTile("Finnly Lat", "Next Time", "16:30"),
                  chatTile("Charles Dickson", "Thanks", "16:30"),
                  chatTile("Kat", "Done", "16:30"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ──────────────────────────────────────────────
  // Chat List Tile (Exactly like screenshot)
  // ──────────────────────────────────────────────
  Widget chatTile(String name, String subtitle, String time) {
    return InkWell(
      onTap: () => Get.to(() => ChatDetailScreen(doctorName: "Doc. Kongnyuy")),
      child: Container(
        margin: const EdgeInsets.only(left: 12, right: 12, bottom: 10),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            // Avatar
            Container(
              width: 46,
              height: 46,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFDDEFF8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(6),
                child: Image.asset(
                  "assets/booking/profile.png", // replace with your driver avatar
                  fit: BoxFit.contain,
                ),
              ),
            ),

            const SizedBox(width: 14),

            // Name & Message
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),

            // Time
            Text(
              time,
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey.shade700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
