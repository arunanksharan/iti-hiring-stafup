part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial(HomeStore store) = Initial;

  const factory HomeState.loading(HomeStore store) = Loading;

  const factory HomeState.loaded(HomeStore store) = Loaded;

  const factory HomeState.error(HomeStore store, String message) = Error;
}

extension HomeStateX on HomeState {
  HomeStore get store {
    return map(
      initial: (state) => state.store,
      loading: (state) => state.store,
      loaded: (state) => state.store,
      error: (state) => state.store,
    );
  }
}

@freezed
class HomeStore with _$HomeStore {
  const factory HomeStore({
    @Default([]) List<Item> items,
    @Default(1) int currentPage,
    @Default(50) int pageSize,
    @Default(0) int totalItems,
    @Default(false) bool loading,
    String? searchTerm,
    @Default(false) bool hasReachedMax,
  }) = _HomeStore;
}
