import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SummaryBarChart extends StatelessWidget {
  const SummaryBarChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Summary:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        const Gap(20),
        SizedBox(
          height: 150,
          child: BarChart(
            BarChartData(
              borderData: FlBorderData(show: false),
              titlesData: const FlTitlesData(show: false),
              barGroups: [
                _barGroup(0, 5, const Color(0xFFE1BEE7)),
                _barGroup(1, 8, const Color(0xFFC8E6C9)),
                _barGroup(2, 12, const Color(0xFFFFD166)),
                _barGroup(3, 10, const Color(0xFFFDE1E6)),
                _barGroup(4, 6, const Color(0xFFB3E5FC)),
              ],
            ),
          ),
        ),
      ],
    );
  }

  BarChartGroupData _barGroup(int x, double y, Color color) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          color: color,
          width: 16,
          borderRadius: BorderRadius.circular(4),
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 15,
            color: Colors.grey.withValues(alpha: 0.1),
          ),
        ),
      ],
    );
  }
}