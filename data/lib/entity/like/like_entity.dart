
import 'package:json_annotation/json_annotation.dart';
part 'like_entity.g.dart';
@JsonSerializable()
class LikeData {
  @JsonKey(name: 'is_like')
  bool? islike;
    @JsonKey(name: 'like_count')
  int? count;

  LikeData({this.islike, this.count});

  factory LikeData.fromJson(Map<String, dynamic> json) => _$LikeDataFromJson(json);
  Map<String, dynamic> toJson() => _$LikeDataToJson(this);
}