import 'package:firebase_core/firebase_core.dart';
import 'package:stafup/constants/env/env.dart';
import '../firebase/firebase_options_prod.dart' as firebase_options_prod;

part 'dev_app_config.dart';
part 'prod_app_config.dart';

part 'uat_app_config.dart';

late final IAppConfig appConfig;

abstract interface class IAppConfig {
  Env get env;

  String get appName;

  FirebaseOptions get firebaseOptions;

  factory IAppConfig.init(Env env) {
    return switch (env) {
      Env.prod => const ProdAppConfig._(),
      Env.dev => const DevAppConfig._(),
      Env.uat => const UatAppConfig._(),
    };
  }
}
