import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:stafup/feature/authentication/data/model/create_company_model.dart';
import 'package:stafup/feature/authentication/data/model/auth_model.dart';
import 'package:stafup/feature/authentication/data/model/exchange_token_model.dart';
import 'package:stafup/feature/authentication/data/repository/auth_repository.dart';
import 'package:stafup/utils/fh_constant.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stafup/utils/logger.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;

  AuthBloc(this._authRepository)
    : super(const Initial(store: AuthStateStore())) {
    on<SendOTP>(_sendOTP);
    on<VerifyOTP>(_verifyOTP);
    on<_ExchangeToken>(_onExchangeToken);
    on<_CreateCompanyEvent>(_onCreateCompanyEvent);
  }

  FutureOr<void> _sendOTP(SendOTP event, Emitter<AuthState> emit) async {
    emit(Loading(store: state.store.copyWith(loading: true)));

    try {
      final result = await _authRepository.sendOTP(event.phoneNumber);
      emit(
        OTPSent(
          store: state.store.copyWith(
            loading: false,
            verificationId: result.verificationId!,
            phoneNumber: event.phoneNumber,
          ),
        ),
      );
    } catch (e) {
      String errorMsg = 'Something went wrong. Please try again.';

      if (e is AuthResultModel && e.errorMessage != null) {
        errorMsg = e.errorMessage!;
      } else if (e is FirebaseAuthException) {
        errorMsg = e.message ?? errorMsg;
      } else {
        errorMsg = e.toString();
      }

      emit(
        PhoneNumberError(
          store: state.store.copyWith(loading: false, errorMessage: errorMsg),
        ),
      );
    }
  }

  // --- _verifyOTP mostly the same, ensure it clears relevant state ---
  FutureOr<void> _verifyOTP(VerifyOTP event, Emitter<AuthState> emit) async {
    emit(Loading(store: state.store.copyWith(loading: true)));
    try {
      final result = await _authRepository.verifyOTP(
        event.verificationId,
        event.otp,
      );

      if (result.success) {
        // Successfully verified OTP with Firebase, user is available
        emit(
          OTPVerified(
            // Transition to OTPVerified state
            store: state.store.copyWith(
              loading: false,
              user: result.user, // Store the verified user
              errorMessage: null, // Clear errors
            ),
          ),
        );
        // Trigger exchange token immediately after OTP verification success
        if (result.user?.phoneNumber != null) {
          add(AuthEvent.exchangeToken(phoneNumber: result.user!.phoneNumber!));
        } else {
          AppLoggerHelper.error(
            "OTP Verified but phone number is null in result user.",
          );
          // Emit an error state because we cannot proceed without phone number
          emit(
            OtpVerifiedError(
              store: state.store.copyWith(
                loading: false,
                errorMessage:
                    'Verification succeeded but phone number is missing.',
              ),
              // isAccountNotFound: false, // Not an account not found error
            ),
          );
        }
      } else {
        // OTP verification with Firebase failed (e.g., wrong code)
        AppLoggerHelper.warning(
          "OTP Verification Failed: ${result.errorMessage}",
        );
        emit(
          OtpVerifiedError(
            // Use specific error state
            store: state.store.copyWith(
              loading: false,
              errorMessage: result.errorMessage ?? 'Incorrect OTP entered.',
            ),
            // isAccountNotFound: false, // Not an account not found error
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      // Catch Firebase specific exceptions
      AppLoggerHelper.error("Firebase error during VerifyOTP: ${e.message}", e);
      emit(
        OtpVerifiedError(
          // Use specific error state
          store: state.store.copyWith(
            loading: false,
            errorMessage: e.message ?? 'Firebase verification error.',
          ),
          // isAccountNotFound: false, // Not an account not found error
        ),
      );
    } catch (e) {
      // Catch any other unexpected errors
      AppLoggerHelper.error("Unexpected error during VerifyOTP: $e", e);
      emit(
        OtpVerifiedError(
          // Use specific error state
          store: state.store.copyWith(
            loading: false,
            errorMessage: 'An unexpected error occurred during verification.',
          ),
          // isAccountNotFound: false, // Not an account not found error
        ),
      );
    }
  }

  // --- _onExchangeToken with specific error handling ---
  Future<void> _onExchangeToken(
    _ExchangeToken event,
    Emitter<AuthState> emit,
  ) async {
    // Don't necessarily need loading state again if triggered right after OTPVerified
    // emit(AuthState.loading(store: state.store.copyWith(loading: true)));
    final String phoneToUse = event.phoneNumber;

    try {
      AppLoggerHelper.info("Bloc: Calling exchangeToken for $phoneToUse");
      final ExchangeTokenModel tokenData = await _authRepository.exchangeToken(
        phone: phoneToUse,
      );
      AppLoggerHelper.info("Bloc: exchangeToken success.");

      emit(
        AuthState.exchangeTokenVerified(
          // Success state
          store: state.store.copyWith(
            loading: false, // Ensure loading is false
            exchangeTokenModel: tokenData,
            errorMessage: null, // Clear errors
          ),
        ),
      );
    } catch (e) {
      AppLoggerHelper.error('Bloc: Error during _onExchangeToken: $e', e);
      String errorMessage = 'An unexpected error occurred.';
      bool accountNotFound = false; // Flag

      // ***** START OF CHANGE *****
      if (e is Exception && e.toString().contains("NO_ACCOUNT_FOUND")) {
        // Specific error from repository
        errorMessage = "Account not found error occurred."; // Internal message
        accountNotFound = true; // Set the flag
        AppLoggerHelper.warning("Bloc: Detected NO_ACCOUNT_FOUND.");
      } else if (e is Exception) {
        // Other exceptions from repository or elsewhere
        errorMessage = e.toString();
      } else {
        errorMessage = e.toString(); // Non-exception errors (less likely)
      }
      // ***** END OF CHANGE *****

      // Emit the generic Error state with the flag
      emit(
        AuthState.error(
          store: state.store.copyWith(
            loading: false, // Ensure loading is false
            errorMessage: errorMessage, // Store internal/generic message
          ),
          isAccountNotFound: accountNotFound, // <<< Pass the flag
        ),
      );
    }
  }

  // FutureOr<void> _verifyOTP(VerifyOTP event, Emitter<AuthState> emit) async {
  //   emit(Loading(store: state.store.copyWith(loading: true)));

  //   try {
  //     final result = await _authRepository.verifyOTP(
  //       event.verificationId,
  //       event.otp,
  //     );

  //     if (result.success) {
  //       emit(
  //         OTPVerified(
  //           store: state.store.copyWith(
  //             loading: false,
  //             user: result.user,
  //             errorMessage: null,
  //           ),
  //         ),
  //       );
  //     } else {
  //       emit(
  //         OtpVerifiedError(
  //           store: state.store.copyWith(
  //             loading: false,
  //             errorMessage: result.errorMessage ?? 'Verification failed',
  //           ),
  //         ),
  //       );
  //     }
  //   } catch (e) {
  //     emit(
  //       OtpVerifiedError(
  //         store: state.store.copyWith(
  //           loading: false,
  //           errorMessage: 'Unexpected error occurred',
  //         ),
  //       ),
  //     );
  //   }
  // }

  // Future<void> _onExchangeToken(
  //   _ExchangeToken event,
  //   Emitter<AuthState> emit,
  // ) async {
  //   try {
  //     final String phoneToUse = event.phoneNumber;
  //     emit(AuthState.loading(store: state.store.copyWith(loading: true)));

  //     final ExchangeTokenModel tokenData = await _authRepository.exchangeToken(
  //       phone: phoneToUse,
  //     );

  //     emit(
  //       AuthState.exchangeTokenVerified(
  //         store: state.store.copyWith(
  //           loading: false,
  //           exchangeTokenModel: tokenData,
  //           errorMessage: null,
  //         ),
  //       ),
  //     );
  //   } catch (e) {
  //     emit(
  //       AuthState.error(
  //         store: state.store.copyWith(
  //           loading: false,
  //           errorMessage: e.toString(),
  //         ),
  //       ),
  //     );
  //   }
  // }

  Future<void> _onCreateCompanyEvent(
    _CreateCompanyEvent event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(AuthState.loading(store: state.store.copyWith(loading: true)));

      final CreateCompanyModel data = await _authRepository.createCompany(
        name: event.name,
        gstNumber: event.gstNumber,
        address: event.address,
        email: event.email,
      );

      // Save company ID to shared preferences
      final prefs = await SharedPreferences.getInstance();
      if (data.id != null) {
        await prefs.setString(companyId, data.id!);
        await prefs.reload();
        AppLoggerHelper.info(
          'Company created/fetched and ID saved: ${data.id}',
        );

        // Instead of creating new objects, let's just directly update the state
        emit(
          AuthState.createCompanySuccess(
            store: state.store.copyWith(
              loading: false,
              createCompanyModel: data,
              errorMessage: "",
            ),
          ),
        );
      } else {
        AppLoggerHelper.warning('Company ID received from backend was null.');
        // Handle case where ID might be null unexpectedly, maybe emit error
        emit(
          AuthState.createCompanyError(
            // Use AuthState.createCompanyError
            store: state.store.copyWith(
              loading: false,
              errorMessage: 'Company ID was null after creation.',
            ),
            companyExistsMessage: null, // Explicitly null
            maskedPhoneNumber: null, // Explicitly null
          ),
        );
      }
    } on CompanyExistsException catch (e) {
      AppLoggerHelper.warning(
        'CompanyExistsException caught in Bloc: ${e.message}',
      );
      // Handle the specific "Company Exists" error
      emit(
        AuthState.createCompanyError(
          // Use AuthState.createCompanyError
          store: state.store.copyWith(
            loading: false,
            errorMessage: e.message,
          ), // Store generic message in errorMessage
          companyExistsMessage: e.message, // Store specific message
          maskedPhoneNumber: e.maskedPhoneNumber, // Store masked number
        ),
      );
    } catch (e) {
      AppLoggerHelper.error('Error during _onCreateCompanyEvent: $e');
      emit(
        AuthState.createCompanyError(
          // Use AuthState.createCompanyError
          store: state.store.copyWith(
            loading: false,
            errorMessage: e.toString(),
          ),
          companyExistsMessage: null, // No specific company exists message here
          maskedPhoneNumber: null, // No masked number here
        ),
      );
    }
  }

  void exchangeTokenVerified({required String phoneNumber}) {
    {
      add(AuthEvent.exchangeToken(phoneNumber: phoneNumber));
    }
  }

  void createCompany({
    String? name,
    required String gstNumber,
    String? address,
    required String email,
  }) {
    {
      add(
        AuthEvent.createCompanyEvent(
          name: name,
          gstNumber: gstNumber,
          address: address,
          email: email,
        ),
      );
    }
  }
}
