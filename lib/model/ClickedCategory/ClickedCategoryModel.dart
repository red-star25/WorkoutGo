import 'package:json_annotation/json_annotation.dart';

part 'ClickedCategoryModel.g.dart';

@JsonSerializable()
class ClickedCategoryModel {
  final String body_part;
  final String image;
  final String name;
  final String difficulty;
  final String equipment;
  final int i;
  final String how_to;
  ClickedCategoryModel(
      {this.body_part,
      this.difficulty,
      this.equipment,
      this.i,
      this.image,
      this.name,
      this.how_to});
  factory ClickedCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$ClickedCategoryModelFromJson(json);
  Map<String, dynamic> toJson() => _$ClickedCategoryModelToJson(this);
}
