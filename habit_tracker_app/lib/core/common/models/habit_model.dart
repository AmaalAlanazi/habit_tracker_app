import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:habit_tracker_app/core/common/entities/habit_entity.dart';

part 'habit_model.freezed.dart';
part 'habit_model.g.dart';

@freezed
abstract class HabitModel with _$HabitModel {
  @JsonSerializable(fieldRename: .snake)
  const factory HabitModel({
    required String id,
    required String title,
    String? reminderTime, 
    required String categoryId,
    String? createdAt, 
    @Default('🔔') String iconName,
    @Default('#A5B68D') String colorHex,
    @Default(false) bool isCompletedToday,
  }) = _HabitModel;

  factory HabitModel.fromJson(Map<String, Object?> json) => _$HabitModelFromJson(json);
}

extension HabitModelMapper on HabitModel {
  HabitEntity toEntity() {
    return HabitEntity(
      id: id,
      title: title,
      reminderTime: reminderTime,
      iconName: iconName,
      colorHex: colorHex,
      isCompletedToday: isCompletedToday,
    );
  }
}