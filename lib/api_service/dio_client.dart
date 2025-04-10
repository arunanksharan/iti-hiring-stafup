import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:stafup/feature/authentication/presentation/enter_number.dart';
import 'package:stafup/utils/logger.dart';
import 'package:itq_utils/itq_utils.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:get/get.dart' as test;
import 'package:provider/provider.dart';

import '../utils/fh_color_provider.dart';
import '../utils/fh_constant.dart';
import '../utils/fh_global_function.dart';

class DioClient {
  static late Dio _dio;
  static bool _isDialogShowing = false;
  static bool _isLoggingOut = false;
  static void init(String baseUrl) {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(minutes: 1),
        sendTimeout: const Duration(minutes: 1),
        receiveTimeout: const Duration(minutes: 1),
        validateStatus: (status) {
          return status! < 500 || status >= 600;
        },
      ),
    );

    if (kDebugMode) {
      _dio.interceptors.add(PrettyDioLogger());
    }

    _dio.interceptors.add(
      InterceptorsWrapper(
        onResponse: (response, handler) {
          if (response.statusCode == 401) {
            _handleUnauthenticated();
            return; // Prevent further processing
          }
          handler.next(response);
        },
        onError: (DioException error, handler) {
          if (error.response?.statusCode == 401) {
            _handleUnauthenticated();
            return; // Prevent further processing
          }
          _handleError(error, test.Get.context!);
          handler.next(error);
        },
      ),
    );
  }

  static Future<Response> perform(
    String url,
    String method, {
    Map<String, dynamic>? body,
    Object? data,
  }) async {
    try {
      AppLoggerHelper.debug('${getStringAsync(apiAuthToken)}');
      return await _dio.request(
        url,
        queryParameters: body,
        data: data,
        options: Options(
          method: method,
          headers: {
            'Accept': 'application/json',
            'authorization': 'Bearer ${getStringAsync(apiAuthToken)}',
            'Content-Type': 'application/json',
          },
        ),
      );
    } on DioException catch (e) {
      _handleError(e, test.Get.context!);
      rethrow;
    }
  }

  static void _handleUnauthenticated() {
    if (_isLoggingOut) {
      return; // Prevent multiple logout calls
    }
    _isLoggingOut = true;

    // final context = NavigationService.navigatorKey.currentContext!;
    final context = test.Get.context!;
    final notifier = Provider.of<ColorNotifier>(context, listen: false);

    if (_isDialogShowing) {
      return;
    }
    _isDialogShowing = true;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Session Expired'),
          content: const Text('Your session has expired. Please log in again.'),
          actions: [
            TextButton(
              onPressed: () {
                _isDialogShowing = false;
                _isLoggingOut = false;
                Navigator.of(context).pop();
                setValue(isLoggedIn, false);
                // Navigate to login screen
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => EnterNumber()),
                  (Route<dynamic> route) => false,
                );
              },
              child: Text(
                'Log In Again',
                style: TextStyle(color: notifier.textColor),
              ),
            ),
          ],
        );
      },
    );
  }

  static void _handleError(DioException error, BuildContext context) {
    final notifier = Provider.of<ColorNotifier>(context, listen: false);
    // Check if a dialog is already showing
    if (_isDialogShowing) {
      return;
    }

    String errorMessage;
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        errorMessage =
            'Connection timed out. Your internet connection might be slow. Please check your connection and try again.';
      case DioExceptionType.sendTimeout:
        errorMessage =
            'Send timeout. Your internet connection might be slow. Please try again later.';
      case DioExceptionType.receiveTimeout:
        errorMessage =
            'Receive timeout. Your internet connection might be slow. Please check your connection and try again.';
      case DioExceptionType.badResponse:
        errorMessage = _getErrorMessageFromResponse(error.response);
      case DioExceptionType.cancel:
        errorMessage = 'Request was cancelled.';
      case DioExceptionType.unknown:
        if (error.error is SocketException) {
          errorMessage =
              'No internet connection. Please check your network settings and try again.';
        } else {
          errorMessage =
              'An unexpected error occurred. Please try again later.';
        }
      default:
        errorMessage = 'An error occurred. Please try again.';
    }

    // Set the flag to true before showing the dialog
    _isDialogShowing = true;
    openDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(errorMessage),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _isDialogShowing =
                    false; // Reset the flag after the dialog is closed
              },
              child: Text('OK', style: TextStyle(color: notifier.textColor)),
            ),
          ],
        );
      },
    );

    print('Error: $errorMessage');
  }

  static String _getErrorMessageFromResponse(Response? response) {
    if (response == null) {
      return 'An error occurred. Please try again.';
    }
    switch (response.statusCode) {
      case 400:
        return 'Bad request. Please check your input and try again.';
      case 401:
        return 'Unauthorized. Please log in again.';
      case 403:
        return 'Access denied. You do not have permission to perform this action.';
      case 404:
        return 'Resource not found. Please try again later.';
      case 500:
        return 'Server error. Please try again later or contact support.';
      default:
        return 'An error occurred. Please try again.';
    }
  }
}
