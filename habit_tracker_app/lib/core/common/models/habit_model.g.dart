// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'habit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HabitModel _$HabitModelFromJson(Map<String, dynamic> json) => _HabitModel(
  id: json['id'] as String,
  title: json['title'] as String,
  reminderTime: json['reminder_time'] as String?,
  categoryId: json['category_id'] as String,
  createdAt: json['created_at'] as String?,
  iconName: json['icon_name'] as String? ?? '🔔',
  colorHex: json['color_hex'] as String? ?? '#A5B68D',
  isCompletedToday: json['is_completed_today'] as bool? ?? false,
);

Map<String, dynamic> _$HabitModelToJson(_HabitModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'reminder_time': instance.reminderTime,
      'category_id': instance.categoryId,
      'created_at': instance.createdAt,
      'icon_name': instance.iconName,
      'color_hex': instance.colorHex,
      'is_completed_today': instance.isCompletedToday,
    };
