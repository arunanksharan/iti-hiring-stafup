import 'dart:convert';

CreateCompanyModel createCompanyModelFromJson(String str) =>
    CreateCompanyModel.fromJson(json.decode(str));

String createCompanyModelToJson(CreateCompanyModel data) =>
    json.encode(data.toJson());

class CreateCompanyModel {
  String? id;
  String? name;
  String? gstNumber;
  String? email;
  dynamic address;

  CreateCompanyModel({
    this.id,
    this.name,
    this.gstNumber,
    this.email,
    this.address,
  });

  factory CreateCompanyModel.fromJson(Map<String, dynamic> json) =>
      CreateCompanyModel(
        id: json["id"],
        name: json["name"],
        gstNumber: json["gst_number"],
        email: json["email"],
        address: json["address"],
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "gst_number": gstNumber,
    "email": email,
    "address": address,
  };
}

CompanyExistsResponse companyExistsResponseFromJson(String str) =>
    CompanyExistsResponse.fromJson(json.decode(str));

String companyExistsResponseToJson(CompanyExistsResponse data) =>
    json.encode(data.toJson());

class CompanyExistsResponse {
  String message;
  String? assignedToPhoneNumber; // Masked phone number

  CompanyExistsResponse({required this.message, this.assignedToPhoneNumber});

  factory CompanyExistsResponse.fromJson(Map<String, dynamic> json) =>
      CompanyExistsResponse(
        message: json["message"],
        assignedToPhoneNumber: json["assigned_to_phone_number"],
      );

  Map<String, dynamic> toJson() => {
    "message": message,
    "assigned_to_phone_number": assignedToPhoneNumber,
  };
}

// Custom Exception for Company Exists scenario
class CompanyExistsException implements Exception {
  final String message;
  final String? maskedPhoneNumber;

  CompanyExistsException(this.message, this.maskedPhoneNumber);

  @override
  String toString() {
    if (maskedPhoneNumber != null) {
      return "$message (Phone: $maskedPhoneNumber)";
    }
    return message;
  }
}
