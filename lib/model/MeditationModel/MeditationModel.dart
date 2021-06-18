import 'package:json_annotation/json_annotation.dart';

part 'MeditationModel.g.dart';

@JsonSerializable()
class MeditationModel {
  final String info;
  final String image;
  final String name;
  final int i;
  final String video_link;
  MeditationModel({this.i, this.image, this.info, this.name, this.video_link});
  factory MeditationModel.fromJson(Map<String, dynamic> json) =>
      _$MeditationModelFromJson(json);
  Map<String, dynamic> toJson() => _$MeditationModelToJson(this);
}
