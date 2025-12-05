import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:taxi_app/client_app/authentication/widgets/primary_button.dart';
import 'package:taxi_app/client_app/features/saved_places/views/vip_70_sitter.dart';

class MatheaExpressScreen extends StatefulWidget {
  const MatheaExpressScreen({super.key});

  @override
  State<MatheaExpressScreen> createState() => _MatheaExpressScreenState();
}

class _MatheaExpressScreenState extends State<MatheaExpressScreen> {
  String branch = "Unity Town FitasY";
  String when = "Today";
  String dateTime = "Thur 12/06 - 10AM";
  String departure = "Yaounde";
  String destination = "Maroua";

  int selectedBus = -1;
  int selectedTab = 0; // 0 = Classic, 1 = VIP, 2 = Chatter

  final List<Map<String, dynamic>> buses = [
    {
      "code": "AUJE38UY",
      "seats": "70 Seats",
      "price": "\$20",
      "route": "Pius Green",
    },
    {
      "code": "LKE987PK",
      "seats": "55 Seats",
      "price": "\$30",
      "route": "Fernando Ferine",
    },
    {
      "code": "AUJE38UY",
      "seats": "70 Seats",
      "price": "\$20",
      "route": "Pius Green",
    },
    {
      "code": "LKE987PK",
      "seats": "55 Seats",
      "price": "\$30",
      "route": "Fernando Ferine",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            /// ---------------- TOP BAR ----------------
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.arrow_back_ios, size: 20),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    "Mathea express",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
            ),

            /// ---------------- TAB BAR ----------------
            Container(
              height: 45,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  tabItem("Classic", 0),
                  tabItem("VIP", 1),
                  tabItem("Chatter", 2),
                ],
              ),
            ),

            /// ---------------- MAIN CONTENT ----------------
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: selectedTab == 0
                      ? classicUI()
                      : selectedTab == 1
                      ? vipUI()
                      : chatterUI(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --------------------------------------------------------
  // TAB ITEM
  // --------------------------------------------------------
  Widget tabItem(String text, int index) {
    final bool active = selectedTab == index;

    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => selectedTab = index),
        child: Column(
          children: [
            Text(
              text,
              style: TextStyle(
                fontSize: 16,
                color: active ? const Color(0xff0A6C72) : Colors.grey,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 3),
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: active ? 3 : 0,
              width: 25,
              decoration: BoxDecoration(
                color: const Color(0xff0A6C72),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --------------------------------------------------------
  // CLASSIC UI (Original Grid Style)
  // --------------------------------------------------------
  Widget classicUI() {
    return Column(
      key: const ValueKey("classic"),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),

        dropdownLabel("Branch"),
        dropdownBox(branch, ["Unity Town FitasY", "Unity Center", "Main Branch"],
                (v) => setState(() => branch = v)),

        const SizedBox(height: 14),

        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  dropdownLabel("When?"),
                  dropdownBox(when, ["Today", "Tomorrow", "Next Week"],
                          (v) => setState(() => when = v)),
                ],
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  dropdownLabel("Chose Date & Time"),
                  dropdownBox(
                      dateTime,
                      [
                        "Thur 12/06 - 10AM",
                        "Fri 14/06 - 6PM",
                        "Sat 15/06 - 8AM"
                      ],
                          (v) => setState(() => dateTime = v)),
                ],
              ),
            )
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  dropdownLabel("Departure Town"),
                  dropdownBox(
                    departure,
                    ["Yaounde", "Douala", "Bamenda"],
                        (v) => setState(() => departure = v),
                  ),
                ],
              ),
            ),

            const SizedBox(width: 14),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  dropdownLabel("Destination"),
                  dropdownBox(
                    destination,
                    ["Maroua", "Garoua", "Ngaoundere"],
                        (v) => setState(() => destination = v),
                  ),
                ],
              ),
            ),
          ],
        ),

        const SizedBox(height: 20),
        buildBusGrid(),

        const SizedBox(height: 20),
        continueButton(),

        const SizedBox(height: 30),
      ],
    );
  }

  // --------------------------------------------------------
  // VIP UI  (Dark Premium Style)
  // --------------------------------------------------------
  Widget vipUI() {
    return Column(
      key: const ValueKey("vip"),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),

        Text(
          "VIP Premium Rides",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.grey.shade800,
          ),
        ),

        const SizedBox(height: 8),

        Text(
          "Luxury, comfort & exclusive travel experience.",
          style: TextStyle(color: Colors.grey.shade600),
        ),

        const SizedBox(height: 20),

        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: buses.length,
          itemBuilder: (context, index) {
            final bus = buses[index];
            final selected = selectedBus == index;

            return GestureDetector(
              onTap: () => setState(() => selectedBus = index),
              child: Container(
                margin: const EdgeInsets.only(bottom: 14),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: selected ? Colors.amber : Colors.transparent,
                    width: 2,
                  ),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.directions_car_filled,
                        color: Colors.amber, size: 40),

                    const SizedBox(width: 14),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          bus["code"],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        Text(
                          bus["seats"],
                          style: const TextStyle(color: Colors.white70),
                        ),

                        Text(
                          bus["price"],
                          style: const TextStyle(
                            color: Colors.amber,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 6),

                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.amber.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Text(
                            "VIP",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.amber,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        ),

        const SizedBox(height: 20),
        continueButton(),

        const SizedBox(height: 40),
      ],
    );
  }

  // --------------------------------------------------------
  // CHATTER UI (Simple & Friendly)
  // --------------------------------------------------------
  Widget chatterUI() {
    return Column(
      key: const ValueKey("chatter"),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),

        Text(
          "Chatter Shared Rides",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.grey.shade800,
          ),
        ),

        const SizedBox(height: 8),

        Text(
          "Affordable shared rides with social shared seating.",
          style: TextStyle(color: Colors.grey.shade600),
        ),

        const SizedBox(height: 20),

        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: buses.length,
          itemBuilder: (context, index) {
            final bus = buses[index];
            final selected = selectedBus == index;

            return GestureDetector(
              onTap: () => setState(() => selectedBus = index),
              child: Container(
                margin: const EdgeInsets.only(bottom: 14),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFF4F9FF),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: selected ? const Color(0xff0A6C72) : Colors.transparent,
                    width: 2,
                  ),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.people_alt,
                        color: Color(0xff0A6C72), size: 40),

                    const SizedBox(width: 14),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          bus["code"],
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff0A6C72),
                          ),
                        ),
                        Text(
                          bus["seats"],
                          style: const TextStyle(color: Colors.black54),
                        ),
                        Text(
                          bus["price"],
                          style: const TextStyle(
                            color: Color(0xff0A6C72),
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        ),

        const SizedBox(height: 20),
        continueButton(),

        const SizedBox(height: 40),
      ],
    );
  }

  // --------------------------------------------------------
  // BUS GRID (Classic Tab)
  // --------------------------------------------------------
  Widget buildBusGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: buses.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 210,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemBuilder: (context, index) {
        final bus = buses[index];
        final bool selected = selectedBus == index;

        return GestureDetector(
          onTap: () => setState(() => selectedBus = index),
          child: Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: const Color(0xFFF1FAF9),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: selected ? const Color(0xff0A6C72) : Colors.transparent,
                width: 2,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(
                      Icons.directions_car_filled,
                      size: 40,
                      color: Color(0xff0A6C72),
                    ),
                    Container(
                      width: 18,
                      height: 18,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: const Color(0xff0A6C72), width: 2),
                        color: selected
                            ? const Color(0xff0A6C72)
                            : Colors.transparent,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10),

                Text(
                  bus["code"],
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                Text(bus["seats"], style: const TextStyle(color: Colors.grey)),

                Text(
                  bus["price"],
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff0A6C72),
                  ),
                ),

                const SizedBox(height: 6),
                Text(
                  bus["route"],
                  style: const TextStyle(color: Colors.grey),
                ),

                const SizedBox(height: 6),
                Row(
                  children: const [
                    Icon(Icons.wifi, size: 16, color: Color(0xff0A6C72)),
                    SizedBox(width: 4),
                    Icon(Icons.wc, size: 16, color: Color(0xff0A6C72)),
                    SizedBox(width: 4),
                    Icon(Icons.restaurant, size: 16, color: Color(0xff0A6C72)),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  // --------------------------------------------------------
  // CONTINUE BUTTON
  // --------------------------------------------------------
  Widget continueButton() {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: PrimaryButton(
          label: "Continue",
          onPressed: () {
            Get.to(Vip70SeaterScreen());
          }
      )
    );
  }

  // --------------------------------------------------------
  // DROPDOWNS + LABELS
  // --------------------------------------------------------
  Widget dropdownLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Text(
        text,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget dropdownBox(
      String value, List<String> items, Function(String) onChanged) {
    return Container(
      height: 48,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          value: value,
          icon: const Icon(Icons.arrow_drop_down),
          isExpanded: true,
          items: items
              .map((v) => DropdownMenuItem(
            value: v,
            child: Text(v),
          ))
              .toList(),
          onChanged: (v) => onChanged(v as String),
        ),
      ),
    );
  }
}
