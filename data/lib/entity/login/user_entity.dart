
import 'package:json_annotation/json_annotation.dart';
part 'user_entity.g.dart';

@JsonSerializable()
class UserEntity {
  int? id;
  @JsonKey(name: 'user_type')
  String? userType;
  String? email;
  @JsonKey(name: 'first_name')
  String? firstName;
  @JsonKey(name: 'last_name')
  String? lastName;
  @JsonKey(name: 'display_name')
  String? displayName;

  String? source;
  @JsonKey(name: 'media')
  Media? media;

 UserEntity(
      {this.email,
      this.firstName,
      this.lastName,
      this.id,
      this.userType,
      this.media,
      this.displayName,
      this.source});

  factory UserEntity.fromJson(Map<String, dynamic> json) => _$UserEntityFromJson(json);
  Map<String, dynamic> toJson() => _$UserEntityToJson(this);
}

@JsonSerializable()
class Media {
  int? id;
  @JsonKey(name: 'relative_path')
  String? image;

  Media({this.id, this.image});
  factory Media.fromJson(Map<String, dynamic> json) => _$MediaFromJson(json);
  Map<String, dynamic> toJson() => _$MediaToJson(this);
}
