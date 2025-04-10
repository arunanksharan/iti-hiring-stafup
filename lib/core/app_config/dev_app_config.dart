part of 'i_app_config.dart';

final class DevAppConfig implements IAppConfig {
  const DevAppConfig._();

  @override
  Env get env => Env.dev;

  @override
  String get appName => 'ITI Hiring Dev';



  @override
  // TODO: implement firebaseOptions
  FirebaseOptions get firebaseOptions => throw UnimplementedError();

}
