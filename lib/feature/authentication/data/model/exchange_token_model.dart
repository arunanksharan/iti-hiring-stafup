// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

ExchangeTokenModel exchangeTokenModelFromJson(String str) => ExchangeTokenModel.fromJson(json.decode(str));

String exchangeTokenModelToJson(ExchangeTokenModel data) => json.encode(data.toJson());

class ExchangeTokenModel {
  String? accessToken;
  String? tokenType;
  int? expiresIn;
  String? refreshToken;
  User? user;

  ExchangeTokenModel({
    this.accessToken,
    this.tokenType,
    this.expiresIn,
    this.refreshToken,
    this.user,
  });

  factory ExchangeTokenModel.fromJson(Map<String, dynamic> json) => ExchangeTokenModel(
    accessToken: json["access_token"],
    tokenType: json["token_type"],
    expiresIn: json["expires_in"],
    refreshToken: json["refresh_token"],
    user: json["user"] == null ? null : User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "access_token": accessToken,
    "token_type": tokenType,
    "expires_in": expiresIn,
    "refresh_token": refreshToken,
    "user": user?.toJson(),
  };
}

class User {
  String? id;
  String? email;
  String? mobile;
  bool? isActive;
  bool? isVerified;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic companyId;

  User({
    this.id,
    this.email,
    this.mobile,
    this.isActive,
    this.isVerified,
    this.createdAt,
    this.updatedAt,
    this.companyId,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    email: json["email"],
    mobile: json["mobile"],
    isActive: json["is_active"],
    isVerified: json["is_verified"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    companyId: json["company_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "mobile": mobile,
    "is_active": isActive,
    "is_verified": isVerified,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "company_id": companyId,
  };
}
