part of 'auth_bloc.dart';

@freezed
sealed class AuthState with _$AuthState {
  const factory AuthState.initial({
    required AuthStateStore store,
  }) = Initial;

  const factory AuthState.loading({
    required AuthStateStore store,
  }) = Loading;

  const factory AuthState.otpSent({
    required AuthStateStore store,
  }) = OTPSent;

  const factory AuthState.otpVerified({
    required AuthStateStore store,
  }) = OTPVerified;

  const factory AuthState.exchangeTokenVerified({
    required AuthStateStore store,
}) = ExchangeTokenVerified;

  const factory AuthState.createCompanySuccess({
    required AuthStateStore store,
  }) = CreateCompanySuccess;


  const factory AuthState.error({
    required AuthStateStore store,
  }) = Error;
  const factory AuthState.phoneNumberError({
    required AuthStateStore store,
  }) = PhoneNumberError;

  const factory AuthState.otpVerifiedError({
    required AuthStateStore store,
  }) = OtpVerifiedError;

  const factory AuthState.createCompanyError({
    required AuthStateStore store,
  }) = CreateCompanyError;
}

@freezed
class AuthStateStore with _$AuthStateStore {
  const factory AuthStateStore({
    @Default(false) bool loading,
    @Default("") String verificationId,
    @Default("") String phoneNumber,
    @Default("") String errorMessage,
    CreateCompanyModel? createCompanyModel,
    ExchangeTokenModel? exchangeTokenModel,
    UserModel? user,
  }) = _AuthStateStore;
}