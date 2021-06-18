// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BodyPartMain.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BodyPartMain _$BodyPartMainFromJson(Map<String, dynamic> json) {
  return BodyPartMain(
    color: (json['color'] as List)?.map((e) => e as String)?.toList(),
    name: json['name'] as String,
    title: json['title'] as String,
  );
}

Map<String, dynamic> _$BodyPartMainToJson(BodyPartMain instance) =>
    <String, dynamic>{
      'color': instance.color,
      'name': instance.name,
      'title': instance.title,
    };
