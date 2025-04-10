import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stafup/utils/bloc_utils.dart';
import 'package:stafup/utils/fh_colors.dart';
import 'package:stafup/utils/fh_global_widgets.dart';
import 'package:stafup/feature/bottom_navigation.dart';
import 'package:stafup/feature/authentication/bloc/auth_bloc.dart';

class VerifyGstNumber extends StatefulWidget {
  final String tag = '/VerifyGstNumber';

  const VerifyGstNumber({super.key});

  @override
  VerifyGstNumberState createState() => VerifyGstNumberState();
}

class VerifyGstNumberState extends State<VerifyGstNumber> {
  TextEditingController gstFieldController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is CreateCompanyError) {
          final errorMessage = state.store.errorMessage ?? 'Unknown error';
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(errorMessage)));
        }
        if (state is CreateCompanySuccess) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => BottomNavigation()),
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
                      'Welcome to Seeker',
                      style: textTheme.displayMedium?.copyWith(
                        color: colorScheme.primary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Find your perfect job opportunity',
                      style: textTheme.bodyLarge?.copyWith(
                        color: colorScheme.onSurface.withAlpha(153),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 64),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'GST Number',
                        style: textTheme.bodyMedium?.copyWith(
                          color: Colors.grey[700],
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: gstFieldController,
                      keyboardType: TextInputType.text,
                      maxLength: 20,
                      enabled: !isLoading,
                      decoration: const InputDecoration(counterText: ""),
                      style: textTheme.bodyLarge,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter gst number';
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
                          //BottomNavigation().launch(context);
                          if (_formKey.currentState!.validate()) {
                            getBloc<AuthBloc>(
                              context,
                            ).createCompany(gstNumber: gstFieldController.text);
                          }
                        },
                        child:
                            state.store.loading
                                ? const CircularProgressIndicator(
                                  color: HrmColors.white,
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
