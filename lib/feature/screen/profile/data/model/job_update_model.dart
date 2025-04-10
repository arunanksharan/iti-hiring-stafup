
import 'dart:convert';

JobUpdateModel jobUpdateModelFromJson(String str) => JobUpdateModel.fromJson(json.decode(str));

String jobUpdateModelToJson(JobUpdateModel data) => json.encode(data.toJson());

class JobUpdateModel {
  JobPosting? jobPosting;
  String? id;
  String? employerId;
  DateTime? createdAt;
  DateTime? updatedAt;

  JobUpdateModel({
    this.jobPosting,
    this.id,
    this.employerId,
    this.createdAt,
    this.updatedAt,
  });

  factory JobUpdateModel.fromJson(Map<String, dynamic> json) => JobUpdateModel(
    jobPosting: json["job_posting"] == null ? null : JobPosting.fromJson(json["job_posting"]),
    id: json["id"],
    employerId: json["employer_id"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "job_posting": jobPosting?.toJson(),
    "id": id,
    "employer_id": employerId,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}

class JobPosting {
  int? salary;
  String? jobRole;
  String? personName;
  String? workTimings;
  String? businessType;
  String? hiringUrgency;
  int? numberOfHires;
  String? skillsRequired;
  String? businessLocation;

  JobPosting({
    this.salary,
    this.jobRole,
    this.personName,
    this.workTimings,
    this.businessType,
    this.hiringUrgency,
    this.numberOfHires,
    this.skillsRequired,
    this.businessLocation,
  });

  factory JobPosting.fromJson(Map<String, dynamic> json) => JobPosting(
    salary: json["salary"],
    jobRole: json["job_role"],
    personName: json["person_name"],
    workTimings: json["work_timings"],
    businessType: json["business_type"],
    hiringUrgency: json["hiring_urgency"],
    numberOfHires: json["number_of_hires"],
    skillsRequired: json["skills_required"],
    businessLocation: json["business_location"],
  );

  Map<String, dynamic> toJson() => {
    "salary": salary,
    "job_role": jobRole,
    "person_name": personName,
    "work_timings": workTimings,
    "business_type": businessType,
    "hiring_urgency": hiringUrgency,
    "number_of_hires": numberOfHires,
    "skills_required": skillsRequired,
    "business_location": businessLocation,
  };
}
