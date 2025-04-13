import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:itq_utils/itq_utils.dart';
import 'package:stafup/utils/fh_constant.dart' as constants;
import 'package:stafup/utils/logger.dart';

import '../data/model/job_model.dart';
import '../data/repository/home_repository.dart';

part 'home_bloc.freezed.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository _homeRepository;

  HomeBloc(this._homeRepository) : super(const Initial(HomeStore())) {
    on<FetchJobs>(_onFetchJobs);
    on<ResetAndFetch>(_onResetAndFetch);
    on<NextPage>(_onNextPage);
    on<PreviousPage>(_onPreviousPage);
    // on<Search>(_onSearch);
  }

  Future<void> _onFetchJobs(FetchJobs event, Emitter<HomeState> emit) async {
    final currentStore = state.store;
    try {
      // Validate company ID
      final String? companyId =
          event.companyId ?? getStringAsync(constants.companyId);
      if (companyId == null || companyId.isEmpty) {
        throw Exception(
          "Company ID is missing. Please ensure you are logged in with a company account.",
        );
      }

      // Emit loading state
      emit(
        Loading(currentStore.copyWith(loading: true, hasReachedMax: false)),
      ); // <<< RESET FLAG
      // Fetch data with pagination parameters
      final result = await _homeRepository.fetchJobs(
        companyId: companyId,
        page: currentStore.currentPage,
        pageSize: currentStore.pageSize,
      );
      // Calculate derived values BEFORE emit
      final newItems = result.items ?? [];
      final int totalFromRepo = result.total ?? 0;
      final bool reachedMax = newItems.isEmpty && totalFromRepo == 0;

      emit(
        Loaded(
          currentStore.copyWith(
            items: newItems,
            totalItems: totalFromRepo,
            currentPage: 1, // Set current page to 1
            loading: false,
            hasReachedMax: reachedMax, // <<< SET FLAG
          ),
        ),
      );
      // final result = await _homeRepository.fetchJobs(
      //   companyId: companyId,
      //   page: currentStore.currentPage,
      //   pageSize: currentStore.pageSize,
      // );

      // // Emit loaded state with new data
      // emit(
      //   Loaded(
      //     currentStore.copyWith(
      //       items: result.items!,
      //       totalItems: result.total!,
      //       loading: false,
      //     ),
      //   ),
      // );
    } catch (e) {
      AppLoggerHelper.error("Error in _onFetchJobs: $e"); // Optional log
      emit(
        Error(
          currentStore.copyWith(loading: false, hasReachedMax: false),
          e.toString(),
        ),
      ); // Ensure flags are reset on error too
    }
  }

  Future<void> _onResetAndFetch(
    ResetAndFetch event,
    Emitter<HomeState> emit,
  ) async {
    try {
      // Validate company ID
      final String? companyId =
          event.companyId ?? getStringAsync(constants.companyId);
      if (companyId == null || companyId.isEmpty) {
        throw Exception(
          "Company ID is missing. Please ensure you are logged in with a company account.",
        );
      }

      // Reset pagination and store
      final resetStore = state.store.copyWith(
        currentPage: 1,
        items: [],
        loading: true,
        hasReachedMax: false, // <<< RESET THE FLAG
        totalItems: 0, // Reset total items as well
      );

      emit(Loading(resetStore));

      // Fetch first page
      final result = await _homeRepository.fetchJobs(
        companyId: companyId,
        page: 1,
        pageSize: resetStore.pageSize,
      );

      final newItems = result.items ?? [];
      final int totalFromRepo = result.total ?? 0;
      final bool reachedMax =
          newItems.isEmpty &&
          (totalFromRepo == 0); // Also check total if first fetch is empty

      // Emit loaded state with new data
      emit(
        Loaded(
          resetStore.copyWith(
            items: newItems,
            totalItems: totalFromRepo,
            loading: false,
            hasReachedMax: reachedMax,
          ),
        ),
      );
    } catch (e) {
      AppLoggerHelper.error("Error in _onResetAndFetch: $e"); // Optional log
      emit(
        Error(
          state.store.copyWith(loading: false, hasReachedMax: false),
          e.toString(),
        ),
      ); // Ensure flags are reset on error too
    }
  }

  Future<void> _onNextPage(NextPage event, Emitter<HomeState> emit) async {
    final currentStore = state.store;
    // Prevent fetching if already at max or already loading
    if (currentStore.hasReachedMax || currentStore.loading) return;

    try {
      // Get company ID from event or shared preferences
      String companyId = event.companyId ?? getStringAsync(constants.companyId);
      if (companyId.isEmpty) {
        companyId = getStringAsync(constants.companyId);
      }

      // Validate company ID
      if (companyId.isEmpty) {
        throw Exception(
          "Company ID is missing. Please ensure you are logged in with a company account.",
        );
      }

      // Calculate next page
      final nextPage = currentStore.currentPage + 1;

      // Set loading state, preserving existing items
      emit(Loading(currentStore.copyWith(loading: true)));

      // Fetch next page
      final result = await _homeRepository.fetchJobs(
        companyId: companyId,
        page: nextPage, // Use calculated next page
        pageSize: currentStore.pageSize,
      );

      // Calculate derived values BEFORE emit
      final newItems = result.items ?? [];
      final bool reachedMax = newItems.isEmpty;
      final updatedItems = List<Item>.from(currentStore.items)
        ..addAll(newItems);
      final int totalFromRepo =
          result.total ??
          currentStore.totalItems; // Keep old total if new one is null

      // Emit loaded state with appended data and updated flags
      emit(
        Loaded(
          currentStore.copyWith(
            items: updatedItems,
            // Only increment page if new items were actually loaded
            currentPage: reachedMax ? currentStore.currentPage : nextPage,
            loading: false,
            hasReachedMax: reachedMax, // <<< SET THE FLAG HERE
            // Keep totalItems from the first load or update if API provides it consistently
            totalItems: totalFromRepo,
          ),
        ),
      );

      // Check if next page exists
      // final totalPages =
      //     (currentStore.totalItems / currentStore.pageSize).ceil();
      // if (nextPage >= totalPages) {
      //   return; // No more pages
      // }

      // Set loading
      // emit(Loading(currentStore.copyWith(loading: true)));

      // // Fetch next page
      // final result = await _homeRepository.fetchJobs(
      //   companyId: companyId,
      //   page: nextPage,
      //   pageSize: currentStore.pageSize,
      // );

      // // Append new items to existing list
      // final updatedItems = [...currentStore.items, ...?result.items];

      // // Emit loaded state with appended data
      // emit(
      //   Loaded(
      //     currentStore.copyWith(
      //       items: updatedItems,
      //       currentPage: nextPage,
      //       loading: false,
      //     ),
      //   ),
      // );
    } catch (e) {
      AppLoggerHelper.error("Error in _onNextPage: $e");
      emit(Error(state.store.copyWith(loading: false), e.toString()));
    }
  }

  Future<void> _onPreviousPage(
    PreviousPage event,
    Emitter<HomeState> emit,
  ) async {
    try {
      // Get company ID from event or shared preferences
      String companyId = event.companyId ?? '';
      if (companyId.isEmpty) {
        companyId = getStringAsync(constants.companyId);
      }

      // Validate company ID
      if (companyId.isEmpty) {
        throw Exception(
          "Company ID is missing. Please ensure you are logged in with a company account.",
        );
      }

      // Get current store
      final currentStore = state.store;

      // Calculate previous page
      final previousPage = currentStore.currentPage - 1;
      if (previousPage < 0) {
        return; // Already at first page
      }

      // Set loading
      emit(Loading(currentStore.copyWith(loading: true)));

      // Fetch previous page
      final result = await _homeRepository.fetchJobs(
        companyId: companyId,
        page: previousPage,
        pageSize: currentStore.pageSize,
      );

      // Emit loaded state with new data
      emit(
        Loaded(
          currentStore.copyWith(
            items: result.items!,
            currentPage: previousPage,
            loading: false,
          ),
        ),
      );
    } catch (e) {
      emit(Error(state.store.copyWith(loading: false), e.toString()));
    }
  }

  // Future<void> _onSearch(
  //     Search event,
  //     Emitter<HomeState> emit,
  //     ) async {
  //   try {
  //     // Reset pagination but keep search term
  //     final searchStore = state.store.copyWith(
  //       currentPage: 0,
  //       items: [],
  //       loading: true,
  //       searchTerm: event.query,
  //     );
  //
  //     emit(Loading(searchStore));
  //
  //     // Search with repository
  //     final result = await _homeRepository.fetchJobs(
  //       query: event.query,
  //       page: 0,
  //       pageSize: searchStore.pageSize,
  //     );
  //
  //     // Emit loaded state with search results
  //     emit(Loaded(
  //       searchStore.copyWith(
  //         items: result.items,
  //         totalItems: result.totalItems,
  //         loading: false,
  //       ),
  //     ));
  //   } catch (e) {
  //     emit(Error(state.store.copyWith(loading: false), e.toString()));
  //   }
  // }
}
