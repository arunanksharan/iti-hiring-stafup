import 'dart:async'; // <<< ADD this import for Future
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itq_utils/itq_utils.dart';
import 'package:stafup/feature/screen/company_profile/bloc/company_profile_bloc.dart';
import 'package:stafup/feature/screen/company_profile/data/model/company_profile_model.dart';
import 'package:stafup/utils/fh_colors.dart';
import 'package:stafup/feature/authentication/bloc/auth_bloc.dart';

// Import the constant with a clear name to avoid confusion
import 'package:stafup/utils/fh_constant.dart' as constants;
import 'package:get/get.dart';
import 'package:stafup/utils/logger.dart';
import 'package:stafup/utils/theme/app_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CompanyProfilePage extends StatefulWidget {
  const CompanyProfilePage({super.key, this.companyId});

  final String? companyId;

  @override
  State<CompanyProfilePage> createState() => _CompanyProfilePageState();
}

class _CompanyProfilePageState extends State<CompanyProfilePage> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final emailController = TextEditingController(); // <<< ADD email controller
  final otherOrgTypeController =
      TextEditingController(); // <<< ADD controller for "Other" text field
  final phoneController = TextEditingController();

  String? companyId;
  bool isEditing = false;

  String? _selectedOrgType; // <<< ADD state for dropdown selection
  bool _showOtherOrgTypeField = false; // <<< ADD state to control visibility

  // Define Organisation Types List
  final List<String> _orgTypes = [
    "Proprietorship Firm",
    "Partnership Firm",
    "Hindu Undivided Family",
    "Limited Liability Partnership",
    "Private Limited",
    "Public Limited",
    "One Person Company",
    "Self Help Group",
    "Government Department",
    "Society",
    "Trust",
    "Other", // Keep "Other" as the last option
  ];

  // --- ADD onRefresh method ---
  Future<void> _handleRefresh() async {
    if (companyId != null && companyId!.isNotEmpty) {
      AppLoggerHelper.info(
        "Pull-to-refresh triggered. Fetching profile for $companyId",
      ); // Optional log
      context.read<CompanyProfileBloc>().add(FetchCompanyProfile(companyId!));
    } else {
      AppLoggerHelper.warning(
        "Pull-to-refresh: companyId is null or empty.",
      ); // Optional log
      // Optionally show a snackbar if refresh cannot be done
      Get.snackbar(
        'Error',
        'Cannot refresh profile. Company ID is missing.',
        backgroundColor: Colors.red.shade100,
        colorText: Colors.black,
      );
    }
  }
  // --- END of onRefresh method ---

  @override
  void initState() {
    super.initState();

    // Use the company ID passed to the widget or from shared preferences
    this.companyId = widget.companyId;

    if (this.companyId == null || this.companyId!.isEmpty) {
      // Use the constant from fh_constant.dart for consistency
      final savedId = getStringAsync(constants.companyId);
      if (savedId.isNotEmpty) {
        this.companyId = savedId;
      }
    }

    if (this.companyId != null && this.companyId!.isNotEmpty) {
      final String companyIdToUse =
          this.companyId!; // Use a local non-nullable variable
      context.read<CompanyProfileBloc>().add(
        FetchCompanyProfile(companyIdToUse),
      );
    } else {
      // Handle the case where no company ID is available
      AppLoggerHelper.warning(
        'CompanyProfilePage: No company ID available.',
      ); // Optional log
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    addressController.dispose();
    emailController.dispose(); // <<< Dispose controller
    otherOrgTypeController.dispose(); // <<< Dispose controller
    phoneController.dispose(); // <<< Dispose phone controller
    super.dispose();
  }

  // Update controllers and dropdown state from BLoC state
  void _updateFieldsFromState(CompanyProfileModel companyData) {
    AppLoggerHelper.debug(
      "Updating fields from state: ${companyData.toJson()}",
    ); // Optional log
    nameController.text = companyData.name ?? '';
    addressController.text = companyData.address ?? '';
    emailController.text = companyData.email ?? ''; // <<< Update email

    // Update Organisation Type Dropdown
    String? orgTypeFromState = companyData.organisationType;
    if (orgTypeFromState != null) {
      if (orgTypeFromState.startsWith("Other||")) {
        setState(() {
          _selectedOrgType = "Other";
          _showOtherOrgTypeField = true;
          // Extract the part after "Other||"
          otherOrgTypeController.text = orgTypeFromState.substring(
            7,
          ); // Length of "Other||" is 7
        });
      } else if (_orgTypes.contains(orgTypeFromState)) {
        setState(() {
          _selectedOrgType = orgTypeFromState;
          _showOtherOrgTypeField = false;
          otherOrgTypeController.clear(); // Clear if not "Other"
        });
      } else {
        // Handle cases where the value from backend is not in the list and not "Other||..."
        AppLoggerHelper.warning(
          "Org type from state '$orgTypeFromState' not recognized.",
        ); // Optional log
        setState(() {
          _selectedOrgType = null; // Set to null or a default value
          _showOtherOrgTypeField = false;
          otherOrgTypeController.clear();
        });
      }
    } else {
      // Handle case where org type is null from backend
      setState(() {
        _selectedOrgType = null;
        _showOtherOrgTypeField = false;
        otherOrgTypeController.clear();
      });
    }
  }

  // Save changes to company profile

  void _saveChanges() {
    if (_formKey.currentState!.validate()) {
      if (companyId == null) {
        AppLoggerHelper.error(
          "Cannot save: companyId is null.",
        ); // Optional log
        Get.snackbar(
          'Error',
          'Cannot save profile. Company ID is missing.',
          backgroundColor: Colors.red.shade100,
          colorText: Colors.black,
        );
        return;
      }

      String? finalOrgType;
      if (_selectedOrgType == "Other") {
        // Ensure "Other" text field isn't empty if "Other" is selected
        if (otherOrgTypeController.text.trim().isEmpty) {
          Get.snackbar(
            'Error',
            'Please specify the organisation type if you select "Other".',
            backgroundColor: Colors.red.shade100,
            colorText: Colors.black,
          );
          return; // Stop saving if "Other" is selected but text is empty
        }
        finalOrgType = "Other||${otherOrgTypeController.text.trim()}";
      } else {
        finalOrgType = _selectedOrgType;
      }

      // Validate that an org type is selected (unless it's optional)
      if (finalOrgType == null || finalOrgType.isEmpty) {
        Get.snackbar(
          'Error',
          'Please select an Organisation Type.',
          backgroundColor: Colors.red.shade100,
          colorText: Colors.black,
        );
        return; // Stop saving if no type selected (adjust if optional)
      }

      AppLoggerHelper.info(
        "Dispatching UpdateCompanyProfile. OrgType to save: $finalOrgType",
      ); // Optional log
      context.read<CompanyProfileBloc>().add(
        UpdateCompanyProfile(
          companyId: companyId!,
          name: nameController.text.trim(),
          address: addressController.text.trim(),
          email: emailController.text.trim(), // <<< Add email
          organisationType: finalOrgType, // <<< Pass combined/selected value
        ),
      );

      // Toggle edit mode off after dispatching save event
      setState(() {
        isEditing = false;
      });
    } else {
      String specificErrorMessage = "Please correct the highlighted errors.";
      if (nameController.text.trim().isEmpty) {
        specificErrorMessage = 'Please enter Company Name.';
      } else if (addressController.text.trim().isEmpty) {
        specificErrorMessage = 'Please enter Company Address.';
      } else if (_selectedOrgType == null || _selectedOrgType!.isEmpty) {
        specificErrorMessage = 'Please select an Organisation Type.';
      } else if (_selectedOrgType == "Other" &&
          otherOrgTypeController.text.trim().isEmpty) {
        specificErrorMessage = 'Please specify the Organisation Type.';
      }
      Get.snackbar(
        'Validation Error',
        specificErrorMessage,
        backgroundColor: Colors.red.shade100, // Red background
        colorText: Colors.red.shade700, // Darker red text
        snackPosition: SnackPosition.BOTTOM, // Position at bottom
        margin: const EdgeInsets.all(8), // Add some margin
        borderRadius: 8,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    // --- ADD THIS HELPER METHOD ---
    Widget buildLabel(String text) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color:
                Colors
                    .grey
                    .shade700, // Or use Theme.of(context).colorScheme.onSurfaceVariant
          ),
        ),
      );
    }
    // --- END OF HELPER METHOD ---

    // --- Get phone number from AuthBloc state ---
    String currentPhoneNumber = "N/A"; // Default fallback
    final authState = context.read<AuthBloc>().state; // Read AuthBloc state
    // Access the stored exchangeTokenModel safely
    final mobileNumber = authState.store.exchangeTokenModel?.user?.mobile;

    if (mobileNumber != null && mobileNumber.isNotEmpty) {
      currentPhoneNumber = mobileNumber;
      // Update controller if needed (check prevents infinite loop)
      if (phoneController.text != currentPhoneNumber) {
        AppLoggerHelper.debug(
          "Setting phone number from AuthBloc state: $currentPhoneNumber",
        );
        phoneController.text = currentPhoneNumber;
      }
    } else {
      AppLoggerHelper.warning("Phone number not found in AuthBloc state.");
      if (phoneController.text != "N/A") {
        // Update only if different
        phoneController.text = "N/A";
      }
    }
    // --- End get phone number ---

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        title: Text(
          'Company Profile',
          style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        actions: [
          BlocBuilder<CompanyProfileBloc, CompanyProfileState>(
            builder: (context, state) {
              // Only show edit button when data is loaded, not during loading
              // if (state is CompanyProfileLoading && !isEditing) {
              //   return const Padding(
              //     padding: EdgeInsets.symmetric(horizontal: 16.0),
              //     child: Center(
              //       child: SizedBox(
              //         width: 20,
              //         height: 20,
              //         child: CircularProgressIndicator(strokeWidth: 2),
              //       ),
              //     ),
              //   );
              // }

              if (isEditing) {
                // If in editing mode, show only Cancel button
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextButton(
                      onPressed: () {
                        setState(() {
                          isEditing = false;

                          // Reset controllers to original values
                          if (state is CompanyProfileLoaded) {
                            nameController.text =
                                state.companyProfile.name ?? '';
                            addressController.text =
                                state.companyProfile.address ?? '';
                          } else if (state is CompanyProfileUpdated) {
                            nameController.text =
                                state.companyProfile.name ?? '';
                            addressController.text =
                                state.companyProfile.address ?? '';
                          }
                        });
                      },
                      child: Text(
                        'Cancel',
                        style: textTheme.titleMedium?.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                  ],
                );
              }

              // If not editing, show the Edit button
              return TextButton(
                onPressed:
                    state is CompanyProfileLoading
                        ? null
                        : () {
                          setState(() {
                            isEditing = true;
                          });
                        },
                child: Text(
                  'Edit',
                  style: textTheme.titleMedium?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: BlocConsumer<CompanyProfileBloc, CompanyProfileState>(
        listener: (context, state) {
          if (state is CompanyProfileError) {
            Get.snackbar(
              'Failed',
              state.message,
              backgroundColor: Colors.red.shade100,
              colorText: Colors.black,
              duration: Duration(seconds: 3),
              snackPosition: SnackPosition.BOTTOM,
            );
          }

          if (state is CompanyProfileUpdated) {
            Get.snackbar(
              'Success',
              'Company profile updated successfully',
              backgroundColor: AppColors.primary500,
              colorText: Colors.white,
              duration: Duration(seconds: 1),
              snackPosition: SnackPosition.BOTTOM,
              padding: const EdgeInsets.symmetric(
                horizontal: 16, // Keep horizontal padding or adjust as needed
                vertical: 8, // Reduce vertical padding (default is likely more)
              ),
            );
          }

          // Update text controllers when data is loaded or updated
          if (state is CompanyProfileLoaded || state is CompanyProfileUpdated) {
            _updateFieldsFromState(
              (state as CompanyProfileLoaded).companyProfile,
            );
          }
        },
        builder: (context, state) {
          // If loading and there's no company profile data yet, show loading indicator
          // if (state is CompanyProfileLoading) {
          //   return const Center(child: CircularProgressIndicator());
          // }
          if (state is CompanyProfileInitial ||
              (state is CompanyProfileLoading && nameController.text.isEmpty)) {
            // Show loader on initial load or if loading before data arrives
            return const Center(child: CircularProgressIndicator());
          }

          // Get GST number (read-only) from the latest available data
          String? gstNumber;
          String? currentEmail; // Use a local variable for build method
          if (state is CompanyProfileLoaded) {
            gstNumber = state.companyProfile.gstNumber;
            currentEmail = state.companyProfile.email;
          } else if (state is CompanyProfileUpdated) {
            gstNumber = state.companyProfile.gstNumber;
            currentEmail = state.companyProfile.email;
          }
          return RefreshIndicator(
            onRefresh: _handleRefresh, // <<< Assign the refresh handler
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // --- Company Name ---
                    buildLabel('Company Name*'),
                    TextFormField(
                      controller: nameController,
                      enabled: isEditing,
                      decoration: InputDecoration(
                        // border: const OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        // disabledBorder: OutlineInputBorder(
                        //   borderSide: BorderSide(color: Colors.grey[100]!),
                        // ),
                        filled: true,
                        fillColor: isEditing ? Colors.white : Colors.grey[50],
                      ),
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: isEditing ? Colors.black : Colors.grey[700],
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter company name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),

                    // --- GST Number (Read-only) ---
                    buildLabel('GST Number'),
                    TextFormField(
                      // Use initialValue here as it won't change
                      initialValue: gstNumber ?? 'N/A',
                      enabled: false,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[50],
                      ),
                      style: Theme.of(
                        context,
                      ).textTheme.bodyLarge?.copyWith(color: Colors.grey[700]),
                    ),
                    const SizedBox(height: 16),

                    // --- Phone Number (Read-only) --- <<< NEW FIELD
                    buildLabel('Phone Number'),
                    TextFormField(
                      controller: phoneController, // Use the new controller
                      enabled: false, // Always disabled
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        // border: const OutlineInputBorder(
                        //   borderSide: BorderSide(
                        //     color: Colors.transparent,
                        //   ), // No border when disabled
                        // ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        // disabledBorder: const OutlineInputBorder(
                        //   borderSide: BorderSide(color: Colors.transparent),
                        // ),
                        filled: true,
                        fillColor: Colors.grey[50], // Disabled background color
                      ),
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.grey[700],
                      ), // Disabled text color
                    ),
                    const SizedBox(height: 16),
                    // --- End Phone Number ---

                    // --- Email ID (Read-only) --- <<< NEW FIELD
                    buildLabel('Email ID'),
                    TextFormField(
                      controller: emailController,
                      enabled: false, // Always read-only
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        // border: const OutlineInputBorder(),
                        // disabledBorder: OutlineInputBorder(
                        //   borderSide: BorderSide(
                        //     color: Colors.grey[300]!,
                        //   ), // Use a lighter grey for disabled
                        // ),
                        filled: true,
                        fillColor:
                            Colors
                                .grey[50], // Slightly different disabled background
                      ),
                      style: Theme.of(
                        context,
                      ).textTheme.bodyLarge?.copyWith(color: Colors.grey[700]),
                    ),
                    const SizedBox(height: 16),

                    // --- Address ---
                    buildLabel('Address*'),
                    TextFormField(
                      controller: addressController,
                      enabled: isEditing,
                      decoration: InputDecoration(
                        // border: const OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        // disabledBorder: OutlineInputBorder(
                        //   borderSide: BorderSide(color: Colors.grey[100]!),
                        // ),
                        filled: true,
                        fillColor: isEditing ? Colors.white : Colors.grey[50],
                      ),
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: isEditing ? Colors.black : Colors.grey[700],
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter address';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),

                    // --- Organisation Type Dropdown --- <<< NEW FIELD
                    buildLabel('Organisation Type*'),
                    DropdownButtonFormField<String>(
                      value: _selectedOrgType,
                      items:
                          _orgTypes.map((String type) {
                            return DropdownMenuItem<String>(
                              value: type,
                              child: Text(
                                type,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color:
                                      isEditing
                                          ? Colors.black
                                          : Colors
                                              .grey[700], // Style for the selected item display
                                  fontSize:
                                      Theme.of(
                                        context,
                                      ).textTheme.bodyLarge?.fontSize,
                                ),
                              ),
                            );
                          }).toList(),
                      onChanged:
                          isEditing
                              ? (String? newValue) {
                                // Only allow changes when editing
                                setState(() {
                                  _selectedOrgType = newValue;
                                  _showOtherOrgTypeField =
                                      (newValue == "Other");
                                  if (newValue != "Other") {
                                    otherOrgTypeController
                                        .clear(); // Clear "Other" field if something else selected
                                  }
                                });
                              }
                              : null, // Disable dropdown when not editing
                      decoration: InputDecoration(
                        // border: const OutlineInputBorder(),
                        enabledBorder:
                            isEditing
                                ? OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                  ),
                                )
                                : null,
                        // : OutlineInputBorder(
                        //   borderSide: BorderSide(
                        //     color: Colors.grey[300]!,
                        //   ),
                        // ),
                        // disabledBorder: OutlineInputBorder(
                        //   borderSide: BorderSide(color: Colors.grey[300]!),
                        // ),
                        filled: true,
                        fillColor: isEditing ? Colors.white : Colors.grey[50],
                      ),
                      validator:
                          (value) =>
                              (value == null || value.isEmpty)
                                  ? 'Please select an organisation type'
                                  : null,
                      disabledHint:
                          _selectedOrgType != null
                              ? Text(
                                _selectedOrgType!,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.grey[700],
                                  fontSize:
                                      Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.fontSize, // Match TextFormField style
                                ),
                              )
                              : const Text(""),
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.grey[700], // Match enabled/disabled style
                      ),
                    ),
                    const SizedBox(height: 16),

                    // --- "Other" Organisation Type Text Field --- <<< NEW FIELD (Conditional)
                    Visibility(
                      visible:
                          _showOtherOrgTypeField &&
                          isEditing, // Show only if "Other" is selected AND editing
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildLabel('Please Specify Other Type*'),
                          TextFormField(
                            controller: otherOrgTypeController,
                            enabled: isEditing, // Controlled by outer isEditing
                            decoration: InputDecoration(
                              // border: const OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                              // No disabledBorder needed as Visibility handles it
                              filled: true,
                              fillColor: Colors.white,
                            ),
                            style: Theme.of(context).textTheme.bodyLarge,
                            validator: (value) {
                              // Required only if "Other" is selected
                              if (_selectedOrgType == "Other" &&
                                  (value == null || value.trim().isEmpty)) {
                                return 'Please specify the organisation type';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 16),
                        ],
                      ),
                    ),
                    // Show read-only version if needed when not editing
                    Visibility(
                      visible: _showOtherOrgTypeField && !isEditing,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildLabel('Specified Type'),
                          TextFormField(
                            controller: otherOrgTypeController, // Display value
                            enabled: false,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor:
                                  isEditing ? Colors.white : Colors.grey[50],
                            ),
                            style: Theme.of(context).textTheme.bodyLarge
                                ?.copyWith(color: Colors.grey[700]),
                          ),
                          const SizedBox(height: 16),
                        ],
                      ),
                    ),

                    // --- Save Button ---
                    if (isEditing)
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
                          onPressed: _saveChanges,
                          child:
                              state is CompanyProfileLoading
                                  ? const CircularProgressIndicator(
                                    color: HrmColors.white,
                                  )
                                  : const Text(
                                    'Save Changes',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: HrmColors.white,
                                    ),
                                  ),
                        ),
                      ),
                    const SizedBox(height: 64),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
