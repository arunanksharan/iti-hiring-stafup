import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stafup/feature/authentication/presentation/verify_gst_number.dart';
import 'package:stafup/utils/bloc_utils.dart';
import 'package:stafup/utils/logger.dart';
import 'package:itq_utils/itq_utils.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

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
        state.maybeWhen(
          // Listen for successful exchange token to navigate
          exchangeTokenVerified: (store) {
            AppLoggerHelper.info('Listener: ExchangeTokenVerified');
            setValue(isLoggedIn, true);
            setValue(companyId, store.exchangeTokenModel?.user?.companyId);
            AppLoggerHelper.info(
              'Company ID from exchange token: ${store.exchangeTokenModel?.user?.companyId}',
            );

            if (store.exchangeTokenModel?.user?.companyId != null) {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder:
                      (context) => BottomNavigation(
                        companyId: store.exchangeTokenModel?.user?.companyId,
                      ),
                ),
                (Route<dynamic> route) => false,
              );
            } else {
              // No company ID associated after login, navigate to GST screen
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const VerifyGstNumber(),
                ),
                (Route<dynamic> route) => false,
              );
            }
          },
          // Listen for errors to potentially show snackbars (but not for handled UI errors)
          error: (store, isAccountNotFound) {
            // <<< Use the flag here
            if (!isAccountNotFound) {
              // Only show snackbar for generic errors
              final errorMessage =
                  store.errorMessage ?? 'An unknown error occurred';
              AppLoggerHelper.info(
                'Listener: Generic Error state - $errorMessage',
              );
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(errorMessage)));
            } else {
              AppLoggerHelper.info(
                'Listener: AccountNotFound error state detected, UI handles display.',
              );
            }
          },
          otpVerifiedError: (store) {
            // Listener for OTP specific errors
            final errorMessage =
                store.errorMessage ?? 'OTP Verification failed';
            AppLoggerHelper.info(
              'Listener: OtpVerifiedError state - $errorMessage',
            );
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(errorMessage)));
          },
          // Optional: Listen for other states if needed
          orElse: () {
            // Default case or listen for other specific states like OTPSent, Loading etc.
          },
        );
      },
      // Add the missing comma here
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
                                ? const SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 2,
                                  ),
                                )
                                : const Text(
                                  'Verify OTP',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: HrmColors.white,
                                  ),
                                ),
                      ),
                    ),

                    /// ***** MODIFIED ERROR DISPLAY SECTION *****
                    // Use maybeWhen for cleaner state checking in builder
                    state.maybeWhen(
                      error: (store, isAccountNotFound) {
                        // <<< Check flag here
                        return Padding(
                          padding: const EdgeInsets.only(top: 32.0),
                          child:
                              isAccountNotFound
                                  // --- Show Specific "No Account Found" Widget ---
                                  ? Container(
                                    width: double.infinity,
                                    margin: const EdgeInsets.only(bottom: 16),
                                    padding: const EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.red[100]!,
                                      ),
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
                                        const SizedBox(height: 20),
                                        OutlinedButton.icon(
                                          icon: Icon(
                                            Icons.call,
                                            color: Colors.red.shade900,
                                          ),
                                          label: Text(
                                            'Call to Register',
                                            style: textTheme.bodyLarge
                                                ?.copyWith(
                                                  // Adjusted style slightly
                                                  color: Colors.red.shade800,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                          // ***** IMPLEMENTED onPressed *****
                                          onPressed: () async {
                                            // Make the function async
                                            final Uri launchUri = Uri(
                                              scheme: 'tel',
                                              path:
                                                  '08035736733', // The phone number to dial
                                            );
                                            try {
                                              AppLoggerHelper.info(
                                                "Attempting to launch dialer for ${launchUri.toString()}",
                                              );
                                              // Attempt to launch the phone dialer
                                              if (!await launchUrl(launchUri)) {
                                                // Handle the case where launchUrl returns false but doesn't throw
                                                AppLoggerHelper.error(
                                                  "Could not launch ${launchUri.toString()}",
                                                );
                                                // Check if the widget is still mounted before showing SnackBar
                                                if (context.mounted) {
                                                  ScaffoldMessenger.of(
                                                    context,
                                                  ).showSnackBar(
                                                    const SnackBar(
                                                      content: Text(
                                                        'Could not open phone dialer.',
                                                      ),
                                                    ),
                                                  );
                                                }
                                              }
                                            } catch (e) {
                                              // Handle any exceptions during the launch process
                                              AppLoggerHelper.error(
                                                "Error launching dialer: $e",
                                              );
                                              // Check if the widget is still mounted before showing SnackBar
                                              if (context.mounted) {
                                                ScaffoldMessenger.of(
                                                  context,
                                                ).showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'Error opening phone dialer: $e',
                                                    ),
                                                  ),
                                                );
                                              }
                                            }
                                          },
                                          // ***** END IMPLEMENTED onPressed *****,
                                          style: OutlinedButton.styleFrom(
                                            side: BorderSide(
                                              color: Colors.red.shade200,
                                            ),
                                            alignment: Alignment.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                  // --- Show Generic Error Message ---
                                  : Container(
                                    width: double.infinity,
                                    margin: const EdgeInsets.only(bottom: 16),
                                    padding: const EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.orange[100]!,
                                      ),
                                      color: Colors.orange[50],
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Text(
                                      store.errorMessage ??
                                          'An unknown error occurred.',
                                      textAlign: TextAlign.center,
                                      style: textTheme.bodyMedium?.copyWith(
                                        color: Colors.orange.shade900,
                                      ),
                                    ),
                                  ),
                        );
                      },
                      otpVerifiedError: (store) {
                        // Handle OTP Verification Errors
                        // Assuming OtpVerifiedError should show generic message
                        return Padding(
                          padding: const EdgeInsets.only(
                            top: 32.0,
                            bottom: 16.0,
                          ),
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.orange[100]!),
                              color: Colors.orange[50],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              store.errorMessage ?? 'OTP Verification failed.',
                              textAlign: TextAlign.center,
                              style: textTheme.bodyMedium?.copyWith(
                                color: Colors.orange.shade900,
                              ),
                            ),
                          ),
                        );
                      },
                      orElse:
                          () =>
                              const SizedBox.shrink(), // Return empty space for other states
                    ),
                    // Always display the "Change Mobile Number" link (Keep as is)
                    Padding(
                      // Conditional padding adjusts based on whether the error is shown
                      padding: EdgeInsets.only(top: (state is Error) ? 16 : 64),
                      child: InkWell(
                        onTap:
                            isLoading
                                ? null
                                : () {
                                  // Disable if loading
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => EnterNumber(),
                                    ),
                                    (route) => false,
                                  );
                                },
                        child: Text(
                          'Change Mobile Number',
                          style: TextStyle(color: colorScheme.primary),
                        ),
                      ),
                    ),

                    // ***** END OF CORRECTED SECTION *****
                    const SizedBox(height: 56),

                    // state is Error
                    //     ? Container(
                    //       width: double.infinity,
                    //       margin: const EdgeInsets.only(top: 20),
                    //       padding: EdgeInsets.all(16),
                    //       decoration: BoxDecoration(
                    //         border: Border.all(color: Colors.red[100]!),
                    //         color: Colors.red[50],
                    //         borderRadius: BorderRadius.circular(12),
                    //       ),
                    //       child: Column(
                    //         mainAxisSize: MainAxisSize.min,
                    //         children: [
                    //           Text(
                    //             'No account found. Please call\n08035736733 to register',
                    //             textAlign: TextAlign.center,
                    //             style: textTheme.bodyLarge?.copyWith(
                    //               color: Colors.red.shade900,
                    //               fontWeight: FontWeight.w600,
                    //             ),
                    //           ),
                    //           SizedBox(height: 20),
                    //           OutlinedButton(
                    //             onPressed: () {},
                    //             style: OutlinedButton.styleFrom(
                    //               side: BorderSide(color: Colors.red.shade200),
                    //               alignment: Alignment.center,
                    //             ),
                    //             child: Row(
                    //               crossAxisAlignment: CrossAxisAlignment.center,
                    //               mainAxisAlignment: MainAxisAlignment.center,
                    //               mainAxisSize: MainAxisSize.min,
                    //               spacing: 16,
                    //               children: [
                    //                 Icon(
                    //                   Icons.call,
                    //                   color: Colors.red.shade900,
                    //                 ),
                    //                 Text(
                    //                   'Call to Register',
                    //                   style: textTheme.headlineSmall?.copyWith(
                    //                     color: Colors.red.shade800,
                    //                     fontWeight: FontWeight.w500,
                    //                   ),
                    //                 ),
                    //               ],
                    //             ),
                    //           ),
                    //         ],
                    //       ),
                    //     )
                    //     : Padding(
                    //       padding: const EdgeInsets.only(top: 64),
                    //       child: InkWell(
                    //         onTap:
                    //             () => Navigator.pushAndRemoveUntil(
                    //               context,
                    //               MaterialPageRoute(
                    //                 builder: (context) => EnterNumber(),
                    //               ),
                    //               (route) => false,
                    //             ),
                    //         child: Text(
                    //           'Change Mobile Number',
                    //           style: TextStyle(color: colorScheme.primary),
                    //         ),
                    //       ),
                    //     ),
                    // const SizedBox(height: 56),
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
