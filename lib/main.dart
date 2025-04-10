// ignore_for_file: unused_import

import 'dart:async';

import 'package:credential_manager/credential_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:stafup/feature/screen/home/bloc/home_bloc.dart';
import 'package:stafup/feature/screen/profile/bloc/profile_bloc.dart';
import 'package:stafup/utils/fh_app_bloc_observer.dart';
import 'package:stafup/utils/fh_app_theme.dart';
import 'package:stafup/utils/fh_color_provider.dart';
import 'package:stafup/utils/fh_colors.dart';
import 'package:stafup/utils/fh_global_widgets.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'api_service/api_strings.dart';
import 'api_service/connectivity/connectivity_status.dart';
import 'api_service/dio_client.dart';
import 'constants/di/injection.dart';
import 'constants/env/env.dart';
import 'core/app_config/i_app_config.dart';
import 'core/main/internet_connectivity_wrapper.dart';
import 'core/main/splash_screen.dart';
import 'feature/authentication/bloc/auth_bloc.dart';
import 'feature/authentication/presentation/enter_number.dart';
import 'feature/authentication/presentation/otp_verification.dart';
import 'feature/authentication/presentation/verify_gst_number.dart';
import 'feature/bottom_navigation.dart';
import 'feature/screen/home/presentation/home_page.dart';
import 'feature/screen/profile/presentation/job_update_page.dart';

Future<void> mainCommon(Env env) async {
  appConfig = IAppConfig.init(env);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  LoggerHelper.initialize();
  await initialize();
  Bloc.observer = AppBlocObserver();
  setupLocator();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: HrmColors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final List<GetPage> getPages = [
    GetPage(name: '/', page: SplashScreen.new),
    GetPage(name: '/EnterNumber', page: EnterNumber.new),
    GetPage(name: '/OTPVerification', page: OTPVerification.new),
    GetPage(name: '/VerifyGstNumber', page: VerifyGstNumber.new),
    GetPage(name: '/ProfilePage', page: JobUpdatePage.new),
    GetPage(name: '/HomePage', page: HomePage.new),
    GetPage(name: '/BottomNavigation', page: BottomNavigation.new),
  ];

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ColorNotifier()),
        ChangeNotifierProvider(create: (_) => ConnectivityProvider()),
      ],
      child: BlocProvider(
        create: (context) => getIt<AuthBloc>(),
        child: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {},
          child: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (BuildContext context) => getIt<AuthBloc>(),
                child: BackgroundScreen(title: 'title', child: Container()),
              ),

              BlocProvider(
                create: (BuildContext context) => getIt<ProfileBloc>(),
                child: JobUpdatePage(),
              ),
              BlocProvider(
                create: (BuildContext context) => getIt<HomeBloc>(),
                child: HomePage(),
              ),
            ],
            child: Consumer<ColorNotifier>(
              builder: (
                BuildContext context,
                ColorNotifier notifier,
                Widget? child,
              ) {
                return InternetConnectivityWrapper(
                  child: GetMaterialApp(
                    home: const SplashScreen(),
                    title: 'ITI Hiring App',
                    debugShowCheckedModeBanner: false,
                    theme: AppTheme.lightTheme,
                    getPages: getPages,
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
