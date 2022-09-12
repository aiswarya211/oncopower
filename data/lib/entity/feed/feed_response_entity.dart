
import 'package:data/entity/feed/feed_data_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'feed_response_entity.g.dart';

@JsonSerializable()
class FeedResponseEntity {

  @JsonKey(name: 'data')
  FeedData? feed;

  FeedResponseEntity({this.feed});

    factory FeedResponseEntity.fromJson(Map<String, dynamic> json) => _$FeedResponseEntityFromJson(json);
  Map<String, dynamic> toJson() => _$FeedResponseEntityToJson(this);
}