import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:stafup/feature/screen/company_profile/data/model/company_profile_model.dart';
import 'package:stafup/feature/screen/company_profile/data/repository/company_profile_repository.dart';

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

  const UpdateCompanyProfile({
    required this.companyId,
    required this.name,
    required this.address,
  });

  @override
  List<Object?> get props => [companyId, name, address];
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
class CompanyProfileBloc extends Bloc<CompanyProfileEvent, CompanyProfileState> {
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
    try {
      emit(CompanyProfileLoading());
      final result = await _repository.updateCompanyDetails(
        companyId: event.companyId,
        name: event.name,
        address: event.address,
      );
      emit(CompanyProfileUpdated(result));
    } catch (e) {
      emit(CompanyProfileError(e.toString()));
    }
  }
}
