// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ClickedCategoryModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClickedCategoryModel _$ClickedCategoryModelFromJson(Map<String, dynamic> json) {
  return ClickedCategoryModel(
    body_part: json['body_part'] as String,
    difficulty: json['difficulty'] as String,
    equipment: json['equipment'] as String,
    i: json['i'] as int,
    image: json['image'] as String,
    name: json['name'] as String,
    how_to: json['how_to'] as String,
  );
}

Map<String, dynamic> _$ClickedCategoryModelToJson(
        ClickedCategoryModel instance) =>
    <String, dynamic>{
      'body_part': instance.body_part,
      'image': instance.image,
      'name': instance.name,
      'difficulty': instance.difficulty,
      'equipment': instance.equipment,
      'i': instance.i,
      'how_to': instance.how_to,
    };
