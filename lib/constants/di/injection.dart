import 'package:get_it/get_it.dart';
import 'package:stafup/feature/screen/home/bloc/home_bloc.dart';
import 'package:stafup/feature/screen/home/data/repository/home_repository.dart';
import 'package:stafup/feature/screen/profile/bloc/profile_bloc.dart';
import 'package:stafup/feature/screen/profile/data/repository/job_update_repository.dart';

import 'package:stafup/feature/authentication/bloc/auth_bloc.dart';
import 'package:stafup/feature/authentication/data/repository/auth_repository.dart';

final getIt = GetIt.instance;

void setupLocator() {
  getIt
    ..registerLazySingleton<AuthRepository>(AuthRepository.new)
    ..registerFactory<AuthBloc>(() => AuthBloc(getIt<AuthRepository>()))
    ..registerLazySingleton<HomeRepository>(HomeRepository.new)
    ..registerFactory<HomeBloc>(() => HomeBloc(getIt<HomeRepository>()))
    ..registerLazySingleton<JobUpdateRepository>(JobUpdateRepository.new)
    ..registerFactory<ProfileBloc>(
      () => ProfileBloc(getIt<JobUpdateRepository>()),
    );
}
