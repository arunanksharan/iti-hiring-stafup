import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:stafup/feature/screen/home/bloc/home_bloc.dart' as homeBloc;
import 'package:stafup/utils/bloc_utils.dart';
import 'package:itq_utils/itq_utils.dart';
import 'package:stafup/utils/theme/app_colors.dart';

import '../../../../utils/fh_constant.dart';
import '../data/model/job_update_model.dart';
import '../bloc/profile_bloc.dart';

class JobUpdatePage extends StatefulWidget {
  final Map<String, dynamic>? jobData;

  const JobUpdatePage({super.key, this.jobData});

  @override
  State<JobUpdatePage> createState() => _JobUpdatePageState();
}

class _JobUpdatePageState extends State<JobUpdatePage> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, TextEditingController> _controllers = {};
  bool _isEditing = false;
  bool _isLoading = false;
  bool _isSaving = false;
  String? _errorMessage;

  final List<Map<String, dynamic>> _formFields = [
    {'key': 'job_role', 'label': 'Job Role', 'required': true},
    {'key': 'person_name', 'label': 'Person Name', 'required': true},
    {'key': 'business_type', 'label': 'Business Type', 'required': true},
    {'key': 'business_location', 'label': 'Location', 'required': true},
    {'key': 'work_timings', 'label': 'Work Timings', 'required': true},
    {
      'key': 'salary',
      'label': 'Monthly Salary (INR)',
      'keyboard': TextInputType.number,
      'required': true,
    },
    {'key': 'hiring_urgency', 'label': 'Hiring Urgency', 'required': true},
    {
      'key': 'number_of_hires',
      'label': 'Number of Positions',
      'keyboard': TextInputType.number,
      'required': true,
    },
    {
      'key': 'skills_required',
      'label': 'Skills Required',
      'hint': 'e.g., Python, SQL, Git',
      'maxLines': 3,
      'required': true,
    },
  ];

  @override
  void initState() {
    super.initState();
    for (var field in _formFields) {
      if (field['type'] != 'dropdown') {
        _controllers[field['key']] = TextEditingController();
      }
    }

    _initializeControllers();
  }

  void _initializeControllers() {
    for (var field in _formFields) {
      final key = field['key'] as String;
      final controller = _controllers[key];
      if (controller != null) {
        controller.text = widget.jobData?[key]?.toString() ?? '';
      }
    }
  }

  @override
  void dispose() {
    _controllers.forEach((_, controller) => controller.dispose());
    super.dispose();
  }

  void _toggleEditMode() {
    setState(() {
      _isEditing = !_isEditing;
    });
  }

  void _updateField(String key, dynamic value) {
    setState(() {
      widget.jobData?[key] = value;
    });
  }

  void _saveForm() {
    if (_formKey.currentState!.validate()) {
      FocusScope.of(context).unfocus();
      setState(() {
        _isSaving = true;
      });

      final JobPosting jobPostingData = JobPosting(
        jobRole: _controllers['job_role']?.text ?? '',
        personName: _controllers['person_name']?.text ?? '',
        businessType: _controllers['business_type']?.text ?? '',
        businessLocation: _controllers['business_location']?.text ?? '',
        workTimings: _controllers['work_timings']?.text ?? '',
        salary: int.tryParse(_controllers['salary']?.text ?? '0') ?? 0,
        hiringUrgency: _controllers['hiring_urgency']?.text ?? '',
        numberOfHires:
            int.tryParse(_controllers['number_of_hires']?.text ?? '0') ?? 0,
        skillsRequired: _controllers['skills_required']?.text ?? '',
      );

      final String jobId = widget.jobData?['id']?.toString() ?? '';

      getBloc<ProfileBloc>(
        context,
      ).updateJob(jobId: jobId, jobPostingData: jobPostingData);
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Please fix errors.')));
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;
    if (_isLoading) {
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: theme.scaffoldBackgroundColor,
          foregroundColor: theme.colorScheme.onSurface,
          titleSpacing: 0,
          centerTitle: false,
          title: Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text('View Job Posting', style: textTheme.headlineMedium),
          ),
        ),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    return BlocConsumer<ProfileBloc, ProfileState>(
      listener: (_, state) {
        if (state is UpdateJobSuccess) {
          setState(() {
            _isSaving = false;
            _isEditing = false;
          });

          Get.snackbar(
            'Success',
            'Job details updated successfully',
            backgroundColor: AppColors.primary500,
            colorText: Colors.white,
            duration: Duration(seconds: 2),
            snackPosition: SnackPosition.BOTTOM,
            padding: const EdgeInsets.symmetric(
              horizontal: 16, // Keep horizontal padding or adjust as needed
              vertical: 0, // Reduce vertical padding (default is likely more)
            ),
          );
          context.read<homeBloc.HomeBloc>().add(
            homeBloc.FetchJobs(getStringAsync(companyId)),
          );

          if (state is Error) {
            setState(() {
              _isSaving = false;
            });
            Get.snackbar(
              'Failed',
              state.store.errorMessage,
              backgroundColor: Colors.red.shade100,
              colorText: Colors.black,
              duration: Duration(seconds: 2),
              snackPosition: SnackPosition.BOTTOM,
            );
          }
        }
      },

      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: theme.scaffoldBackgroundColor,
            foregroundColor: theme.colorScheme.onSurface,
            titleSpacing: 0,
            centerTitle: false,
            title: Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                _isEditing ? 'Edit Job Posting' : 'View Job Posting',
                style: textTheme.headlineMedium,
              ),
            ),
            actions: [
              TextButton(
                onPressed: _isSaving ? null : _toggleEditMode,
                child: Text(
                  _isEditing ? 'Cancel' : 'Edit',
                  style: textTheme.titleMedium?.copyWith(
                    color: colorScheme.primary,
                  ),
                ),
              ),
              const SizedBox(width: 8),
            ],
          ),
          body: RefreshIndicator(
            onRefresh: () async {
              setState(() {
                _isLoading = true;
              });
              await Future.delayed(const Duration(seconds: 1));
              setState(() {
                _isLoading = false;
              });
            },
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Stack(
                children: [
                  // Main form content
                  SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    padding: const EdgeInsets.only(
                      left: 16.0,
                      right: 16.0,
                      bottom: 220,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              ..._formFields
                                  .map((field) => _buildFormField(field))
                                  .expand(
                                    (widget) => [
                                      widget,
                                      const SizedBox(height: 24),
                                    ],
                                  ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 16),
                        if (_isEditing)
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 0.0,
                            ),
                            child: ElevatedButton(
                              onPressed: _isSaving ? null : _saveForm,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Theme.of(context).primaryColor,
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 32,
                                  vertical: 12,
                                ),
                              ),
                              child:
                                  _isSaving
                                      ? const SizedBox(
                                        width: 20,
                                        height: 20,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2,
                                          color: Colors.white,
                                        ),
                                      )
                                      : const Text('Save Changes'),
                            ),
                          ),

                        if (_errorMessage != null && !_isLoading && !_isSaving)
                          Padding(
                            padding: const EdgeInsets.only(top: 16.0),
                            child: Center(
                              child: Text(
                                _errorMessage!,
                                style: TextStyle(
                                  color: theme.colorScheme.error,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),

                        const SizedBox(height: 24), // Bottom padding
                      ],
                    ),
                  ),

                  if (_isSaving)
                    Container(
                      color: Colors.black.withOpacity(0.1),
                      child: const Center(child: CircularProgressIndicator()),
                    ),
                ],
              ),
            ),
          ),
          floatingActionButton:
              _isEditing
                  ? null
                  : Padding(
                    padding: const EdgeInsets.only(bottom: 64),
                    child: FloatingActionButton(
                      onPressed: _toggleEditMode,
                      child: const Icon(Icons.edit),
                    ),
                  ),
        );
      },
    );
  }

  Widget _buildFormField(Map<String, dynamic> fieldConfig) {
    final String key = fieldConfig['key'];
    final String label = fieldConfig['label'];
    final bool isRequired = fieldConfig['required'] ?? false;
    final String type = fieldConfig['type'] ?? 'text';
    final int maxLines = fieldConfig['maxLines'] ?? 1;
    final TextInputType keyboard =
        fieldConfig['keyboard'] ?? TextInputType.text;
    final String? hint = fieldConfig['hint'];

    final controller = _controllers[key];
    final currentValue = widget.jobData?[key];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(color: Colors.grey[700]),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          enabled: _isEditing,
          keyboardType: keyboard,
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hint,
            border: const OutlineInputBorder(),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).primaryColor),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[100]!),
            ),
            filled: true,
            fillColor: _isEditing ? Colors.white : Colors.grey[50],
          ),
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: _isEditing ? Colors.black : Colors.grey[700],
          ),
          validator:
              (value) =>
                  (isRequired && (value == null || value.trim().isEmpty))
                      ? 'Please enter $label'
                      : null,
          onChanged: (value) {
            if (keyboard == TextInputType.number && value.isNotEmpty) {
              _updateField(key, int.tryParse(value) ?? value);
            } else {
              _updateField(key, value);
            }
          },
        ),
      ],
    );
  }
}
