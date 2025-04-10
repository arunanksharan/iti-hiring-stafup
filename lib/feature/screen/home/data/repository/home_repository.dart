// In job_details_repository.dart
import 'package:flutter/cupertino.dart';
import 'package:stafup/feature/screen/home/data/model/job_model.dart';
import 'package:stafup/utils/logger.dart';

import '../../../../../api_service/api_strings.dart';
import '../../../../../api_service/dio_client.dart';

class HomeRepository {
  Future<JobListModel> fetchJobs({
    required String companyId,
    int page = 1,
    int pageSize = 50,
  }) async {
    try {
      AppLoggerHelper.info(
        "Fetching jobs for company: $companyId, page: $page, page_size: $pageSize",
      );
      final response = await DioClient.perform(
        '${ApiStrings.company}/$companyId/job_posting/list?page=$page&page_size=$pageSize',
        ApiMethods.get,
      );
      final Map<String, dynamic> jsonMap = response.data;

      if (response.statusCode == 200) {
        return JobListModel.fromJson(response.data);
      } else {
        throw Exception(
          jsonMap[ApiVariables.message] ??
              'Request failed with status: ${response.statusCode}',
        );
      }
    } catch (error) {
      AppLoggerHelper.error('Error fetching jobs: $error');
      throw Exception('Failed to load data');
    }
  }
}
