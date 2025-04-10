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
      // Validate companyId is not empty before proceeding
      if (companyId.isEmpty) {
        AppLoggerHelper.error('Error: Company ID is empty');
        throw Exception('Company ID is missing. Please ensure you are logged in with a company account.');
      }
      
      AppLoggerHelper.info(
        "Fetching jobs for company: $companyId, page: $page, page_size: $pageSize",
      );
      
      final response = await DioClient.perform(
        '${ApiStrings.company}/$companyId/job_posting/list?page=$page&page_size=$pageSize',
        ApiMethods.get,
      );
      
      if (response.statusCode == 200) {
        return JobListModel.fromJson(response.data);
      } else {
        AppLoggerHelper.error('Failed to fetch jobs: Status code ${response.statusCode}');
        throw Exception('Failed to fetch jobs: Status code ${response.statusCode}');
      }
    } catch (error) {
      AppLoggerHelper.error('Error fetching jobs: $error');
      throw Exception('Failed to load data');
    }
  }
}
