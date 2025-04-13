import 'dart:convert';

CompanyProfileModel companyProfileModelFromJson(String str) =>
    CompanyProfileModel.fromJson(json.decode(str));

String companyProfileModelToJson(CompanyProfileModel data) =>
    json.encode(data.toJson());

class CompanyProfileModel {
  String? id;
  String? name;
  String? gstNumber;
  String? address;
  String? email;
  String? organisationType;

  CompanyProfileModel({
    this.id,
    this.name,
    this.gstNumber,
    this.address,
    this.email,
    this.organisationType,
  });

  factory CompanyProfileModel.fromJson(Map<String, dynamic> json) =>
      CompanyProfileModel(
        id: json["id"],
        name: json["name"],
        gstNumber: json["gst_number"],
        address: json["address"],
        email: json["email"],
        organisationType: json["org_type"],
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "gst_number": gstNumber,
    "address": address,
    "email": email,
    "org_type": organisationType,
  };
}
