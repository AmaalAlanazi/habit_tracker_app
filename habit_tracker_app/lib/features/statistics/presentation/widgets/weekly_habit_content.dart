import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class WeeklyHabitContent extends StatelessWidget {
  const WeeklyHabitContent({super.key});

  @override
  Widget build(BuildContext context) {
    
    final List<Map<String, dynamic>> weeklyData = [
      {
        "title": "Do meditation",
        "frequency": "Everyday",
        "icon": "🧘",
        "color": Color(0xFFFDE1E6),
        "completedDays": [0, 1, 2, 3],
      },
      {
        "title": "Drink 10 glasses of water",
        "frequency": "Everyday",
        "icon": "💧",
        "color": Color(0xFFB3E5FC),
        "completedDays": [0, 2],
      },
      {
        "title": "Take your medications",
        "frequency": "5 days per week",
        "icon": "💊",
        "color": Color(0xFFC8E6C9),
        "completedDays": [0, 1, 2, 3],
      },
    ];

    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: weeklyData.length,
      separatorBuilder: (context, index) => Gap(10),
      itemBuilder: (context, index) {
        final habit = weeklyData[index];
        return WeeklyCard(habit: habit);
      },
    );
  }
}

class WeeklyCard extends StatelessWidget {
  final Map<String, dynamic> habit;
  const WeeklyCard({super.key, required this.habit});

  @override
  Widget build(BuildContext context) {
    final List<String> days = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];

    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(habit['icon'], style: TextStyle(fontSize: 20)),
                  Gap(10),
                  Text(
                    habit['title'],
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ],
              ),
              Text(
                habit['frequency'],
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),
          Gap(15),
          Divider(height: 1),
          Gap(15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(7, (index) {
              bool isDone = (habit['completedDays'] as List).contains(index);
              return Column(
                children: [
                  Text(
                    days[index],
                    style: TextStyle(fontSize: 10, color: Colors.grey),
                  ),
                  Gap(8),
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: isDone ? habit['color'] : Colors.white,
                      shape: BoxShape.circle,
                      border: isDone
                          ? null
                          : Border.all(color: Colors.grey.shade300),
                    ),
                    child: isDone
                        ? Icon(Icons.check, size: 16, color: Colors.black87)
                        : null,
                  ),
                ],
              );
            }),
          ),
        ],
      ),
    );
  }
}
