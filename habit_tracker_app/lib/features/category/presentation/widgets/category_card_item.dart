import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:stacked_cards/stacked_cards.dart';

class CategoryCard {
  static CardItem buildItem({
    required String title,
    required String count,
    required Color color,
    required String iconEmoji,
    required List habits,
  }) {
    final validHabits = habits
        .where((h) => h != null && (h['title'] != null || h['name'] != null))
        .toList();

    return CardItem(
      solidColor: color,
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
      ),
      body: Theme(
        data: ThemeData().copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          tilePadding: EdgeInsets.zero,
          trailing: const Icon(
            Icons.keyboard_arrow_down_rounded,
            color: Colors.black54,
          ),
          title: Row(
            children: [
              Text(iconEmoji, style: const TextStyle(fontSize: 22)),
              const Gap(10),
              Text(
                count,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          children: validHabits.isEmpty
              ? [
                  const ListTile(
                    title: Text(
                      "No habits in this category",
                      style: TextStyle(fontSize: 14, color: Colors.black54),
                    ),
                  ),
                ]
              : validHabits.map((habit) {
                  return ListTile(
                    dense: true,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                    leading: const Icon(
                      Icons.check_circle_outline,
                      size: 20,
                      color: Colors.black45,
                    ),
                    title: Text(
                      habit['title']?.toString() ??
                          habit['name']?.toString() ??
                          "Unknown",
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  );
                }).toList(),
        ),
      ),
    );
  }
}
