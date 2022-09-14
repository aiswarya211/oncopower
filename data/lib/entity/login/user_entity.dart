import 'package:domain/model/user/user.dart';
import 'package:domain/utils/base_layer_data_transformer.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user_entity.g.dart';

@JsonSerializable()
class LoginData {
  @JsonKey(name: 'token')
  final String? token;
  final UserEntity? user;
  final String? message;

  LoginData({this.token, this.user, this.message});

  factory LoginData.fromJson(Map<String, dynamic> json) =>
      _$LoginDataFromJson(json);
  Map<String, dynamic> toJson() => _$LoginDataToJson(this);
}

@JsonSerializable()
class UserEntity implements BaseLayerDataTransformer<UserEntity, User> {
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

  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      _$UserEntityFromJson(json);
  Map<String, dynamic> toJson() => _$UserEntityToJson(this);

  @override
  UserEntity restore(User user) {
    throw UnimplementedError();
  }

  @override
  User transform() {
    return User(
        id: id,
        displayName: displayName,
        email: email,
        lastName: lastName,
        firstName: firstName,
        source: source,
        userType: userType);
  }
}

@JsonSerializable()
class Media implements BaseLayerDataTransformer<UserEntity, Media> {
  int? id;
  @JsonKey(name: 'relative_path')
  String? image;

  Media({this.id, this.image});
  factory Media.fromJson(Map<String, dynamic> json) => _$MediaFromJson(json);
  Map<String, dynamic> toJson() => _$MediaToJson(this);

  @override
  UserEntity restore(Media media) {
    throw UnimplementedError();
  }

  @override
  Media transform() {
    return Media(
      id: id,
      image: image,
    );
  }
}
