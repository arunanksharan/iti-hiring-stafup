import 'package:flutter/material.dart';

import 'fh_app_theme.dart';
import 'fh_colors.dart';
import 'fh_images.dart';

class ColorNotifier with ChangeNotifier {
  bool get getIsDark => isDark;

  Color get tabAccentColor =>
      isDark ? const Color(0xFF25D366) : const Color(0xff8231D3);

  MaterialColor get primaryCalenderColor =>
      isDark ? Colors.blueGrey : Colors.blue;

  MaterialColor get dateTimeColor => isDark ? Colors.blue : Colors.indigo;

  Color get getDrawer => isDark ? HrmColors.colorDrawer : HrmColors.white;

  Color get lightTextColor =>
      isDark ? HrmColors.backgroundColor : HrmColors.black;

  Color get background =>
      isDark ? HrmColors.backgroundColor : HrmColors.fhMainColor;

  Color get tabBarColor =>
      isDark ? HrmColors.fhMainColor : HrmColors.fhMainColor;

  Color get cardColor => isDark ? HrmColors.backgroundColor : HrmColors.white;

  Color get drawerTextColor => isDark ? HrmColors.white : HrmColors.fhMainColor;

  Color get drawerDividerColor =>
      isDark ? HrmColors.black : HrmColors.fhMainColor;

  Color get textColor => isDark ? HrmColors.white : HrmColors.black;

  Color get unSelectedTextColor => isDark ? HrmColors.black : HrmColors.white;

  Color get titleColor => isDark ? HrmColors.white : HrmColors.fhTitleColor;

  Color get buttonTextColor =>
      isDark ? HrmColors.white : const Color(0xFF0A2962);

  Color get iconColor => !isDark ? HrmColors.white : HrmColors.blackColor;

  Color get textColorGrey => isDark ? HrmColors.textColorGray : HrmColors.white;

  Color get textColorGrey2 => isDark ? HrmColors.white : Colors.grey[700]!;

  Color get primaryCaptionColor =>
      isDark ? HrmColors.captionColor : HrmColors.white;

  Color? get primaryCaptionColor2 => isDark ? Colors.grey[300] : Colors.white;

  Color get getSecondCaption =>
      isDark ? HrmColors.secondCaption : const Color(0xffF4F5F7);

  Color get lodgingColor =>
      isDark ? HrmColors.lodgingCardDarkMode : HrmColors.lodgingCardLightMode;

  Color get travelColor =>
      isDark ? HrmColors.travelCardDarkMode : HrmColors.travelCardLightMode;

  Color get mealColor =>
      isDark ? HrmColors.mealCardDarkMode : HrmColors.mealCardLightMode;

  Color get otherColor =>
      isDark ? HrmColors.otherCardDarkMode : HrmColors.otherCardLightMode;

  Color get drawerColor => isDark ? HrmColors.colorDrawer : HrmColors.white;

  Color get drawerInfoColor =>
      isDark ? HrmColors.cardBackgroundBlackDark : HrmColors.fhMainColor;

  Color get drawerTextSelected =>
      isDark ? HrmColors.fhDarkWhite : HrmColors.primaryColor;

  Color get authButtonColor =>
      isDark ? HrmColors.grey.withValues(alpha: 0.2) : const Color(0xffF1F2F5);

  Color get darkMainContain =>
      isDark ? HrmColors.blackColor : HrmColors.grey.withValues(alpha: 0.2);

  Color get underContainerColor =>
      isDark ? const Color(0xff282B37) : HrmColors.white;

  Color get mapColor =>
      isDark ? const Color(0xffF4F5F7) : HrmColors.cyanBlueColor;

  Color get termContain => isDark ? const Color(0xff1E2841) : HrmColors.white;

  ThemeMode get getThemeMode => isDark ? ThemeMode.dark : ThemeMode.system;

  ThemeData get getTheme =>
      isDark ? AppThemeData.darkTheme : AppThemeData.lightTheme;

  Color get shadowDarkColor =>
      isDark ? const Color(0x99FFFFFF) : const Color(0x73000000);

  Color get borderColor =>
      isDark ? const Color(0xFFFFFFFF) : HrmColors.primaryColor;

  double get borderDepth => isDark ? 0 : 2;

  double get drawerDepth => isDark ? -2 : 12;

  Color get backgroundColor =>
      isDark ? const Color(0xFF212332) : HrmColors.white;

  Color get oppTextColor => isDark ? HrmColors.black : HrmColors.white;

  Color get clockColor => isDark ? HrmColors.nearlyWhite : Color(0xFF404A58);

  Color get stripColor =>
      isDark ? HrmColors.black : HrmColors.fhBorderColorTextField;

  Color get checkBoxColor => isDark ? HrmColors.blue : HrmColors.blue;
  Color get statusColor => isDark ? HrmColors.red : HrmColors.blue;
  Color get baseColor => isDark ? HrmColors.black_300 : HrmColors.grey_300;
  Color get highlightColor => isDark ? HrmColors.black_100 : HrmColors.grey_100;

  List<Color> get gradientCardColor =>
      isDark
          ? [HrmColors.blueGrey_800, HrmColors.indigo_900]
          : [HrmColors.blue_400, HrmColors.blue_700];

  List<Color> get fhMainGradientColor =>
      isDark
          ? [const Color(0xFF2C3E50), const Color(0xFF1A1F35)]
          : [HrmColors.blue_600, HrmColors.blue_800];

  bool _isDark = false;

  bool get isDark => _isDark;

  void isAvailable(bool value) {
    _isDark = value;
    notifyListeners();
  }
}
