import 'package:flutter/material.dart';

class AppConst {
  static const String _baseUrlTest = "";

  static String baseUrlApi = _baseUrlTest;

  static String? endPoint;
  static String? bariKoiApiKey;

  static String baseUrlLocation = "$endPoint$bariKoiApiKey/";

  static String bearerToken = 'Bearer';
}

class CustomColors {
  // final Color _mainColor = const Color(0xFF041E48);
  // 0xFF6152BE -> Check In Color
  final Color _mainColor = const Color(0xFF295A46);
  final Color _mainDarkColor = const Color(0xFF041113);
  final Color _secondColor = const Color(0xFFfb412a);
  final Color _secondDarkColor = const Color(0xFFcb3421);
  final Color _accentColor = const Color(0xFF8C98A8);
  final Color _accentDarkColor = const Color(0xFF9999aa);
  final Color _scaffoldColor = const Color(0xFFFAFAFA);

  Color mainColor({double? opacity}) {
    return _mainColor.withValues(alpha: opacity ?? 1.0);
  }

  Color secondColor(double opacity) {
    return _secondColor.withValues(alpha: opacity);
  }

  Color accentColor(double opacity) {
    return _accentColor.withValues(alpha: opacity);
  }

  Color mainDarkColor(double opacity) {
    return _mainDarkColor.withValues(alpha: opacity);
  }

  Color secondDarkColor(double opacity) {
    return _secondDarkColor.withValues(alpha: opacity);
  }

  Color accentDarkColor(double opacity) {
    return _accentDarkColor.withValues(alpha: opacity);
  }

  Color scaffoldColor(double opacity) {
    // TODO test if brightness is dark or not
    return _scaffoldColor.withValues(alpha: opacity);
  }
}
