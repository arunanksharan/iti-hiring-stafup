import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:stafup/feature/authentication/presentation/enter_number.dart';
import 'package:stafup/feature/screen/home/bloc/home_bloc.dart';
import 'package:stafup/utils/fh_colors.dart';
import 'package:itq_utils/itq_utils.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import '../../../../utils/fh_color_provider.dart';
import '../../../../utils/fh_constant.dart';
import '../../profile/presentation/job_update_page.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key, this.companyId});

  final String? companyId;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String tag = '/HomePage';

  RefreshController refreshController = RefreshController();
  final searchController = TextEditingController();
  bool isLogout = false;

  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(
      HomeEvent.fetchJobs(getStringAsync(companyId)),
    );
  }

  void logout() async {
    isLogout = true;
    await FirebaseAuth.instance.signOut();
    setValue(isLoggedIn, false);
    Navigator.pushAndRemoveUntil(
      Get.context!,
      MaterialPageRoute(builder: (context) => EnterNumber()),
      (route) => false,
    );
    isLogout = false;
  }

  String formatDate(String dateTimeString) {
    DateTime dateTime = DateTime.parse(dateTimeString);
    return DateFormat('yyyy-MM-dd').format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<ColorNotifier>(context);
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is Loaded) {
          if (refreshController.isRefresh) {
            refreshController.refreshCompleted();
          }
          if (refreshController.isLoading) {
            refreshController.loadComplete();
          }
        } else if (state is Error) {
          if (refreshController.isRefresh) {
            refreshController.refreshFailed();
          }
          if (refreshController.isLoading) {
            refreshController.loadFailed();
          }
        }
      },
      builder: (context, state) {
        final theme = Theme.of(context);
        final textTheme = theme.textTheme;
        final colorScheme = theme.colorScheme;
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: theme.scaffoldBackgroundColor,
            foregroundColor: colorScheme.onSurface,
            titleSpacing: 0,
            automaticallyImplyLeading: false,
            centerTitle: false,
            title: Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 16.0, bottom: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Hi!", style: textTheme.headlineMedium),
                  Text(
                    'Find your dream job today',
                    style: textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onSurface.withAlpha(153),
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.logout,
                  color: colorScheme.onSurface.withAlpha(153),
                ),
                tooltip: 'Logout',
                onPressed: () {
                  showDialog(
                    context: context,
                    builder:
                        (context) => AlertDialog(
                          title: const Text('Confirm Logout'),
                          content: const Text(
                            'Are you sure you want to log out?',
                          ),
                          actions:
                              isLogout
                                  ? [Center(child: CircularProgressIndicator())]
                                  : [
                                    TextButton(
                                      onPressed:
                                          () => Navigator.of(context).pop(),
                                      child: Text(
                                        'Cancel',
                                        style: textTheme.bodyMedium,
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        logout();
                                      },
                                      child: Text(
                                        'Logout',
                                        style: textTheme.bodyMedium,
                                      ),
                                    ),
                                  ],
                        ),
                  );
                },
              ),
              const SizedBox(width: 16),
            ],
          ),
          body: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: HrmColors.black.withValues(alpha: 0.1),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.error_outline,
                      color: Colors.orange,
                      size: 30,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Create/Update Your Profile',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 6),
                          Text(
                            'Complete your profile to get better job recommendations.',
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 2,
                ),
                child: TextFormField(
                  onTapOutside: (_) => FocusScope.of(context).unfocus(),
                  controller: searchController,
                  onChanged: (value) {
                    if (value.length > 2) {
                      context.read<HomeBloc>().add(HomeEvent.search(value));
                    } else if (value.isEmpty) {
                      context.read<HomeBloc>().add(
                        HomeEvent.resetAndFetch(getStringAsync(companyId)),
                      );
                    }
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      borderSide: BorderSide.none,
                    ),
                    hintText: 'Search for jobs, skills, companies...',
                    prefixIcon: Icon(Icons.search, color: Colors.grey),
                  ),
                ),
              ),
              Expanded(child: _buildListContent(context, state)),
              _buildPaginationControls(context, state),
            ],
          ),
        );
      },
    );
  }

  Widget _buildListContent(BuildContext context, HomeState state) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final items = state.store.items;

    if (state is Loading && items.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state is Error) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Failed to load data'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed:
                  () => context.read<HomeBloc>().add(
                    HomeEvent.fetchJobs(getStringAsync(companyId)),
                  ),
              child: const Text('Retry'),
            ),
          ],
        ),
      );
    }

    if (items.isEmpty) {
      return const Center(child: Text('No items found'));
    }
    return SmartRefresher(
      controller: refreshController,
      enablePullDown: true,
      enablePullUp: true,
      onRefresh: () {
        context.read<HomeBloc>().add(
          HomeEvent.resetAndFetch(getStringAsync(companyId)),
        );
      },
      onLoading: () {
        final totalPages =
            (state.store.totalItems / state.store.pageSize).ceil();
        final isLastPage = state.store.currentPage >= totalPages - 1;

        if (isLastPage) {
          refreshController.loadNoData();
        } else {
          context.read<HomeBloc>().add(const HomeEvent.nextPage());
        }
      },
      child: ListView.builder(
        physics: AlwaysScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: items.length,
        itemBuilder: (context, index) {
          print(state.store.items[index].createdAt);
          return InkWell(
            onTap: () async {
              Map<String, dynamic> jobData = {};
              final jobPosting = state.store.items[index].jobPosting;

              if (jobPosting != null) {
                jobData = {
                  'salary': jobPosting.salary,
                  'job_role': jobPosting.jobRole,
                  'person_name': jobPosting.personName,
                  'work_timings': jobPosting.workTimings,
                  'business_type': jobPosting.businessType,
                  'hiring_urgency': jobPosting.hiringUrgency,
                  'number_of_hires': jobPosting.numberOfHires,
                  'skills_required': jobPosting.skillsRequired,
                  'business_location': jobPosting.businessLocation,
                  'id': state.store.items[index].id,
                };
              }
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => JobUpdatePage(jobData: jobData),
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade200,
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 4,
                children: [
                  Text(
                    '${state.store.items[index].jobPosting?.jobRole ?? ''}',
                    style: textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),

                  RichText(
                    text: TextSpan(
                      style: textTheme.bodySmall?.copyWith(
                        color: Colors.black87,
                      ),
                      children: [
                        const TextSpan(
                          text: 'Name: ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        TextSpan(
                          style: TextStyle(fontSize: 14),
                          text:
                              '${state.store.items[index].jobPosting?.personName ?? ''}',
                        ),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      style: textTheme.bodySmall?.copyWith(
                        color: Colors.black87,
                      ),
                      children: [
                        const TextSpan(
                          text: 'Created At: ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        TextSpan(
                          style: TextStyle(fontSize: 14),
                          text:
                              '${state.store.items[index].createdAt?.toIso8601String().substring(0, 10) ?? ''}',
                        ),
                      ],
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

  Widget _buildPaginationControls(BuildContext context, HomeState state) {
    final store = state.store;
    final totalPages = (store.totalItems / store.pageSize).ceil();
    final currentPage = store.currentPage;
    final isFirstPage = currentPage == 0;
    final isLastPage = currentPage >= totalPages - 1;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        border: Border(top: BorderSide(color: Colors.grey.shade300)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Page ${currentPage + 1} of ${totalPages > 0 ? totalPages : 1}',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),

          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed:
                    isFirstPage || state.store.loading
                        ? null
                        : () => context.read<HomeBloc>().add(
                          const HomeEvent.previousPage(),
                        ),
                tooltip: 'Previous page',
              ),
              if (state.store.loading)
                const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
              IconButton(
                icon: const Icon(Icons.arrow_forward),
                onPressed:
                    isLastPage || state.store.loading || totalPages == 0
                        ? null
                        : () => context.read<HomeBloc>().add(
                          const HomeEvent.nextPage(),
                        ),
                tooltip: 'Next page',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
