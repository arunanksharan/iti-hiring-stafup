part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.started() = _Started;
  const factory AuthEvent.sendOTP({required String phoneNumber}) = SendOTP;
  const factory AuthEvent.verifyOTP({
    required String verificationId,
    required String otp
  }) = VerifyOTP;

  const factory AuthEvent.exchangeToken({required String phoneNumber}) = _ExchangeToken;
  const factory AuthEvent.createCompanyEvent({
    String? name,
    required String gstNumber,
    String? address,
}) = _CreateCompanyEvent;

}