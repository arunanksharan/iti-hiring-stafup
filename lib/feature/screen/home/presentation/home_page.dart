// ignore_for_file: unnecessary_string_interpolations

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:stafup/feature/authentication/presentation/enter_number.dart';
import 'package:stafup/feature/screen/home/bloc/home_bloc.dart';
import 'package:itq_utils/itq_utils.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import 'package:stafup/utils/fh_color_provider.dart';
import 'package:stafup/utils/fh_constant.dart';
import '../../profile/presentation/job_update_page.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key, this.companyId});

  final String? companyId;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  final String tag = '/HomePage';

  RefreshController refreshController = RefreshController();
  final searchController = TextEditingController();
  bool isLogout = false;
  String? _cachedCompanyId;

  @override
  bool get wantKeepAlive => true; // Keep state when switching tabs

  @override
  void initState() {
    super.initState();
    _loadAndFetchJobs();
  }

  void _loadAndFetchJobs() {
    // Store the company ID in a cached variable to ensure persistence
    _cachedCompanyId = widget.companyId ?? getStringAsync(companyId);

    // Cache company ID in shared prefs if we have it but it's not saved
    if (_cachedCompanyId != null &&
        _cachedCompanyId!.isNotEmpty &&
        getStringAsync(companyId).isEmpty) {
      setValue(companyId, _cachedCompanyId!);
    }

    if (_cachedCompanyId != null && _cachedCompanyId!.isNotEmpty) {
      context.read<HomeBloc>().add(HomeEvent.fetchJobs(_cachedCompanyId!));
    } else {
      // Handle the case where no company ID is available
      debugPrint('Warning: No company ID available for job fetch');
    }
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
    super.build(
      context,
    ); // Must call super.build for AutomaticKeepAliveClientMixin

    Provider.of<ColorNotifier>(context);

    // Always check for company ID when building the widget
    // This ensures we have the ID even when navigating back to this tab
    final String? companyIdToUse =
        _cachedCompanyId ?? getStringAsync(companyId);

    // Only fetch if company ID is available and we need to rehydrate data
    if (companyIdToUse != null && companyIdToUse.isNotEmpty) {
      // Get current bloc state to determine if we need to fetch
      final currentState = context.read<HomeBloc>().state;
      if (currentState is Error) {
        // If we're in an error state, try to fetch again with the company ID
        WidgetsBinding.instance.addPostFrameCallback((_) {
          context.read<HomeBloc>().add(HomeEvent.fetchJobs(companyIdToUse));
        });
      }
    }

    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is Loaded) {
          if (refreshController.isRefresh) {
            refreshController.refreshCompleted();
          }
          if (refreshController.isLoading) {
            if (state.store.hasReachedMax) {
              refreshController.loadNoData(); // Use loadNoData if max reached
            } else {
              refreshController.loadComplete(); // Otherwise, load complete
            }
          }
          // Reset refresh status if load finishes, regardless of pull direction
          if (state.store.hasReachedMax &&
              state.store.items.length >= state.store.totalItems) {
            refreshController.loadNoData();
          }
        } else if (state is Error) {
          if (refreshController.isRefresh) {
            refreshController.refreshFailed();
          }
          if (refreshController.isLoading) {
            refreshController.loadFailed();
          }
        } else if (state is Loading && refreshController.isRefresh) {
          // Keep indicator showing during refresh loading state
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
              padding: const EdgeInsets.only(left: 16.0, top: 16.0, bottom: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Hi!", style: textTheme.headlineMedium),
                  Text(
                    'Find your perfect candidate',
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
            // Add bottom border to create visual separation
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(1),
              child: Container(color: Colors.grey.shade200, height: 1.0),
            ),
          ),
          body: Column(
            children: [
              // Profile reminder widget removed/disabled
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 2,
                ),
                // child: TextFormField(
                //   onTapOutside: (_) => FocusScope.of(context).unfocus(),
                //   controller: searchController,
                //   onChanged: (value) {
                //     if (value.length > 2) {
                //       context.read<HomeBloc>().add(HomeEvent.search(value));
                //     } else if (value.isEmpty) {
                //       context.read<HomeBloc>().add(
                //         HomeEvent.resetAndFetch(getStringAsync(companyId)),
                //       );
                //     }
                //   },
                //   decoration: const InputDecoration(
                //     border: OutlineInputBorder(
                //       borderRadius: BorderRadius.all(Radius.circular(12)),
                //       borderSide: BorderSide.none,
                //     ),
                //     enabledBorder: OutlineInputBorder(
                //       borderRadius: BorderRadius.all(Radius.circular(12)),
                //       borderSide: BorderSide.none,
                //     ),
                //     focusedBorder: OutlineInputBorder(
                //       borderRadius: BorderRadius.all(Radius.circular(12)),
                //       borderSide: BorderSide.none,
                //     ),
                //     hintText: 'Search for jobs, skills, companies...',
                //     prefixIcon: Icon(Icons.search, color: Colors.grey),
                //   ),
                // ),
              ),
              _buildSectionHeader(context, 'Your Job Postings', () {
                // Show "Coming Soon" directly on tap
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Coming Soon!"),
                    duration: Duration(milliseconds: 500),
                  ),
                );
              }),
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
      enablePullUp: !state.store.hasReachedMax,
      onRefresh: () {
        context.read<HomeBloc>().add(
          HomeEvent.resetAndFetch(getStringAsync(companyId)),
        );
      },
      onLoading: () {
        // --- Updated onLoading Logic ---
        // Check the Bloc state directly
        if (state.store.hasReachedMax || state.store.loading) {
          // If max is already reached according to the Bloc state,
          // or if already loading, do nothing or signal no data.
          // loadNoData might be called by the listener now,
          // but ensuring it here prevents unnecessary event dispatch.
          refreshController.loadNoData();
        } else {
          // Only dispatch NextPage if not at max and not already loading
          context.read<HomeBloc>().add(const HomeEvent.nextPage());
        }
        // --- End of Updated Logic ---
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
                    style: textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),

                  Text(
                    state.store.items[index].jobPosting?.personName ?? '',
                    style: const TextStyle(fontSize: 13, color: Colors.black87),
                  ),

                  Text(
                    state.store.items[index].createdAt
                            ?.toIso8601String()
                            .substring(0, 10) ??
                        '',
                    style: const TextStyle(fontSize: 13, color: Colors.black54),
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
    // final totalPages = (store.totalItems / store.pageSize).ceil();
    // final currentPage = store.currentPage;
    // final isFirstPage = currentPage == 0;
    // final isLastPage = currentPage >= totalPages - 1;
    final totalPages =
        store.pageSize > 0 ? (store.totalItems / store.pageSize).ceil() : 1;
    final currentPage =
        store
            .currentPage; // Assuming currentPage is 1-based in store after fetch
    final isFirstPage = currentPage <= 1; // Check against 1 if 1-based
    final bool effectivelyLastPage =
        store.hasReachedMax ||
        (currentPage >= totalPages && store.totalItems > 0);

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
                    effectivelyLastPage ||
                            state.store.loading ||
                            totalPages == 0
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

  Widget _buildSectionHeader(
    BuildContext context,
    String title,
    VoidCallback onTap,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          // InkWell(
          //   onTap: onTap,
          //   child: Text(
          //     'See All',
          //     style: TextStyle(
          //       color: Theme.of(context).primaryColor,
          //       fontWeight: FontWeight.w500,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
