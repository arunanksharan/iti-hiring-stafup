import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stafup/utils/bloc_utils.dart';
import 'package:stafup/utils/fh_colors.dart';
import 'package:stafup/utils/fh_global_widgets.dart';
import 'package:stafup/feature/bottom_navigation.dart';
import 'package:stafup/feature/authentication/bloc/auth_bloc.dart';
import 'package:stafup/utils/fh_global_function.dart';
import 'package:stafup/utils/logger.dart';
import 'package:stafup/feature/authentication/presentation/enter_number.dart';

class VerifyGstNumber extends StatefulWidget {
  final String tag = '/VerifyGstNumber';

  const VerifyGstNumber({super.key});

  @override
  VerifyGstNumberState createState() => VerifyGstNumberState();
}

class VerifyGstNumberState extends State<VerifyGstNumber> {
  TextEditingController gstFieldController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String? _companyExistsErrorMessage; // State variable for the specific error
  String? _maskedPhoneNumber; // State variable for masked number

  @override
  void dispose() {
    gstFieldController.dispose();
    emailController.dispose(); // <<< Dispose email controller
    super.dispose();
  }

  // Email Validation Function (using GlobalFunction)
  bool _validateEmail(String email) {
    return GlobalFunction().validateEmail(email);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        // Clear specific error message on loading or success
        if (state is Loading || state is CreateCompanySuccess) {
          setState(() {
            _companyExistsErrorMessage = null;
            _maskedPhoneNumber = null;
          });
        }

        if (state is CreateCompanyError) {
          AppLoggerHelper.info(
            'CreateCompanyError state received in UI listener',
          );

          if (state.companyExistsMessage != null) {
            AppLoggerHelper.info(
              'Company exists message found: ${state.companyExistsMessage}',
            );
            setState(() {
              _maskedPhoneNumber = state.maskedPhoneNumber;
              if (_maskedPhoneNumber != null) {
                _companyExistsErrorMessage =
                    "GSTIN already registered with No. $_maskedPhoneNumber. Contact your firm's team for login.";
              } else {
                _companyExistsErrorMessage =
                    "GSTIN already registered. Contact your firm's team.";
              }
              AppLoggerHelper.info(
                'UI Error message set to: $_companyExistsErrorMessage',
              );
            });
          } else {
            // Handle other generic errors from createCompany
            final errorMessage =
                state.store.errorMessage ??
                'Failed to create company. Please try again.';
            AppLoggerHelper.error('Generic CreateCompanyError: $errorMessage');
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(errorMessage)));
            setState(() {
              _companyExistsErrorMessage =
                  null; // Clear specific error if it's a generic one
              _maskedPhoneNumber = null;
            });
          }

          // // Check if it's the specific "Company Exists" error
          // final errorMessage = state.store.errorMessage ?? 'Unknown error';
          // ScaffoldMessenger.of(
          //   context,
          // ).showSnackBar(SnackBar(content: Text(errorMessage)));
        } else if (state is CreateCompanySuccess) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder:
                  (context) => BottomNavigation(
                    companyId: state.store.createCompanyModel?.id,
                  ),
            ),
            (Route<dynamic> route) => false,
          );
        }
      },
      builder: (context, state) {
        final isLoading = state.store.loading;
        final size = MediaQuery.of(context).size;
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

                    // const SizedBox(height: 64),
                    const SizedBox(height: 24),
                    Text(
                      'Verify your Company', // Updated text
                      style: textTheme.bodyLarge?.copyWith(
                        color: colorScheme.onSurface.withAlpha(153),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 64),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'GST Number*',
                        style: textTheme.bodyMedium?.copyWith(
                          color: Colors.grey[700],
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: gstFieldController,
                      keyboardType: TextInputType.text,
                      textCapitalization: TextCapitalization.characters,
                      maxLength: 15,
                      enabled: !isLoading,
                      decoration: const InputDecoration(counterText: ""),
                      style: textTheme.bodyLarge,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter GST number';
                        }
                        if (value.length != 15) {
                          return 'GST Number must be 15 characters';
                        }
                        // Basic regex for GSTIN format (can be more complex)
                        final RegExp gstRegex = RegExp(
                          r'^[0-9]{2}[A-Z]{5}[0-9]{4}[A-Z]{1}[1-9A-Z]{1}Z[0-9A-Z]{1}$',
                        );
                        if (!gstRegex.hasMatch(value)) {
                          return 'Invalid GST Number format';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Email ID*',
                        style: textTheme.bodyMedium?.copyWith(
                          color: Colors.grey[700],
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),

                    TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      enabled: !isLoading,
                      decoration: const InputDecoration(),
                      style: textTheme.bodyLarge,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter your email address';
                        }
                        if (!_validateEmail(value)) {
                          // Use validation function
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    if (_companyExistsErrorMessage != null && !isLoading)
                      Container(
                        width: double.infinity,
                        margin: const EdgeInsets.only(
                          bottom: 20,
                        ), // Add margin below
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.red[100]!),
                          color: Colors.red[50],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          _companyExistsErrorMessage!,
                          textAlign: TextAlign.center,
                          style: textTheme.bodyLarge?.copyWith(
                            color: Colors.red.shade900,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
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
                        // onPressed: () {
                        //   //BottomNavigation().launch(context);
                        //   if (_formKey.currentState!.validate()) {
                        //     getBloc<AuthBloc>(context).createCompany(
                        //       gstNumber: gstFieldController.text,
                        //       email: emailController.text,
                        //     );
                        //   }
                        // },
                        onPressed:
                            isLoading // Disable button when loading
                                ? null
                                : () {
                                  if (_formKey.currentState!.validate()) {
                                    // Clear previous specific error before submitting
                                    setState(() {
                                      _companyExistsErrorMessage = null;
                                      _maskedPhoneNumber = null;
                                    });
                                    // Dispatch event with both GST and Email
                                    context.read<AuthBloc>().createCompany(
                                      gstNumber: gstFieldController.text,
                                      email: emailController.text,
                                    );
                                  }
                                },
                        child:
                            isLoading
                                ? const SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(
                                    color: HrmColors.white,
                                    strokeWidth: 2,
                                  ),
                                )
                                : const Text(
                                  'Proceed',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: HrmColors.white,
                                  ),
                                ),
                      ),
                    ),
                    // ***** ADD THE FOLLOWING WIDGET HERE *****
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 32.0,
                      ), // Adjust spacing as needed
                      child: InkWell(
                        onTap:
                            isLoading
                                ? null
                                : () {
                                  // Optionally disable when loading
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => EnterNumber(),
                                    ),
                                    (Route<dynamic> route) =>
                                        false, // Remove all previous routes
                                  );
                                },
                        child: Text(
                          'Change Mobile Number',
                          style: TextStyle(
                            color:
                                colorScheme
                                    .primary, // Use theme's primary color
                            // fontWeight: FontWeight.w500, // Optional: adjust font weight
                          ),
                        ),
                      ),
                    ),

                    // ***** END OF ADDED WIDGET *****
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

// lib/feature/authentication/presentation/verify_gst_number.dart

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:stafup/utils/bloc_utils.dart';
// import 'package:stafup/utils/fh_colors.dart';
// import 'package:stafup/utils/fh_global_function.dart'; // << Add import for GlobalFunction
// import 'package:stafup/utils/fh_global_widgets.dart';
// import 'package:stafup/feature/bottom_navigation.dart';
// import 'package:stafup/feature/authentication/bloc/auth_bloc.dart';
// import 'package:stafup/utils/logger.dart'; // For logging

// class VerifyGstNumber extends StatefulWidget {
//   final String tag = '/VerifyGstNumber';

//   const VerifyGstNumber({super.key});

//   @override
//   VerifyGstNumberState createState() => VerifyGstNumberState();
// }

// class VerifyGstNumberState extends State<VerifyGstNumber> {
//   TextEditingController gstFieldController = TextEditingController();
//   TextEditingController emailController =
//       TextEditingController(); // <<< ADD email controller
//   final _formKey = GlobalKey<FormState>();
//   String? _companyExistsErrorMessage; // State variable for the specific error
//   String? _maskedPhoneNumber; // State variable for masked number

//   @override
//   void dispose() {
//     gstFieldController.dispose();
//     emailController.dispose(); // <<< Dispose email controller
//     super.dispose();
//   }

//   // Email Validation Function (using GlobalFunction)
//   bool _validateEmail(String email) {
//     return GlobalFunction().validateEmail(email);
//   }

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     final textTheme = theme.textTheme;
//     final colorScheme = theme.colorScheme;
//     return BlocConsumer<AuthBloc, AuthState>(
//       listener: (context, state) {
//         // Clear specific error message on loading or success
//         if (state is Loading || state is CreateCompanySuccess) {
//           setState(() {
//             _companyExistsErrorMessage = null;
//             _maskedPhoneNumber = null;
//           });
//         }

//         if (state is CreateCompanyError) {
//           AppLoggerHelper.info(
//             'CreateCompanyError state received in UI listener',
//           );
//           // Check if it's the specific "Company Exists" error
//           if (state.companyExistsMessage != null) {
//             AppLoggerHelper.info(
//               'Company exists message found: ${state.companyExistsMessage}',
//             );
//             setState(() {
//               _maskedPhoneNumber = state.maskedPhoneNumber;
//               if (_maskedPhoneNumber != null) {
//                 _companyExistsErrorMessage =
//                     "GSTIN already registered with No. $_maskedPhoneNumber. Contact your firm's team for login.";
//               } else {
//                 _companyExistsErrorMessage =
//                     "GSTIN already registered. Contact your firm's team.";
//               }
//               AppLoggerHelper.info(
//                 'UI Error message set to: $_companyExistsErrorMessage',
//               );
//             });
//           } else {
//             // Handle other generic errors from createCompany
//             final errorMessage =
//                 state.store.errorMessage ??
//                 'Failed to create company. Please try again.';
//             AppLoggerHelper.error('Generic CreateCompanyError: $errorMessage');
//             ScaffoldMessenger.of(
//               context,
//             ).showSnackBar(SnackBar(content: Text(errorMessage)));
//             setState(() {
//               _companyExistsErrorMessage =
//                   null; // Clear specific error if it's a generic one
//               _maskedPhoneNumber = null;
//             });
//           }
//         } else if (state is CreateCompanySuccess) {
//           AppLoggerHelper.info(
//             'CreateCompanySuccess state received, navigating to BottomNavigation',
//           );
//           // Navigate to home on successful creation
//           Navigator.pushAndRemoveUntil(
//             context,
//             MaterialPageRoute(
//               builder:
//                   (context) => BottomNavigation(
//                     companyId: state.store.createCompanyModel?.id,
//                   ),
//             ),
//             (Route<dynamic> route) => false,
//           );
//         }
//       },
//       builder: (context, state) {
//         final isLoading =
//             state is Loading; // Check if the current state is Loading

//         return BackgroundScreen(
//           isBack: false,
//           isAppBarRequired: false,
//           title: '',
//           child: Center(
//             child: SingleChildScrollView(
//               padding: const EdgeInsets.symmetric(horizontal: 24),
//               child: Form(
//                 key: _formKey,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     // ... (Logo, Welcome Text, Subtitle - remain the same) ...
//                     Image.asset(
//                       'assets/images/logo.png',
//                       height: 100,
//                       width: 100,
//                       errorBuilder:
//                           (context, error, stackTrace) =>
//                               const Icon(Icons.image_not_supported, size: 100),
//                     ),
//                     const SizedBox(height: 8),
//                     Text(
//                       'Welcome to Stafup',
//                       style: textTheme.displayMedium?.copyWith(
//                         color: colorScheme.primary,
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                     const SizedBox(height: 24),
//                     Text(
//                       'Verify your Company', // Updated text
//                       style: textTheme.bodyLarge?.copyWith(
//                         color: colorScheme.onSurface.withAlpha(153),
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                     const SizedBox(height: 64),

//                     // GST Number Field
//                     Align(
//                       alignment: Alignment.centerLeft,
//                       child: Text(
//                         'GST Number*',
//                         style: textTheme.bodyMedium?.copyWith(
//                           color: Colors.grey[700],
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 8),
//                     TextFormField(
//                       controller: gstFieldController,
//                       keyboardType: TextInputType.text,
//                       textCapitalization:
//                           TextCapitalization
//                               .characters, // GST is usually uppercase
//                       maxLength: 15, // GSTIN length
//                       enabled: !isLoading,
//                       decoration: const InputDecoration(counterText: ""),
//                       style: textTheme.bodyLarge,
//                       validator: (value) {
//                         if (value == null || value.trim().isEmpty) {
//                           return 'Please enter GST number';
//                         }
//                         if (value.length != 15) {
//                           return 'GST Number must be 15 characters';
//                         }
//                         // Basic regex for GSTIN format (can be more complex)
//                         final RegExp gstRegex = RegExp(
//                           r'^[0-9]{2}[A-Z]{5}[0-9]{4}[A-Z]{1}[1-9A-Z]{1}Z[0-9A-Z]{1}$',
//                         );
//                         if (!gstRegex.hasMatch(value)) {
//                           return 'Invalid GST Number format';
//                         }
//                         return null;
//                       },
//                     ),
//                     const SizedBox(height: 20),

//                     // Email ID Field <<< NEW FIELD
//                     Align(
//                       alignment: Alignment.centerLeft,
//                       child: Text(
//                         'Email ID*',
//                         style: textTheme.bodyMedium?.copyWith(
//                           color: Colors.grey[700],
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 8),
//                     TextFormField(
//                       controller: emailController,
//                       keyboardType: TextInputType.emailAddress,
//                       enabled: !isLoading,
//                       decoration: const InputDecoration(),
//                       style: textTheme.bodyLarge,
//                       validator: (value) {
//                         if (value == null || value.trim().isEmpty) {
//                           return 'Please enter your email address';
//                         }
//                         if (!_validateEmail(value)) {
//                           // Use validation function
//                           return 'Please enter a valid email address';
//                         }
//                         return null;
//                       },
//                     ),
//                     const SizedBox(height: 20),

//                     // Display Specific "Company Exists" Error Message <<< NEW UI ELEMENT
//                     if (_companyExistsErrorMessage != null && !isLoading)
//                       Container(
//                         width: double.infinity,
//                         margin: const EdgeInsets.only(
//                           bottom: 20,
//                         ), // Add margin below
//                         padding: const EdgeInsets.all(16),
//                         decoration: BoxDecoration(
//                           border: Border.all(color: Colors.red[100]!),
//                           color: Colors.red[50],
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                         child: Text(
//                           _companyExistsErrorMessage!,
//                           textAlign: TextAlign.center,
//                           style: textTheme.bodyLarge?.copyWith(
//                             color: Colors.red.shade900,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                       ),

//                     // Proceed Button
//                     SizedBox(
//                       width: double.infinity,
//                       height: 50,
//                       child: ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor:
//                               Colors.blue, // Or theme.colorScheme.primary
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                           disabledBackgroundColor:
//                               Colors.grey, // Disabled color
//                         ),
//                         onPressed:
//                             isLoading // Disable button when loading
//                                 ? null
//                                 : () {
//                                   if (_formKey.currentState!.validate()) {
//                                     // Clear previous specific error before submitting
//                                     setState(() {
//                                       _companyExistsErrorMessage = null;
//                                       _maskedPhoneNumber = null;
//                                     });
//                                     // Dispatch event with both GST and Email
//                                     context.read<AuthBloc>().createCompany(
//                                       gstNumber: gstFieldController.text,
//                                       email: emailController.text,
//                                     );
//                                   }
//                                 },
//                         child:
//                             isLoading
//                                 ? const SizedBox(
//                                   width: 20,
//                                   height: 20,
//                                   child: CircularProgressIndicator(
//                                     color: HrmColors.white,
//                                     strokeWidth: 2,
//                                   ),
//                                 )
//                                 : const Text(
//                                   'Verify & Proceed',
//                                   style: TextStyle(
//                                     fontSize: 16,
//                                     color: HrmColors.white,
//                                   ),
//                                 ),
//                       ),
//                     ),

//                     const SizedBox(height: 56),
//                     // ... (Powered by Onest row - remains the same) ...
//                     Row(
//                       children: [
//                         Expanded(child: Divider(color: Colors.grey.shade300)),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                           child: Row(
//                             children: [
//                               Text(
//                                 'Powered by',
//                                 style: textTheme.bodySmall?.copyWith(
//                                   color: colorScheme.onSurface.withAlpha(153),
//                                 ),
//                               ),
//                               const SizedBox(width: 4),
//                               Image.asset(
//                                 'assets/images/onest-logo.png',
//                                 height: 18,
//                                 width: 40,
//                                 errorBuilder:
//                                     (context, error, stackTrace) => const Text(
//                                       'Onest',
//                                       style: TextStyle(fontSize: 10),
//                                     ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Expanded(child: Divider(color: Colors.grey.shade300)),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
