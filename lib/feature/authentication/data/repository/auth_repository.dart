// In job_details_repository.dart
import 'dart:async';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:itq_utils/itq_utils.dart';

import 'package:stafup/api_service/api_strings.dart';
import 'package:stafup/api_service/dio_client.dart';
import 'package:stafup/utils/fh_constant.dart';
import 'package:stafup/utils/logger.dart';
import 'package:stafup/feature/authentication/data/model/auth_model.dart';
import 'package:stafup/feature/authentication/data/model/create_company_model.dart';
import 'package:stafup/feature/authentication/data/model/exchange_token_model.dart';

class AuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<AuthResultModel> sendOTP(String phoneNumber) async {
    final completer = Completer<AuthResultModel>();

    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          try {
            await _auth.signInWithCredential(credential);
            AppLoggerHelper.info(
              'Phone number automatically verified and user signed in.',
            );
            completer.complete(
              AuthResultModel(
                success: true,
                verificationId: '',
                user: UserModel(
                  uid: _auth.currentUser?.uid,
                  phoneNumber: phoneNumber,
                ),
              ),
            );
          } catch (e) {
            AppLoggerHelper.error('Auto verification failed: $e');
            completer.completeError(
              AuthResultModel(success: false, errorMessage: e.toString()),
            );
          }
        },
        verificationFailed: (FirebaseAuthException e) {
          AppLoggerHelper.error(
            'Verification failed: ${e.code} - ${e.message}',
          );
          if (!completer.isCompleted) {
            completer.completeError(
              AuthResultModel(
                success: false,
                errorMessage: _getFriendlyErrorMessage(e),
              ),
            );
          }
        },
        codeSent: (String verId, int? resendToken) {
          AppLoggerHelper.info('Code sent to $phoneNumber');
          if (!completer.isCompleted) {
            completer.complete(
              AuthResultModel(
                success: true,
                verificationId: verId,
                phoneNumber: phoneNumber,
              ),
            );
          }
        },
        codeAutoRetrievalTimeout: (String verId) {
          AppLoggerHelper.warning('Auto retrieval timeout');
          if (!completer.isCompleted) {
            completer.complete(
              AuthResultModel(
                success: true,
                verificationId: verId,
                phoneNumber: phoneNumber,
              ),
            );
          }
        },
      );
    } catch (e) {
      AppLoggerHelper.error('Unexpected error: $e');
      if (!completer.isCompleted) {
        completer.completeError(
          AuthResultModel(
            success: false,
            errorMessage: 'An unexpected error occurred. Please try again.',
          ),
        );
      }
    }

    return completer.future;
  }

  String _getFriendlyErrorMessage(FirebaseAuthException e) {
    switch (e.code) {
      case 'invalid-phone-number':
        return 'The phone number entered is invalid. Please check and try again.';
      case 'too-many-requests':
        return 'Too many attempts. Please try again later.';
      case 'network-request-failed':
        return 'Network error. Please check your internet connection.';
      case 'session-expired':
        return 'Session expired. Please request a new code.';
      default:
        return e.message ?? 'An unknown error occurred.';
    }
  }

  Future<AuthResultModel> verifyOTP(String verificationId, String otp) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: otp,
      );

      UserCredential userCredential = await _auth.signInWithCredential(
        credential,
      );

      AppLoggerHelper.info('Phone number verified and user signed in!');
      AppLoggerHelper.info('UserCredential: $userCredential');

      String? idToken = await userCredential.user?.getIdToken();

      AppLoggerHelper.info('ID Token: $idToken');

      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString(apiAuthToken, idToken ?? '');
      await prefs.reload();

      return AuthResultModel(
        success: true,
        user: UserModel(
          uid: userCredential.user?.uid,
          phoneNumber: userCredential.user?.phoneNumber,
          idToken: idToken,
        ),
      );
    } on FirebaseAuthException catch (e) {
      AppLoggerHelper.info('Firebase Auth error: ${e.message}');
      return AuthResultModel(
        success: false,
        errorMessage: e.message ?? 'OTP Verification failed.',
      );
    } catch (e) {
      AppLoggerHelper.info('Unknown error during sign in: $e');
      return AuthResultModel(
        success: false,
        errorMessage: 'An unknown error occurred. Please try again.',
      );
    }
  }

  Future<ExchangeTokenModel> exchangeToken({required String phone}) async {
    try {
      final response = await DioClient.perform(
        ApiStrings.exchangeFirebaseToke,
        ApiMethods.post,
        body: {ApiVariables.phoneNumber: phone},
      );

      AppLoggerHelper.info('170 Exchange token response: ${response.data}');
      AppLoggerHelper.info(
        '171 Exchange token status code: ${response.statusCode}',
      );
      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonMap = response.data;

        if (jsonMap.containsKey('access_token')) {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await setValue(apiAuthToken, jsonMap['access_token']);
          prefs.reload();

          return ExchangeTokenModel.fromJson(jsonMap);
        } else {
          throw Exception('Access token not found in response');
        }
      } else if (response.statusCode == 404) {
        // --- Handle Specific 404 Not Found Error ---
        // This block is now reachable because DioException wasn't thrown for 404
        final backendErrorMessage =
            response.data is Map<String, dynamic>
                ? response.data['detail'] ??
                    response.data['message'] ??
                    'Account not found via API.'
                : 'Account not found via API.'; // Default message if body parsing fails
        AppLoggerHelper.warning(
          'Exchange token failed: Account not found (404). Backend message: $backendErrorMessage',
        );
        // Throw the specific exception format for the BLoC
        throw Exception("NO_ACCOUNT_FOUND: $backendErrorMessage");
      } else {
        final errorMessage =
            response.data is Map<String, dynamic>
                ? response.data[ApiVariables.message] ??
                    response.data['detail'] ??
                    'Unknown server response'
                : 'Request failed with status: ${response.statusCode}';
        AppLoggerHelper.error(
          'Exchange token failed with unexpected status ${response.statusCode}: $errorMessage',
        );
        throw Exception('API Error: $errorMessage');
      }
    } on DioException catch (e) {
      // --- Handle Dio errors (network, status codes other than 200) ---
      AppLoggerHelper.error(
        'DioException during exchange token: ${e.response?.statusCode} - ${e.response?.data}',
        e,
      );
      AppLoggerHelper.error(
        'DioException during exchange token: ${e.response?.statusCode} - ${e.response?.data}',
        e,
      );

      // ***** START OF CHANGE *****
      // Check specifically for 404 Not Found
      if (e.response?.statusCode == 404) {
        // Extract backend message if available
        final backendErrorMessage =
            e.response?.data is Map<String, dynamic>
                ? e.response?.data['detail'] ??
                    e.response?.data['message'] ??
                    'Account not found via API.'
                : 'Account not found via API.';
        AppLoggerHelper.warning(
          'Exchange token failed: Account not found (404). Backend message: $backendErrorMessage',
        );
        // Throw exception with specific prefix for BLoC to identify
        throw Exception(
          "NO_ACCOUNT_FOUND: $backendErrorMessage",
        ); // <<< Specific Format
      } else {
        // Handle other Dio errors (e.g., 500, 401, 403, network timeouts)
        final errorMessage =
            e.response?.data is Map<String, dynamic>
                ? e.response?.data['detail'] ??
                    e.response?.data['message'] ??
                    e.message
                : e.message ?? 'Unknown network or server error.';
        AppLoggerHelper.error(
          'Exchange token failed with other Dio error: $errorMessage',
        );
        throw Exception('API Error: $errorMessage');
      }
      // ***** END OF CHANGE *****
    } catch (error) {
      AppLoggerHelper.error('Exchange token error: $error');
      throw Exception('Failed to exchange token: ${error.toString()}');
    }
  }

  Future<CreateCompanyModel> createCompany({
    String? name,
    required String gstNumber,
    String? address,
    required String email,
  }) async {
    try {
      final response = await DioClient.perform(
        ApiStrings.createCompany,
        ApiMethods.post,
        data: {
          ApiVariables.name: name ?? '',
          ApiVariables.gstNumber: gstNumber,
          ApiVariables.address: address ?? '',
          ApiVariables.email: email,
        },
      );

      final Map<String, dynamic> jsonMap = response.data;
      if (response.statusCode == 201) {
        // Check if response has a success field
        if (jsonMap.containsKey(ApiVariables.success)) {
          if (jsonMap[ApiVariables.success] == true) {
            return CreateCompanyModel.fromJson(jsonMap['data']);
          } else {
            throw Exception(
              jsonMap[ApiVariables.message] ?? 'Unknown error occurred',
            );
          }
        } else {
          // Direct response without success field, parse the response directly
          return CreateCompanyModel.fromJson(jsonMap);
        }
      } else if (response.statusCode == 200) {
        // Company Already Exists
        AppLoggerHelper.warning('Company already exists: $jsonMap');
        final existsResponse = CompanyExistsResponse.fromJson(jsonMap);
        // Throw a specific exception to be caught by the Bloc
        throw CompanyExistsException(
          existsResponse.message,
          existsResponse.assignedToPhoneNumber,
        );
      } else {
        AppLoggerHelper.error(
          'Company creation failed with status ${response.statusCode}: ${response.data}',
        );
        throw Exception(
          jsonMap[ApiVariables.message] ??
              'Request failed with status: ${response.statusCode}',
        );
      }
    } on DioException catch (dioError) {
      if (dioError.response != null && dioError.response?.data != null) {
        // Check if the error response matches the CompanyExists structure (e.g., 409 Conflict might use this)
        final errorData = dioError.response?.data;
        if (errorData is Map<String, dynamic> &&
            errorData.containsKey('message') &&
            errorData['message'].toString().contains("COMPANY_EXISTS")) {
          final existsResponse = CompanyExistsResponse.fromJson(errorData);
          throw CompanyExistsException(
            existsResponse.message,
            existsResponse.assignedToPhoneNumber,
          );
        } else {
          final errorMessage =
              errorData is Map<String, dynamic>
                  ? (errorData['detail'] ??
                      errorData['message'] ??
                      'Unknown server error')
                  : dioError.message;
          throw Exception(errorMessage);
        }
      } else {
        throw Exception('Network error: ${dioError.message}');
      }
    } on CompanyExistsException {
      rethrow; // <<< Make sure to rethrow the specific exception
    } catch (e) {
      throw Exception('Failed to create company: ${e.toString()}');
    }
  }
}
