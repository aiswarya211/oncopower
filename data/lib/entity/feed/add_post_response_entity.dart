import 'package:json_annotation/json_annotation.dart';

part 'add_post_response_entity.g.dart';

@JsonSerializable()
class AddPostResponseEntity {
  final String? message;

  AddPostResponseEntity({this.message});

  factory AddPostResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$AddPostResponseEntityFromJson(json);
  Map<String, dynamic> toJson() => _$AddPostResponseEntityToJson(this);
}
