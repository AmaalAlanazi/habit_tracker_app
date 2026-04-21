import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:stacked_cards/stacked_cards.dart';
import 'package:habit_tracker_app/core/common/entities/habit_entity.dart';
import 'package:habit_tracker_app/features/home/presentation/cubit/home_cubit.dart'; 

class HabitStackedSection extends StatelessWidget {
  final List<HabitEntity> habits; 

  const HabitStackedSection({super.key, required this.habits});

  @override
  Widget build(BuildContext context) {
    final List<CardItem> habitItems = habits.map((habit) {
      return _buildHabitItem(
        context: context, 
        id: habit.id,    
        title: habit.title,
        subtitle: habit.reminderTime ?? 'No reminder',
        iconEmoji: habit.iconName, 
        colorHex: habit.colorHex,
        isDone: habit.isCompletedToday,
      );
    }).toList();

    if (habits.isEmpty) {
      return Center(child: Text("Start adding your habits! 🌿"));
    }

    return Center(
      child: StackedCards(items: habitItems),
    );
  }

 CardItem _buildHabitItem({
  required BuildContext context,
  required String id,
  required String title,
  required String subtitle,
  required String iconEmoji,
  required String colorHex,
  required bool isDone,
}) {
  final Color cardColor = Color(int.parse(colorHex.replaceFirst('#', '0xFF')));

  return CardItem(
    solidColor: cardColor,
    title: Text(
      title,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 22,
        color: Colors.black87,
      ),
    ),
    body: Container(
      padding: EdgeInsets.symmetric(vertical: 8), 
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.black.withValues(alpha: 0.08), 
            width: 4,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(iconEmoji, style: TextStyle(fontSize: 30)),
              Gap(10),
              Text(
                subtitle,
                style: TextStyle(color: Colors.black54, fontSize: 16),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              context.read<HomeCubit>().toggleHabit(id, isDone);
            },
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: isDone ? Color(0xff1E1E1E) : Colors.white.withValues(alpha: 0.4),
                shape: BoxShape.circle,
              ),
              child: Icon(
                isDone ? Icons.check : Icons.add,
                color: isDone ? Colors.white : Color(0xff1E1E1E),
                size: 20,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
}