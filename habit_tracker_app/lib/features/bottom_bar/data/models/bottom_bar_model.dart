import 'package:habit_tracker_app/features/bottom_bar/domain/entities/bottom_bar_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'bottom_bar_model.freezed.dart';
part 'bottom_bar_model.g.dart';

@freezed
abstract class BottomBarModel with _$BottomBarModel {
  const factory BottomBarModel({
    required int id,
    required String firstName,
    required String lastName,
    
  }) = _BottomBarModel;

  factory BottomBarModel.fromJson(Map<String, Object?> json) => _$BottomBarModelFromJson(json);
}



extension BottomBarModelMapper on BottomBarModel {
  BottomBarEntity toEntity() {
    return BottomBarEntity(id: id, firstName: firstName, lastName: lastName);
  }
  }
