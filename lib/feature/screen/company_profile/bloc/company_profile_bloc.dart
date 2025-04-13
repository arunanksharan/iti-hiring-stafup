import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:stafup/feature/screen/company_profile/data/model/company_profile_model.dart';
import 'package:stafup/feature/screen/company_profile/data/repository/company_profile_repository.dart';
import 'package:stafup/utils/logger.dart';

// Events
abstract class CompanyProfileEvent extends Equatable {
  const CompanyProfileEvent();

  @override
  List<Object?> get props => [];
}

class FetchCompanyProfile extends CompanyProfileEvent {
  final String companyId;

  const FetchCompanyProfile(this.companyId);

  @override
  List<Object?> get props => [companyId];
}

class UpdateCompanyProfile extends CompanyProfileEvent {
  final String companyId;
  final String name;
  final String address;
  final String email;
  final String organisationType;

  const UpdateCompanyProfile({
    required this.companyId,
    required this.name,
    required this.address,
    required this.email,
    required this.organisationType,
  });

  @override
  List<Object?> get props => [
    companyId,
    name,
    address,
    email,
    organisationType,
  ];
}

// States
abstract class CompanyProfileState extends Equatable {
  const CompanyProfileState();

  @override
  List<Object?> get props => [];
}

class CompanyProfileInitial extends CompanyProfileState {}

class CompanyProfileLoading extends CompanyProfileState {}

class CompanyProfileLoaded extends CompanyProfileState {
  final CompanyProfileModel companyProfile;

  const CompanyProfileLoaded(this.companyProfile);

  @override
  List<Object?> get props => [companyProfile];
}

class CompanyProfileUpdated extends CompanyProfileState {
  final CompanyProfileModel companyProfile;

  const CompanyProfileUpdated(this.companyProfile);

  @override
  List<Object?> get props => [companyProfile];
}

class CompanyProfileError extends CompanyProfileState {
  final String message;

  const CompanyProfileError(this.message);

  @override
  List<Object?> get props => [message];
}

// BLoC
class CompanyProfileBloc
    extends Bloc<CompanyProfileEvent, CompanyProfileState> {
  final CompanyProfileRepository _repository;

  CompanyProfileBloc(this._repository) : super(CompanyProfileInitial()) {
    on<FetchCompanyProfile>(_onFetchCompanyProfile);
    on<UpdateCompanyProfile>(_onUpdateCompanyProfile);
  }

  Future<void> _onFetchCompanyProfile(
    FetchCompanyProfile event,
    Emitter<CompanyProfileState> emit,
  ) async {
    try {
      emit(CompanyProfileLoading());
      final result = await _repository.fetchCompanyDetails(
        companyId: event.companyId,
      );
      emit(CompanyProfileLoaded(result));
    } catch (e) {
      emit(CompanyProfileError(e.toString()));
    }
  }

  Future<void> _onUpdateCompanyProfile(
    UpdateCompanyProfile event,
    Emitter<CompanyProfileState> emit,
  ) async {
    // Get current state data before emitting loading to avoid losing it
    CompanyProfileModel? currentStateData;
    if (state is CompanyProfileLoaded) {
      currentStateData = (state as CompanyProfileLoaded).companyProfile;
    } else if (state is CompanyProfileUpdated) {
      currentStateData = (state as CompanyProfileUpdated).companyProfile;
    }
    try {
      // Emit loading but preserve existing data if possible
      emit(CompanyProfileLoading());
      final result = await _repository.updateCompanyDetails(
        companyId: event.companyId,
        name: event.name,
        address: event.address,
        organisationType: event.organisationType, // <<< Pass organisationType
        email: event.email,
      );
      emit(CompanyProfileLoaded(result));
      emit(CompanyProfileUpdated(result));
    } catch (e) {
      AppLoggerHelper.error(
        "Error in _onUpdateCompanyProfile: $e",
      ); // Optional log
      // On error, revert to previous loaded state if possible, or just show error
      if (currentStateData != null) {
        emit(CompanyProfileLoaded(currentStateData)); // Revert to previous data
        // Optionally show error via snackbar or separate error state if needed
        emit(
          CompanyProfileError(e.toString()),
        ); // Emit error state *after* reverting UI data
      } else {
        emit(CompanyProfileError(e.toString()));
      }
    }
  }
}
