

import 'dart:convert';

JobListModel jobListModelFromJson(String str) => JobListModel.fromJson(json.decode(str));

String jobListModelToJson(JobListModel data) => json.encode(data.toJson());

class JobListModel {
  List<Item>? items;
  int? total;
  int? page;
  int? pageSize;

  JobListModel({
    this.items,
    this.total,
    this.page,
    this.pageSize,
  });

  factory JobListModel.fromJson(Map<String, dynamic> json) => JobListModel(
    items: json["items"] == null ? [] : List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
    total: json["total"],
    page: json["page"],
    pageSize: json["page_size"],
  );

  Map<String, dynamic> toJson() => {
    "items": items == null ? [] : List<dynamic>.from(items!.map((x) => x.toJson())),
    "total": total,
    "page": page,
    "page_size": pageSize,
  };
}

class Item {
  String? id;
  String? employerId;
  JobPosting? jobPosting;
  DateTime? createdAt;
  DateTime? updatedAt;

  Item({
    this.id,
    this.employerId,
    this.jobPosting,
    this.createdAt,
    this.updatedAt,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    id: json["id"],
    employerId: json["employer_id"],
    jobPosting: json["job_posting"] == null ? null : JobPosting.fromJson(json["job_posting"]),
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "employer_id": employerId,
    "job_posting": jobPosting?.toJson(),
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
