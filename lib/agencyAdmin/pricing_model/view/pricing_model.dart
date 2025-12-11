import 'package:flutter/material.dart';

import '../../../client_app/authentication/widgets/auth_text_field.dart';

class PricingModelScreen extends StatelessWidget {
  const PricingModelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final primary = const Color(0xFF0F6F6A);
    final muted = Colors.grey.shade600;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.6,
        leading: IconButton(
          icon: const Icon(Icons.menu_rounded, color: Colors.black87),
          onPressed: () {},
        ),
        centerTitle: true,
        title: const Text(
          'Pricing model',
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w600),
        ),
        actions: [
          const SizedBox(width: 8),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top row: segmented buttons
              Row(
                children: [
                  Expanded(
                    child: _SegmentButton(
                      label: 'New Driver',
                      active: true,
                      color: primary,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _SegmentButton(
                      label: 'New Car',
                      active: false,
                      color: Colors.grey.shade400,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // small toggle chips for Kilometer based / Route based
              Row(
                children: [
                  Expanded(child: _ModeChip(label: 'Kilometer Based', active: true)),
                  const SizedBox(width: 12),
                  Expanded(child: _ModeChip(label: 'Route Based', active: false),)
                ],
              ),
              const SizedBox(height: 18),

              // Vehicle cards
              Row(
                children: const [
                  Expanded(child: VehicleCard(title: 'Comfort', seats: '59 Seats')),
                  SizedBox(width: 12),
                  Expanded(child: VehicleCard(title: 'VIP', seats: '59 Seats')),
                ],
              ),
              const SizedBox(height: 18),

              // Base fare section
              const SectionCard(
                title: 'Base Fare',
                child: AuthTextField(hint: "\$12")
                ,
              ),
              const SizedBox(height: 12),

              // Kilometer ranges area — we render two sample km ranges and an add button
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Kilometer', style: TextStyle(fontWeight: FontWeight.w600)),
                      const SizedBox(height: 8),

                      // Range 1
                      KmRangeRow(labelLeft: '\$12', labelRight: '\$20'),
                      const SizedBox(height: 10),

                      // Range 2
                      KmRangeRow(labelLeft: '\$15', labelRight: '\$25'),
                      const SizedBox(height: 12),

                      // Add button
                      OutlinedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.add, size: 18),
                        label: const Text('Add New Km Range'),
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          side: BorderSide(color: primary.withOpacity(0.1)),
                          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 12),

              // Extra section
              const SectionCard(
                title: 'Extra',
                child: ExtraFareRow(),
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

/// Small segment style button used top (New Driver / New Car)
class _SegmentButton extends StatelessWidget {
  final String label;
  final bool active;
  final Color color;

  const _SegmentButton({
    required this.label,
    required this.active,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: active ? color : Colors.grey.shade300,
        elevation: 0,
        padding: const EdgeInsets.symmetric(vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: active ? Colors.white : Colors.black87,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

/// Simple toggle-like chip (kilometer / route)
class _ModeChip extends StatelessWidget {
  final String label;
  final bool active;
  const _ModeChip({required this.label, required this.active});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: active ? const Color(0xFFDFF2F1) : Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: active ? const Color(0xFF9ED8D3) : Colors.grey.shade300),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: active ? const Color(0xFF0F6F6A) : Colors.grey.shade700,
          fontWeight: FontWeight.w600,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

/// Small vehicle card with icon and seats
class VehicleCard extends StatelessWidget {
  final String title;
  final String seats;
  const VehicleCard({required this.title, required this.seats, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        children: [
          Icon(Icons.directions_bus_filled, size: 42, color: Colors.grey.shade700),
          const SizedBox(height: 12),
          Text(title, style: const TextStyle(fontWeight: FontWeight.w700)),
          const SizedBox(height: 6),
          Text(seats, style: TextStyle(color: Colors.grey.shade600)),
        ],
      ),
    );
  }
}

/// Generic section card with title and child content
class SectionCard extends StatelessWidget {
  final String title;
  final Widget child;
  const SectionCard({required this.title, required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 10),
          child,
        ],
      ),
    );
  }
}

/// Row that shows two small input-like boxes for base fare.
class BaseFareRow extends StatelessWidget {
  const BaseFareRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: _MoneyBox(label: '\$12')),
        const SizedBox(width: 12),
        Expanded(child: _MoneyBox(label: '\$20')),
      ],
    );
  }
}

/// The km range row: left input, a "0 To 0" middle label, right input
class KmRangeRow extends StatelessWidget {
  final String labelLeft;
  final String labelRight;

  const KmRangeRow({required this.labelLeft, required this.labelRight, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: AuthTextField(hint: "\$12")
        ),
        const SizedBox(width: 8),

        const SizedBox(width: 8),
        Expanded(child: AuthTextField(hint: "\$20")
        ),
      ],
    );
  }
}

/// Extra fare section content
class ExtraFareRow extends StatelessWidget {
  const ExtraFareRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Expanded(child: _MoneyBox(label: '\$12')),
        SizedBox(width: 12),
        Expanded(child: _MoneyBox(label: '\$20')),
      ],
    );
  }
}

/// Small styled box used for currency / inputs (read-only placeholder)
class _MoneyBox extends StatelessWidget {
  final String label;
  const _MoneyBox({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Text(
        label,
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
    );
  }
}
