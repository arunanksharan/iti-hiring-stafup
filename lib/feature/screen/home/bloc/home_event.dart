part of 'home_bloc.dart';

@freezed
class HomeEvent with _$HomeEvent {

  const factory HomeEvent.fetchJobs(String? companyId) = FetchJobs;


  const factory HomeEvent.resetAndFetch(String? companyId) = ResetAndFetch;


  const factory HomeEvent.nextPage([String? companyId]) = NextPage;
  const factory HomeEvent.previousPage([String? companyId]) = PreviousPage;

  // Search
  const factory HomeEvent.search(String query) = Search;
}