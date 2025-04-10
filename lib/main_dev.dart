// ignore_for_file: unused_import

import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itq_utils/itq_utils.dart';
import 'api_service/api_strings.dart';
import 'api_service/dio_client.dart';
 import 'constants/di/injection.dart';
import 'constants/env/env.dart';

import 'main.dart';




void main() async {
  DioClient.init(ApiStrings.baseUrl);
  mainCommon(Env.dev);
}
