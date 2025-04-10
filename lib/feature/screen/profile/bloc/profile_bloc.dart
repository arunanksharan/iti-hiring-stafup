import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:stafup/feature/screen/profile/data/model/job_update_model.dart';
import 'package:stafup/feature/screen/profile/data/repository/job_update_repository.dart';

part 'profile_bloc.freezed.dart';
part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final JobUpdateRepository _profileRepository;

  ProfileBloc(this._profileRepository)
    : super(const Initial(ProfileStateStore())) {
    on<_UpdateJobSuccessEvent>(_onUpdateJobSuccessEvent);
  }

  Future<void> _onUpdateJobSuccessEvent(
    _UpdateJobSuccessEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(ProfileState.loading(state.store.copyWith(loading: true)));

    try {
      final data = await _profileRepository.updateJob(
        jobId: event.jobId,
        jobPostingData: event.jobPostingData,
      );

      if (data == null) {
        emit(
          ProfileState.error(state.store.copyWith(loading: false), 'No data'),
        );
      } else {
        emit(
          ProfileState.updateJobSuccess(
            store: state.store.copyWith(loading: false, jobPosting: data),
          ),
        );
      }
    } catch (error) {
      emit(
        ProfileState.error(
          state.store.copyWith(loading: false),
          error.toString(),
        ),
      );
    }
  }

  void updateJob({required String jobId, required JobPosting jobPostingData}) {
    add(
      ProfileEvent.updateJobSuccessEvent(
        jobId: jobId,
        jobPostingData: jobPostingData,
      ),
    );
  }
}
