import 'package:domain/model/media/media.dart';

class User {
  int? id;
  String? userType;
  String? email;
  String? firstName;
  String? lastName;
  String? displayName;
  String? source;
  Media? media;
  User(
      {this.displayName,
      this.email,
      this.media,
      this.lastName,
      this.firstName,
      this.source,
      this.id,
      this.userType});
}
