import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ScoreCircularChart extends StatelessWidget {
  final String score;
  const ScoreCircularChart({super.key, required this.score});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          height: 250,
          width: 250,
          child: PieChart(
            PieChartData(
              sectionsSpace: 8,
              centerSpaceRadius: 110,
              sections: [
                _pieSection(const Color(0xFFFFD166)), 
                _pieSection(const Color(0xFFFDE1E6)),
                _pieSection(const Color(0xFFC8E6C9)), 
                _pieSection(const Color(0xFFE1BEE7)), 
                _pieSection(const Color(0xFFB3E5FC)), 
              ],
            ),
          ),
        ),
        CenterText(score: score,),
      ],
    );
  }

  PieChartSectionData _pieSection(Color color) {
    return PieChartSectionData(
      color: color,
      value: 20,
      radius: 20,
      showTitle: false,
    );
  }

}

class CenterText extends StatelessWidget {
  final String score;
  const CenterText({super.key, required this.score});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(score, style: TextStyle(color: Colors.black,fontSize: 60, fontWeight: FontWeight.bold)),
        Text("out of 5", style: TextStyle(color: Colors.black, fontSize: 16)),
        Gap(8),
        Text("Your daily habits are not\ncompleted.", 
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 14)),
      ],
    );
  }
}