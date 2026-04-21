// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bottom_bar_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BottomBarModel _$BottomBarModelFromJson(Map<String, dynamic> json) =>
    _BottomBarModel(
      id: (json['id'] as num).toInt(),
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
    );

Map<String, dynamic> _$BottomBarModelToJson(_BottomBarModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
    };
