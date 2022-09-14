import 'package:data/entity/like/like_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'like_response_entity.g.dart';

@JsonSerializable()
class LikeResponseEntity {
  @JsonKey(name: 'data')
  LikeData? likeData;
  String? message;

  LikeResponseEntity({this.likeData, this.message});

  factory LikeResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$LikeResponseEntityFromJson(json);
  Map<String, dynamic> toJson() => _$LikeResponseEntityToJson(this);
}
