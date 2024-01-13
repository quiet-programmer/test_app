import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: 0)
class UserModel {
  @HiveField(0)
  final String? accessToken;

  @HiveField(1)
  final String? fullName;

  @HiveField(3)
  final String? email;

  UserModel({
    this.accessToken,
    this.fullName,
    this.email,
  });

  factory UserModel.fromJsonLocalToken(responseData) {
    return UserModel(
      accessToken: responseData['token'],
    );
  }

  factory UserModel.fromJsonUserDetails(responseData) {
    return UserModel(
      fullName: responseData['fullName'],
      email: responseData['email'],
    );
  }
}
