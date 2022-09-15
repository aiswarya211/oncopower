import 'package:json_annotation/json_annotation.dart';

part 'add_post_request.g.dart';

@JsonSerializable()
class AddPostRequest {
  @JsonKey(name: 'description')
  String? description;
  @JsonKey(name: 'visibility')
  int? visibility;

  AddPostRequest({this.description, this.visibility});
  factory AddPostRequest.fromJson(Map<String, dynamic> json) =>
      _$AddPostRequestFromJson(json);
  Map<String, dynamic> toJson() => _$AddPostRequestToJson(this);
}