import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:stafup/feature/authentication/data/model/create_company_model.dart';
import 'package:stafup/feature/authentication/data/model/auth_model.dart';
import 'package:stafup/feature/authentication/data/model/exchange_token_model.dart';
import 'package:stafup/feature/authentication/data/repository/auth_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
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

  FutureOr<void> _verifyOTP(VerifyOTP event, Emitter<AuthState> emit) async {
    emit(Loading(store: state.store.copyWith(loading: true)));

    try {
      final result = await _authRepository.verifyOTP(
        event.verificationId,
        event.otp,
      );

      if (result.success) {
        emit(
          OTPVerified(
            store: state.store.copyWith(loading: false, user: result.user),
          ),
        );
      } else {
        emit(
          OtpVerifiedError(
            store: state.store.copyWith(
              loading: false,
              errorMessage: result.errorMessage ?? 'Verification failed',
            ),
          ),
        );
      }
    } catch (e) {
      emit(
        OtpVerifiedError(
          store: state.store.copyWith(
            loading: false,
            errorMessage: 'Unexpected error occurred',
          ),
        ),
      );
    }
  }

  Future<void> _onExchangeToken(
    _ExchangeToken event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(AuthState.loading(store: state.store.copyWith(loading: true)));

      final ExchangeTokenModel tokenData = await _authRepository.exchangeToken(
        phone: state.store.phoneNumber,
      );

      emit(
        AuthState.exchangeTokenVerified(
          store: state.store.copyWith(
            loading: false,
            exchangeTokenModel: tokenData,
          ),
        ),
      );
    } catch (e) {
      emit(
        AuthState.error(
          store: state.store.copyWith(
            loading: false,
            errorMessage: e.toString(),
          ),
        ),
      );
    }
  }

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
      );

      emit(
        AuthState.createCompanySuccess(
          store: state.store.copyWith(loading: false, createCompanyModel: data),
        ),
      );
    } catch (e) {
      emit(
        AuthState.createCompanyError(
          store: state.store.copyWith(
            loading: false,
            errorMessage: e.toString(),
          ),
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
  }) {
    {
      add(
        AuthEvent.createCompanyEvent(
          name: name,
          gstNumber: gstNumber,
          address: address,
        ),
      );
    }
  }
}
