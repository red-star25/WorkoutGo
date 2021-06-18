// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PopularExercise.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PopularExercise _$PopularExerciseFromJson(Map<String, dynamic> json) {
  return PopularExercise(
    body_part: json['body_part'] as String,
    difficulty: json['difficulty'] as String,
    equipment: json['equipment'] as String,
    image_url: json['image_url'] as String,
    exer_name: json['exer_name'] as String,
  );
}

Map<String, dynamic> _$PopularExerciseToJson(PopularExercise instance) =>
    <String, dynamic>{
      'body_part': instance.body_part,
      'difficulty': instance.difficulty,
      'equipment': instance.equipment,
      'exer_name': instance.exer_name,
      'image_url': instance.image_url,
    };
