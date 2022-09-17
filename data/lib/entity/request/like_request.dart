import 'package:json_annotation/json_annotation.dart';
part 'like_request.g.dart';
@JsonSerializable()
class LikeDataRequest{
  @JsonKey(name: 'is_like')
  bool? islike;
  @JsonKey(name: 'like_count')
  int? count;

  LikeDataRequest({this.islike, this.count});

  factory LikeDataRequest.fromJson(Map<String, dynamic> json) =>
      _$LikeDataRequestFromJson(json);
  Map<String, dynamic> toJson() => _$LikeDataRequestToJson(this);
}
