// In job_details_repository.dart
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:stafup/feature/screen/profile/data/model/job_update_model.dart';

import 'package:stafup/api_service/api_strings.dart';
import 'package:stafup/api_service/dio_client.dart';

class JobUpdateRepository {
  Future<JobPosting?> updateJob({
    required String jobId,
    required JobPosting jobPostingData,
  }) async {
    try {
      Map<String, dynamic> requestBody = {
        "job_posting": jobPostingData.toJson(),
      };
      final response = await DioClient.perform(
        '${ApiStrings.updateJob}/$jobId',
        ApiMethods.put,
        data: requestBody,
      );
      if (response.statusCode == 200) {
        return JobPosting.fromJson(response.data);
      }
      return null;
    } catch (error) {
      debugPrint('Error updating job: $error');
      return null;
    }
  }
}
