


import 'api_service/api_strings.dart';
import 'api_service/dio_client.dart';
import 'constants/env/env.dart';
import 'main.dart';

void main() {
  DioClient.init(ApiStrings.baseUrl);
  mainCommon(Env.prod);
}
