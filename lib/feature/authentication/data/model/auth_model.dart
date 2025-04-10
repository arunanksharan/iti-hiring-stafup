// In auth_model.dart
class AuthResultModel {
  final bool success;
  final String? verificationId;
  final String? phoneNumber;
  final UserModel? user;
  final String? errorMessage;

  AuthResultModel({
    required this.success,
    this.verificationId,
    this.phoneNumber,
    this.user,
    this.errorMessage

  });
}

class UserModel {
  final String? uid;
  final String? phoneNumber;
  final String? idToken;

  UserModel({this.uid, this.phoneNumber, this.idToken});
}
