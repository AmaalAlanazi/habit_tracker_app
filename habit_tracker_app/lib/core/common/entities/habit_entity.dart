class HabitEntity {
  final String id;
  final String title;
  final String? reminderTime;
  final String iconName;
  final String colorHex;
  final bool isCompletedToday;

  HabitEntity({
    required this.id,
    required this.title,
    this.reminderTime,
    required this.iconName,
    required this.colorHex,
    required this.isCompletedToday,
  });
}