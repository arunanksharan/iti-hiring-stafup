import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

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
    try {
      // Get current store
      final currentStore = state.store;

      // Emit loading state
      emit(Loading(currentStore.copyWith(loading: true)));

      // Fetch data with pagination parameters
      final result = await _homeRepository.fetchJobs(
        companyId: event.companyId!,
        page: currentStore.currentPage,
        pageSize: currentStore.pageSize,
      );

      // Emit loaded state with new data
      emit(
        Loaded(
          currentStore.copyWith(
            items: result.items!,
            totalItems: result.total!,
            loading: false,
          ),
        ),
      );
    } catch (e) {
      emit(Error(state.store.copyWith(loading: false), e.toString()));
    }
  }

  Future<void> _onResetAndFetch(
    ResetAndFetch event,
    Emitter<HomeState> emit,
  ) async {
    try {
      // Reset pagination and store
      final resetStore = state.store.copyWith(
        currentPage: 1,
        items: [],
        loading: true,
      );

      emit(Loading(resetStore));

      // Fetch first page
      final result = await _homeRepository.fetchJobs(
        companyId: event.companyId!,
        page: 1,
        pageSize: resetStore.pageSize,
      );

      // Emit loaded state with new data
      emit(
        Loaded(
          resetStore.copyWith(
            items: result.items!,
            totalItems: result.total!,
            loading: false,
          ),
        ),
      );
    } catch (e) {
      emit(Error(state.store.copyWith(loading: false), e.toString()));
    }
  }

  Future<void> _onNextPage(NextPage event, Emitter<HomeState> emit) async {
    try {
      // Calculate next page
      final currentStore = state.store;
      final nextPage = currentStore.currentPage + 1;

      // Check if next page exists
      final totalPages =
          (currentStore.totalItems / currentStore.pageSize).ceil();
      if (nextPage >= totalPages) {
        return; // No more pages
      }

      // Set loading
      emit(Loading(currentStore.copyWith(loading: true)));

      // Fetch next page
      final result = await _homeRepository.fetchJobs(
        companyId: event.companyId ?? '',
        page: nextPage,
        pageSize: currentStore.pageSize,
      );

      // Append new items to existing list
      final updatedItems = [...currentStore.items, ...?result.items];

      // Emit loaded state with appended data
      emit(
        Loaded(
          currentStore.copyWith(
            items: updatedItems,
            currentPage: nextPage,
            loading: false,
          ),
        ),
      );
    } catch (e) {
      emit(Error(state.store.copyWith(loading: false), e.toString()));
    }
  }

  Future<void> _onPreviousPage(
    PreviousPage event,
    Emitter<HomeState> emit,
  ) async {
    try {
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
        companyId: event.companyId ?? '',
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
}
