import 'package:habit_tracker_app/features/category/domain/entities/category_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'category_model.freezed.dart';
part 'category_model.g.dart';

@freezed
abstract class CategoryModel with _$CategoryModel {
  const factory CategoryModel({
    required int id,
    required String firstName,
    required String lastName,
    
  }) = _CategoryModel;

  factory CategoryModel.fromJson(Map<String, Object?> json) => _$CategoryModelFromJson(json);
}



extension CategoryModelMapper on CategoryModel {
  CategoryEntity toEntity() {
    return CategoryEntity(id: id, firstName: firstName, lastName: lastName);
  }
  }
