import 'package:flutter/foundation.dart';
import 'package:stafup/api_service/api_strings.dart';
import 'package:stafup/api_service/dio_client.dart';
import 'package:stafup/feature/screen/company_profile/data/model/company_profile_model.dart';

class CompanyProfileRepository {
  // Fetch company details
  Future<CompanyProfileModel> fetchCompanyDetails({
    required String companyId,
  }) async {
    try {
      final response = await DioClient.perform(
        '${ApiStrings.company}/$companyId/details',
        ApiMethods.get,
      );
      
      final Map<String, dynamic> jsonMap = response.data;

      if (response.statusCode == 200) {
        return CompanyProfileModel.fromJson(jsonMap);
      } else {
        throw Exception(
          jsonMap[ApiVariables.message] ??
              'Request failed with status: ${response.statusCode}',
        );
      }
    } catch (error) {
      debugPrint('Error fetching company details: $error');
      throw Exception('Failed to load company details: ${error.toString()}');
    }
  }

  // Update company details
  Future<CompanyProfileModel> updateCompanyDetails({
    required String companyId,
    required String name,
    required String address,
  }) async {
    try {
      final response = await DioClient.perform(
        '${ApiStrings.company}/$companyId/details',
        ApiMethods.put,
        data: {
          ApiVariables.name: name,
          ApiVariables.address: address,
        },
      );
      
      final Map<String, dynamic> jsonMap = response.data;

      if (response.statusCode == 200) {
        return CompanyProfileModel.fromJson(jsonMap);
      } else {
        throw Exception(
          jsonMap[ApiVariables.message] ??
              'Request failed with status: ${response.statusCode}',
        );
      }
    } catch (error) {
      debugPrint('Error updating company details: $error');
      throw Exception('Failed to update company details: ${error.toString()}');
    }
  }
}
