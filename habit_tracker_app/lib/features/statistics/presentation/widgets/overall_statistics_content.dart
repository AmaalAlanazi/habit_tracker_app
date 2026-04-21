import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class OverallStatisticsContent extends StatelessWidget {
  const OverallStatisticsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      mainAxisAlignment: .start,
      crossAxisAlignment: .start,
      children: [
        Text("Summary:", style: TextStyle(fontWeight: .bold, fontSize: 18)),

        GridView.count(
          padding: .zero,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
          childAspectRatio: 2,
          children: [
            _StatCard(title: "Current streak", value: "53 days"),
            _StatCard(title: "Success rate", value: "92%"),
            _StatCard(title: "Best streak day", value: "86 days"),
            _StatCard(title: "Completed habits", value: "758"),
          ],
        ),

        _HeatmapHabitCard(
          title: "Do meditation",
          icon: "🧘",
          frequency: "Everyday",
          activeColor: Color(0xFFFDE1E6),
        ),
        _HeatmapHabitCard(
          title: "Drink 10 glasses of water",
          icon: "💧",
          frequency: "Everyday",
          activeColor: Color(0xFFB3E5FC),
        ),
        _HeatmapHabitCard(
          title: "Take your medications",
          icon: "💊",
          frequency: "5 days per week",
          activeColor: Color(0xFFC8E6C9),
        ),
        Gap(100)
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  final String title;
  final String value;
  const _StatCard({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title, style: TextStyle(color: Colors.grey, fontSize: 12)),
          Gap(4),
          Text(
            value,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ],
      ),
    );
  }
}

class _HeatmapHabitCard extends StatelessWidget {
  final String title;
  final String icon;
  final String frequency;
  final Color activeColor;

  const _HeatmapHabitCard({
    required this.title,
    required this.icon,
    required this.frequency,
    required this.activeColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(icon, style: TextStyle(fontSize: 18)),
                  Gap(8),
                  Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
              Text(
                frequency,
                style: TextStyle(color: Colors.grey, fontSize: 11),
              ),
            ],
          ),
          Gap(15),
          GridView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 20,
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
            ),
            itemCount: 80,
            itemBuilder: (context, index) {
              bool isActive = index % 3 != 0;
              return Container(
                decoration: BoxDecoration(
                  color: isActive ? activeColor : Colors.grey.shade50,
                  borderRadius: BorderRadius.circular(2),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
