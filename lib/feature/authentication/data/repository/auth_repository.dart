// In job_details_repository.dart
import 'dart:async';

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
      } else {
        final errorMessage =
            response.data[ApiVariables.message] ??
            'Request failed with status: ${response.statusCode}';
        throw Exception(errorMessage);
      }
    } catch (error) {
      print("Exchange token error: $error");
      throw Exception('Failed to exchange token: ${error.toString()}');
    }
  }

  Future<CreateCompanyModel> createCompany({
    String? name,
    required String gstNumber,
    String? address,
  }) async {
    try {
      final response = await DioClient.perform(
        ApiStrings.createCompany,
        ApiMethods.post,
        data: {
          ApiVariables.name: name ?? '',
          ApiVariables.gstNumber: gstNumber,
          ApiVariables.address: address ?? '',
        },
      );

      final Map<String, dynamic> jsonMap = response.data;
      if (response.statusCode == 200 || response.statusCode == 201) {
        if (jsonMap[ApiVariables.success] == true) {
          return CreateCompanyModel.fromJson(jsonMap['data']);
        } else {
          throw Exception(
            jsonMap[ApiVariables.message] ?? 'Unknown error occurred',
          );
        }
      } else {
        throw Exception(
          jsonMap[ApiVariables.message] ??
              'Request failed with status: ${response.statusCode}',
        );
      }
    } on DioException catch (dioError) {
      if (dioError.response != null && dioError.response?.data != null) {
        final errorData = dioError.response?.data;
        final errorMessage = errorData['detail'] ?? 'Unknown server error';
        throw Exception(errorMessage);
      } else {
        throw Exception('Network error: ${dioError.message}');
      }
    } catch (e) {
      throw Exception('Failed to create company: ${e.toString()}');
    }
  }
}
