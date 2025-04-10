part of 'profile_bloc.dart';

@freezed
sealed class ProfileState with _$ProfileState {
  const factory ProfileState.initial(
    ProfileStateStore store,
  ) = Initial;

  const factory ProfileState.loading(
     ProfileStateStore store,
  ) = Loading;


  const factory ProfileState.updateJobSuccess({
    required ProfileStateStore store,
  }) = UpdateJobSuccess;


  const factory ProfileState.error(
     ProfileStateStore store,
      String errorMessage
  ) = Error;
}

@freezed
class ProfileStateStore with _$ProfileStateStore {
  const factory ProfileStateStore({
    @Default(false) bool loading,
    @Default("") String errorMessage,
    JobPosting? jobPosting,
  }) = _ProfileStateStore;
}