import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stafup/feature/authentication/presentation/verify_gst_number.dart';
import 'package:stafup/utils/bloc_utils.dart';
import 'package:stafup/utils/logger.dart';
import 'package:itq_utils/itq_utils.dart';
import 'package:provider/provider.dart';

import 'package:stafup/utils/fh_color_provider.dart';
import 'package:stafup/utils/fh_colors.dart';
import 'package:stafup/utils/fh_constant.dart';
import 'package:stafup/utils/fh_global_widgets.dart';
import 'package:stafup/feature/bottom_navigation.dart';
import 'package:stafup/feature/authentication/bloc/auth_bloc.dart';
import 'package:stafup/feature/authentication/presentation/enter_number.dart';

class OTPVerification extends StatefulWidget {
  final String tag = '/OTPVerification';
  final String? verificationId;
  final String? phoneNumber;

  const OTPVerification({super.key, this.verificationId, this.phoneNumber});

  @override
  OTPVerificationState createState() => OTPVerificationState();
}

class OTPVerificationState extends State<OTPVerification> {
  TextEditingController otpFieldController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Provider.of<ColorNotifier>(context);
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is OtpVerifiedError) {
          final errorMessage = state.store.errorMessage ?? 'Unknown error';
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(errorMessage)));
        }

        if (state is OTPVerified) {
          getBloc<AuthBloc>(
            context,
          ).exchangeTokenVerified(phoneNumber: state.store.user!.phoneNumber!);
        } else if (state is ExchangeTokenVerified) {
          setValue(isLoggedIn, true);
          setValue(companyId, state.store.exchangeTokenModel?.user?.companyId);
          AppLoggerHelper.info(
            'Company ID: ${state.store.exchangeTokenModel?.user?.companyId}',
          );

          if (state.store.exchangeTokenModel?.user?.companyId != null) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder:
                    (context) => BottomNavigation(
                      companyId:
                          state.store.exchangeTokenModel?.user?.companyId,
                    ),
              ),
              (Route<dynamic> route) => false,
            );
          } else {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => VerifyGstNumber()),
              (Route<dynamic> route) => false,
            );
          }
        }
      },
      builder: (context, state) {
        final isLoading = state.store.loading;
        final size = MediaQuery.of(context).size;
        final theme = Theme.of(context);
        final textTheme = theme.textTheme;
        final colorScheme = theme.colorScheme;
        return BackgroundScreen(
          isBack: false,
          isAppBarRequired: false,
          title: '',
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/logo.png',
                      height: 100,
                      width: 100,
                      errorBuilder:
                          (context, error, stackTrace) =>
                              const Icon(Icons.image_not_supported, size: 100),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Welcome to Stafup',
                      style: textTheme.displayMedium?.copyWith(
                        color: colorScheme.primary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Find your perfect candidates',
                      style: textTheme.bodyLarge?.copyWith(
                        color: colorScheme.onSurface.withAlpha(153),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 64),

                    Text(
                      'Enter the 6-digit code sent to ${widget.phoneNumber}',
                      style: textTheme.bodyLarge?.copyWith(
                        color: colorScheme.onSurface.withAlpha(153),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: otpFieldController,
                      keyboardType: TextInputType.text,
                      maxLength: 6,
                      enabled: !isLoading,
                      textAlign: TextAlign.center,
                      style: textTheme.bodyLarge,
                      decoration: const InputDecoration(
                        hintText: '- - - - - -',
                        counterText: "",
                      ),

                      validator: (value) {
                        if (value == null || value.trim().length != 6) {
                          return 'Enter six digits of code';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () {
                          // VerifyGstNumber().launch(context);

                          if (_formKey.currentState!.validate() &&
                              otpFieldController.text.length == 6) {
                            context.read<AuthBloc>().add(
                              AuthEvent.verifyOTP(
                                verificationId: widget.verificationId!,
                                otp: otpFieldController.text,
                              ),
                            );
                          }
                        },
                        child:
                            isLoading
                                ? CircularProgressIndicator(color: Colors.white)
                                : const Text(
                                  'Verify OTP',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: HrmColors.white,
                                  ),
                                ),
                      ),
                    ),

                    state is Error
                        ? Container(
                          width: double.infinity,
                          margin: const EdgeInsets.only(top: 20),
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.red[100]!),
                            color: Colors.red[50],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'No account found. Please call\n08035736733 to register',
                                textAlign: TextAlign.center,
                                style: textTheme.bodyLarge?.copyWith(
                                  color: Colors.red.shade900,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 20),
                              OutlinedButton(
                                onPressed: () {},
                                style: OutlinedButton.styleFrom(
                                  side: BorderSide(color: Colors.red.shade200),
                                  alignment: Alignment.center,
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  spacing: 16,
                                  children: [
                                    Icon(
                                      Icons.call,
                                      color: Colors.red.shade900,
                                    ),
                                    Text(
                                      'Call to Register',
                                      style: textTheme.headlineSmall?.copyWith(
                                        color: Colors.red.shade800,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                        : Padding(
                          padding: const EdgeInsets.only(top: 64),
                          child: InkWell(
                            onTap:
                                () => Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => EnterNumber(),
                                  ),
                                  (route) => false,
                                ),
                            child: Text(
                              'Change Mobile Number',
                              style: TextStyle(color: colorScheme.primary),
                            ),
                          ),
                        ),
                    const SizedBox(height: 56),
                    Row(
                      children: [
                        Expanded(child: Divider(color: Colors.grey.shade300)),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            children: [
                              Text(
                                'Powered by',
                                style: textTheme.bodySmall?.copyWith(
                                  color: colorScheme.onSurface.withAlpha(153),
                                ),
                              ),
                              const SizedBox(width: 4),
                              Image.asset(
                                'assets/images/onest-logo.png',
                                height: 18,
                                width: 40,
                                errorBuilder:
                                    (context, error, stackTrace) => const Text(
                                      'Onest',
                                      style: TextStyle(fontSize: 10),
                                    ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(child: Divider(color: Colors.grey.shade300)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
