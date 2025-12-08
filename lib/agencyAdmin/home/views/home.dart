// lib/main.dart
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import '../../widgets/drawer.dart';

class AdminDashboardScreen extends StatelessWidget {
  AdminDashboardScreen({super.key});
  final GlobalKey<ScaffoldState> adminScaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: adminScaffoldKey,
      drawer: const AdminDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Icon(Icons.menu, size: 78, color: Colors.black,),
                    IconButton(
                      icon: const Icon(Icons.menu, color: Colors.black, size: 28),
                      onPressed: () => adminScaffoldKey.currentState!.openDrawer(),
                    ),
                    const Icon(Icons.search, size: 26),
                  ],
                ),

                const SizedBox(height: 20),

                Row(
                  children: [
                    Expanded(
                      child: _smallStatCard(
                        icon: Icons.people_alt_outlined,
                        title: "Passengers",
                        percentChange: "+15%",
                        value: "545",
                        percentColor: Colors.green,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _smallStatCard(
                        icon: Icons.attach_money,
                        title: "Earnings",
                        percentChange: "+25%",
                        value: "\$3,568",
                        percentColor: Colors.green,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                _chartContainer(
                  title: "Earnings",
                  amount: "\$1,050,000",
                  chart: SizedBox(
                    height: 240,
                    child: _earningsLineChart(),
                  ),
                ),

                const SizedBox(height: 20),

                _chartContainer(
                  title: "Route Passengers",
                  amount: "654",
                  chart: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: 240, child: _routePieChart()),
                      const SizedBox(height: 12),
                      _pieLegend(),
                    ],
                  ),
                ),

                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//
// SMALL STAT CARD
//
Widget _smallStatCard({
  required IconData icon,
  required String title,
  required String percentChange,
  required String value,
  required Color percentColor,
}) {
  return Container(
    padding: const EdgeInsets.all(14),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 8,
          offset: const Offset(0, 3),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon),
            const SizedBox(width: 8),
            Text(
              title,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Icon(
              percentColor == Colors.green ? Icons.arrow_upward : Icons.arrow_downward,
              size: 15,
              color: percentColor,
            ),
            const SizedBox(width: 6),
            Text(
              percentChange,
              style: TextStyle(
                color: percentColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        Text(
          value,
          style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}

//
// CHART CONTAINER
//
Widget _chartContainer({
  required String title,
  required String amount,
  required Widget chart,
}) {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 8,
          offset: const Offset(0, 3),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),

        const SizedBox(height: 4),

        Text(
          amount,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),

        const SizedBox(height: 12),

        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: ["1D", "1M", "1Y", "Max"].map((e) => _filterChip(e)).toList(),
        ),

        const SizedBox(height: 12),
        chart,
      ],
    ),
  );
}

Widget _filterChip(String text) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
    margin: const EdgeInsets.only(left: 6),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey.shade300),
      borderRadius: BorderRadius.circular(8),
    ),
    child: Text(text, style: const TextStyle(fontSize: 13)),
  );
}

//
// LINE CHART
//
Widget _earningsLineChart() {
  const week = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];

  return LineChart(
    LineChartData(
      minX: 0,
      maxX: 6,
      minY: 0,
      maxY: 100,

      titlesData: FlTitlesData(
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            reservedSize: 26,
            getTitlesWidget: (value, meta) {
              int i = value.toInt();
              if (i < 0 || i >= week.length) return const SizedBox.shrink();

              return SideTitleWidget(
                meta: meta,
                child: Text(week[i], style: const TextStyle(fontSize: 10)),
              );
            },
          ),
        ),

        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 25,
            reservedSize: 36,
            getTitlesWidget: (value, meta) {
              return SideTitleWidget(
                meta: meta,
                child: Text(value.toInt().toString(), style: const TextStyle(fontSize: 10)),
              );
            },
          ),
        ),

        rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
      ),

      borderData: FlBorderData(
        show: true,
        border: const Border(
          left: BorderSide(color: Colors.grey),
          bottom: BorderSide(color: Colors.grey),
        ),
      ),

      gridData: FlGridData(
        show: true,
        horizontalInterval: 25,
        drawVerticalLine: false,
        getDrawingHorizontalLine: (value) => FlLine(
          color: Colors.grey.withOpacity(.18),
          strokeWidth: 1,
        ),
      ),

      lineBarsData: [
        _lineBar(Colors.blue, [30, 50, 40, 75, 20, 60, 90]),
        _lineBar(Colors.orange, [50, 40, 70, 30, 55, 20, 60]),
        _lineBar(Colors.green, [20, 35, 30, 60, 40, 30, 50]),
        _lineBar(Colors.purple, [10, 20, 15, 35, 25, 45, 30]),
      ],
    ),
  );
}

LineChartBarData _lineBar(Color color, List<double> values) {
  return LineChartBarData(
    isCurved: true,
    color: color,
    barWidth: 3,
    dotData: const FlDotData(show: false),
    spots: [
      for (int i = 0; i < values.length; i++) FlSpot(i.toDouble(), values[i]),
    ],
  );
}

//
// PIE CHART
//
Widget _routePieChart() {
  return PieChart(
    PieChartData(
      centerSpaceRadius: 48,
      sectionsSpace: 3,
      sections: [
        _pieSection(Colors.purple, 40, "40%"),
        _pieSection(Colors.orange, 30, "30%"),
        _pieSection(Colors.green, 15, "15%"),
        _pieSection(Colors.blue, 15, "15%"),
      ],
    ),
  );
}

PieChartSectionData _pieSection(Color color, double value, String title) {
  return PieChartSectionData(
    color: color,
    value: value,
    radius: 45,
    title: title,
    titleStyle: const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    titlePositionPercentageOffset: 0.6,
  );
}

//
// PIE LEGEND
//
Widget _pieLegend() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: const [
      _LegendItem(color: Colors.purple, text: "Yaounde - Douala"),
      SizedBox(height: 6),
      _LegendItem(color: Colors.orange, text: "Douala - Bamenda"),
      SizedBox(height: 6),
      _LegendItem(color: Colors.green, text: "Douala - Garoua"),
      SizedBox(height: 6),
      _LegendItem(color: Colors.blue, text: "Bafoussam - Yaounde"),
    ],
  );
}

class _LegendItem extends StatelessWidget {
  final Color color;
  final String text;

  const _LegendItem({required this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 8),
        Text(text, style: const TextStyle(fontSize: 14)),
      ],
    );
  }
}
