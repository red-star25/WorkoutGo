// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MeditationModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MeditationModel _$MeditationModelFromJson(Map<String, dynamic> json) {
  return MeditationModel(
    i: json['i'] as int,
    image: json['image'] as String,
    info: json['info'] as String,
    name: json['name'] as String,
    video_link: json['video_link'] as String,
  );
}

Map<String, dynamic> _$MeditationModelToJson(MeditationModel instance) =>
    <String, dynamic>{
      'info': instance.info,
      'image': instance.image,
      'name': instance.name,
      'i': instance.i,
      'video_link': instance.video_link,
    };
