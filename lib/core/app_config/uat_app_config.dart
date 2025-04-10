part of 'i_app_config.dart';

final class UatAppConfig implements IAppConfig {
  const UatAppConfig._();

  @override
  Env get env => Env.dev;

  @override
  String get appName => 'ITI Hiring UAT';

  @override
  // TODO: implement firebaseOptions
  FirebaseOptions get firebaseOptions => throw UnimplementedError();
}
