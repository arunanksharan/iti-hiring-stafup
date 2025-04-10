
import 'dart:convert';

CreateCompanyModel createCompanyModelFromJson(String str) => CreateCompanyModel.fromJson(json.decode(str));

String createCompanyModelToJson(CreateCompanyModel data) => json.encode(data.toJson());

class CreateCompanyModel {
  String? id;
  String? name;
  String? gstNumber;
  dynamic address;

  CreateCompanyModel({
    this.id,
    this.name,
    this.gstNumber,
    this.address,
  });

  factory CreateCompanyModel.fromJson(Map<String, dynamic> json) => CreateCompanyModel(
    id: json["id"],
    name: json["name"],
    gstNumber: json["gst_number"],
    address: json["address"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "gst_number": gstNumber,
    "address": address,
  };
}
