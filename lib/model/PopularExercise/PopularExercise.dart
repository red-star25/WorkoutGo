import 'package:json_annotation/json_annotation.dart';

part 'PopularExercise.g.dart';

@JsonSerializable()
class PopularExercise {
  final String body_part;
  final String difficulty;
  final String equipment;
  final String exer_name;
  final String image_url;
  PopularExercise(
      {this.body_part,
      this.difficulty,
      this.equipment,
      this.image_url,
      this.exer_name});
  factory PopularExercise.fromJson(Map<String, dynamic> json) =>
      _$PopularExerciseFromJson(json);
  Map<String, dynamic> toJson() => _$PopularExerciseToJson(this);
}
