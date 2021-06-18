import 'package:json_annotation/json_annotation.dart';

part 'YogaModel.g.dart';

@JsonSerializable()
class YogaModel {
  final String how_to;
  final String i;
  final String image;
  final String info;
  final String name;
  YogaModel({this.how_to, this.i, this.image, this.info, this.name});
  factory YogaModel.fromJson(Map<String, dynamic> json) =>
      _$YogaModelFromJson(json);
  Map<String, dynamic> toJson() => _$YogaModelToJson(this);
}
