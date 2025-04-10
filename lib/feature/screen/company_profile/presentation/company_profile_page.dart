import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itq_utils/itq_utils.dart';
import 'package:stafup/feature/screen/company_profile/bloc/company_profile_bloc.dart';
import 'package:stafup/utils/fh_colors.dart';
// Import the constant with a clear name to avoid confusion
import 'package:stafup/utils/fh_constant.dart' as constants;

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

  String? companyId;
  bool isEditing = false;

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
      debugPrint('Warning: No company ID available for company profile');
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    addressController.dispose();
    super.dispose();
  }

  // Update text controllers with data from state
  void _updateControllers(CompanyProfileState state) {
    final companyData =
        state is CompanyProfileLoaded
            ? state.companyProfile
            : state is CompanyProfileUpdated
            ? state.companyProfile
            : null;

    if (companyData != null) {
      // Only update if there's actual data
      nameController.text = companyData.name ?? '';
      addressController.text = companyData.address ?? '';
    }
  }

  // Save changes to company profile
  void _saveChanges() {
    if (_formKey.currentState!.validate() && companyId != null) {
      // Create a local non-nullable variable to fix type mismatch
      final String companyIdToUse = companyId!;

      context.read<CompanyProfileBloc>().add(
        UpdateCompanyProfile(
          companyId: companyIdToUse,
          name: nameController.text,
          address: addressController.text,
        ),
      );

      // Toggle edit mode off after saving
      setState(() {
        isEditing = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Company Profile',
          style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        actions: [
          BlocBuilder<CompanyProfileBloc, CompanyProfileState>(
            builder: (context, state) {
              // Only show edit button when data is loaded, not during loading
              if (state is CompanyProfileLoading && !isEditing) {
                return const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Center(
                    child: SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                  ),
                );
              }

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
                            nameController.text = state.companyProfile.name ?? '';
                            addressController.text = state.companyProfile.address ?? '';
                          } else if (state is CompanyProfileUpdated) {
                            nameController.text = state.companyProfile.name ?? '';
                            addressController.text = state.companyProfile.address ?? '';
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
                onPressed: state is CompanyProfileLoading ? null : () {
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
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }

          if (state is CompanyProfileUpdated) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Company profile updated successfully'),
              ),
            );
          }

          // Update text controllers when data is loaded or updated
          if (state is CompanyProfileLoaded || state is CompanyProfileUpdated) {
            _updateControllers(state);
          }
        },
        builder: (context, state) {
          // If loading and there's no company profile data yet, show loading indicator
          if (state is CompanyProfileLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          // Update controllers with data if available
          if (state is CompanyProfileLoaded || state is CompanyProfileUpdated) {
            _updateControllers(state);
          }

          // Get GST number from state
          String? gstNumber;
          if (state is CompanyProfileLoaded) {
            gstNumber = state.companyProfile.gstNumber;
          } else if (state is CompanyProfileUpdated) {
            gstNumber = state.companyProfile.gstNumber;
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Company icon and intro
                  // Center(
                  //   child: Column(
                  //     children: [
                  //       const Icon(
                  //         Icons.business,
                  //         size: 64,
                  //         color: Colors.blue,
                  //       ),
                  //       const SizedBox(height: 8),
                  //       Text(
                  //         'Company Information',
                  //         style: textTheme.titleLarge,
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // const SizedBox(height: 8),

                  // Company Name
                  Text(
                    'Company Name',
                    style: textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: nameController,
                    enabled: isEditing,
                    decoration: InputDecoration(
                      // hintText: 'Enter company name',
                      // border: OutlineInputBorder(
                      //   borderRadius: BorderRadius.circular(8),
                      // ),
                      filled: !isEditing,
                      fillColor: isEditing ? null : Colors.grey.shade50,
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter company name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  // GST Number (read-only)
                  Text(
                    'GST Number',
                    style: textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    initialValue: gstNumber ?? '',
                    enabled: false,
                    decoration: InputDecoration(
                      // hintText: 'GST Number',
                      // border: OutlineInputBorder(
                      //   borderRadius: BorderRadius.circular(8),
                      // ),
                      filled: true,
                      fillColor: Colors.grey.shade50,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Address
                  Text(
                    'Address',
                    style: textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: addressController,
                    enabled: isEditing,
                    maxLines: 3,
                    decoration: InputDecoration(
                      // hintText: 'Enter company address',
                      // border: OutlineInputBorder(
                      //   borderRadius: BorderRadius.circular(8),
                      // ),
                      filled: !isEditing,
                      fillColor: isEditing ? null : Colors.grey.shade50,
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter company address';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 32),

                  // Save button (visible only in edit mode)
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
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
