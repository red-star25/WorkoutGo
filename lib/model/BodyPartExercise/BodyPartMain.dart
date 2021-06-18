import 'package:json_annotation/json_annotation.dart';

part 'BodyPartMain.g.dart';

@JsonSerializable()
class BodyPartMain {
  final List<String> color;
  final String name;
  final String title;
  BodyPartMain({this.color, this.name, this.title});
  factory BodyPartMain.fromJson(Map<String, dynamic> json) =>
      _$BodyPartMainFromJson(json);
  Map<String, dynamic> toJson() => _$BodyPartMainToJson(this);
}
