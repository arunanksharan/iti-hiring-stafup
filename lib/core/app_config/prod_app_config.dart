part of 'i_app_config.dart';

final class ProdAppConfig implements IAppConfig {
  const ProdAppConfig._();

  @override
  Env get env => Env.prod;

  @override
  String get appName => 'ITI Hiring';



  @override
  // TODO: implement firebaseOptions
  FirebaseOptions get firebaseOptions =>
      firebase_options_prod.DefaultFirebaseOptions.currentPlatform;

}
