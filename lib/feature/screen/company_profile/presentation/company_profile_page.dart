import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stafup/feature/screen/company_profile/bloc/company_profile_bloc.dart';
import 'package:stafup/utils/fh_colors.dart';
import 'package:itq_utils/itq_utils.dart';

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
    companyId = widget.companyId ?? getStringAsync('companyId');
    
    if (companyId != null && companyId!.isNotEmpty) {
      context.read<CompanyProfileBloc>().add(
        FetchCompanyProfile(companyId!),
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

  // Update the text controllers with company data
  void _updateControllers(CompanyProfileState state) {
    if (state is CompanyProfileLoaded && !isEditing) {
      nameController.text = state.companyProfile.name ?? '';
      addressController.text = state.companyProfile.address ?? '';
    } else if (state is CompanyProfileUpdated && !isEditing) {
      nameController.text = state.companyProfile.name ?? '';
      addressController.text = state.companyProfile.address ?? '';
    }
  }

  // Toggle edit mode
  void _toggleEditMode() {
    setState(() {
      isEditing = !isEditing;
    });
  }

  // Save changes
  void _saveChanges() {
    if (_formKey.currentState!.validate()) {
      if (companyId != null) {
        context.read<CompanyProfileBloc>().add(
          UpdateCompanyProfile(
            companyId: companyId!,
            name: nameController.text,
            address: addressController.text,
          ),
        );
      }
      _toggleEditMode();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Company Profile',
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [
          BlocBuilder<CompanyProfileBloc, CompanyProfileState>(
            builder: (context, state) {
              if (state is CompanyProfileLoading) {
                return const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.blue,
                    ),
                  ),
                );
              }
              
              return IconButton(
                icon: Icon(
                  isEditing ? Icons.check : Icons.edit,
                  color: Colors.blue,
                ),
                onPressed: isEditing ? _saveChanges : _toggleEditMode,
              );
            },
          ),
        ],
      ),
      body: BlocConsumer<CompanyProfileBloc, CompanyProfileState>(
        listener: (context, state) {
          if (state is CompanyProfileError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
          
          if (state is CompanyProfileUpdated) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Company profile updated successfully')),
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
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          
          // Update controllers with data if available
          if (state is CompanyProfileLoaded || state is CompanyProfileUpdated) {
            _updateControllers(state);
          }

          // Get GST number for display
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
                  // Company logo or icon
                  Center(
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Icon(
                        Icons.business,
                        size: 50,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  
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
                      hintText: 'Enter company name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
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
                      hintText: 'GST Number',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
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
                      hintText: 'Enter company address',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
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
                        child: state is CompanyProfileLoading
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
