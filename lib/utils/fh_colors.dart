import 'dart:math';

import 'package:flutter/material.dart';

class HrmColors {
  HrmColors._();

  static Color generateRandomColor() {
    Random random = Random();
    return Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
  }

  static const fhMainColor = Color(0xFF567DF4);
  static const fhGreyTextColor = Color(0xFF9090AD);
  static const fhBorderColorTextField = Color(0xFFC2C2C2);
  static const fhDarkWhite = Color(0xFFF1F7F7);
  static const fhTitleColor = Color(0xFF22215B);
  static const fhAlertColor = Color(0xFFFF8919);
  static const fhBgColor = Color(0xFFFAFAFA);
  static const fhHalfDay = Color(0xFFE8B500);
  static const fhGreenColor = Color(0xFF08BC85);

  static const Color background = Color(0xffF4F5F7);
  static const Color colorBlack = Color(0xff050C17);
  static const Color yellow = Colors.yellow;
  static const Color black = Colors.black;
  static const Color blueAccent = Colors.blueAccent;

  static const Color teal = Colors.teal;
  static const Color pink = Colors.pink;
  static const Color pinkAccent = Colors.pinkAccent;

  static const Color deepPurpleAccent = Colors.deepPurpleAccent;
  static const Color deepOrange = Colors.deepOrange;
  static const Color orange = Colors.orange;
  static const Color blueGrey = Colors.blueGrey;

  static const Color amber = Colors.amber;
  static const Color deepPurple = Colors.deepPurple;
  static const Color purple = Colors.purple;
  static const Color purpleAccent = Colors.purpleAccent;

  static const Color transparent = Colors.transparent;

  static const Color colorDrawer = Color(0xff192428);
  static const Color colorCard = Color(0xff414c50);
  static const Color backgroundColor = Color(0xff2d383c);
  static const Color backgroundColor_600 = Color(0xff263539);

  static const Color textColorGray = Color(0xff60626B);
  static const Color captionColor = Color(0xff1B1E2B);

  static const Color secondCaption = Color(0xff282B37);

  static const Color primaryColor = Color(0xFF003370);
  static const Color secondaryColor = Color(0xFFf36d1d);
  static const Color cyanBlueColor = Color(0x007CBFCF);
  static const Color violetColor = Color(0xB316BFC4);
  static const Color blackColor = Colors.black87;
  static const Color transparentColor = Colors.transparent;
  static const Color blackColor1 = Colors.black26;
  static const Color blackColor2 = Colors.black;
  static const Color whiteColor = HrmColors.white;

  static const Color dropDownBorderColor = Color(0xFF8D8888);
  static const Color iconContainerColor = Color(0xFFD2D2D2);
  static const Color iconContainerDarkColor = Color(0xFF444343);
  static const Color chartSplineColor = Color(0xFF6042A7);
  static const Color primaryHealthMedicalColor = Color(0xFF02ACEB);
  static const Color lightSkyBlueColor = Color(0xFFD3EAF4);
  static const Color lightYellowColor = Color(0xFFFFEFE0);
  static const Color dividerMedicalDarkColor = Color(0xFFE5E2E2);

  static const Color rcSecondaryColor = Color(0xFFE2E2E2);
  static const Color rcSecondaryTextColor = Color(0xFF959292);
  static const Color sdTextPrimaryColor = Color(0xFF000000);
  static const Color sdTextSecondaryColor = Color(0xFF757575);
  static const Color sdPrimaryColor = Color(0xFF3281FF);
  static const Color sdSecondaryColorRed = Color(0xFFFF5C5C);
  static const Color sdSecondaryColorYellow = Color(0xFFFFA635);
  static const Color sdSecondaryColorGreen = Color(0xFF5DE094);
  static const Color sdIconColor = Color(0xFFA6A7AA);
  static const Color sdShadowColor = Color(0x95E9EBF0);
  static const Color sdAppBackground = Color(0xFFf8f8f8);
  static const Color sdViewColor = Color(0xFFDADADA);
  static Color blueGrey_800 = Colors.blueGrey.shade800;
  static Color indigo_900 = Colors.indigo.shade900;
  static Color blue_200 = Colors.blue.shade200;
  static Color blue_400 = Colors.blue.shade400;
  static Color blue_600 = Colors.blue.shade600;
  static Color blue_700 = Colors.blue.shade700;
  static Color blue_800 = Colors.blue.shade800;

  List<Color> webColors = <Color>[appCat1, appCat2, appCat3];

// Light Theme Colors
  static const Color appColorPrimary = Color(0xFF5685EC);
  static const Color appColorAccent = Color(0xFF03DAC5);
  static const Color appTextColorPrimary = Color(0xFF212121);
  static const Color iconColorPrimary = Color(0xFFFFFFFF);
  static const Color appTextColorSecondary = Color(0xFF5A5C5E);
  static const Color iconColorSecondary = Color(0xFFA8ABAD);
  static const Color appLayoutBackGround = Color(0xFFf8f8f8);
  static const Color appLightPurple = Color(0xFFdee1ff);
  static const Color appLightOrange = Color(0xFFffddd5);
  static const Color appLightParrotGreen = Color(0xFFb4ef93);
  static const Color appIconTintCherry = Color(0xFFffddd5);
  static const Color appIconTintSkyBlue = Color(0xFF73d8d4);
  static const Color appIconTintMustardYellow = Color(0xFFffc980);
  static const Color appIconTintDarkPurple = Color(0xFF8998ff);
  static const Color appTxtTintDarkPurple = Color(0xFF515BBE);
  static const Color appIconTintDarkCherry = Color(0xFFf2866c);
  static const Color appIconTintDarkSkyBlue = Color(0xFF73d8d4);
  static const Color appDarkParrotGreen = Color(0xFF5BC136);
  static const Color green = Colors.green;
  static const Color lightGreen = Colors.lightGreen;
  static const Color indigo = Colors.indigo;

  static const Color greenAccent = Colors.greenAccent;

  static const Color appDarkRed = Color(0xFFF06263);
  static const Color red = Colors.red;
  static const Color redAccent = Colors.redAccent;
  static const Color appLightRed = Color(0xFFF89B9D);
  static const Color appCat1 = Color(0xFF8998FE);
  static const Color appCat2 = Color(0xFFFF9781);
  static const Color appCat3 = Color(0xFF73D7D3);
  static const Color appCat4 = Color(0xFF87CEFA);
  static const Color appCat5 = appColorPrimary;
  static const Color appCat6 = appColorAccent;
  static const Color appShadowColor = Color(0x95E9EBF0);
  static const Color appColorPrimaryLight = Color(0xFFF9FAFF);
  static const Color appSecondaryBackgroundColor = Color(0xff343434);
  static const Color appDividerColor = Color(0xFFDADADA);
  static const Color appSplashSecondaryColor = Color(0xFFD7DBDD);

// Dark Theme Colors
  static const Color appBackgroundColorDark = Color(0xFF262626);
  static const Color cardBackgroundBlackDark = Color(0xFF1F1F1F);
  static const Color colorPrimaryBlack = Color(0xFF131d25);
  static const Color appColorPrimaryDarkLight = Color(0xFFF9FAFF);
  static const Color iconColorPrimaryDark = Color(0xFF212121);
  static const Color iconColorSecondaryDark = Color(0xFFA8ABAD);
  static const Color appShadowColorDark = Color(0x1A3E3942);

  static const Color nearlyWhite = Color(0xFFFAFAFA);
  static const Color white = Color(0xFFFFFFFF);
  static const Color nearlyDarkBlue = Color(0xFF2633C5);

  static const Color nearlyBlue = Color(0xFF00B6F0);
  static const Color blue = Colors.blue;
  static const Color nearlyBlack = Color(0xFF213333);
  static const Color grey = Color(0xFF3A5160);
  static Color grey_300 = Colors.grey[300]!;
  static Color grey_100 = Colors.grey[100]!;
  static Color grey_400 = Colors.grey[400]!;
  static Color black_300 = Colors.black.withValues(alpha: 0.3);
  static Color black_100 = Colors.black.withValues(alpha: 0.1);

  static const Color darkGrey = Color(0xFF313A44);

  static const Color darkText = Color(0xFF253840);
  static const Color darkerText = Color(0xFF17262A);
  static const Color lightText = Color(0xFF4A6572);
  static const Color deactivatedText = Color(0xFF767676);
  static const Color dismissibleBackground = Color(0xFF364A54);
  static const Color spacer = Color(0xFFF2F2F2);

  // Task Status Color
  static const Color statusViolet = Color(0xFF9400D3);
  static const Color statusIndigo = Color(0xFF4B0082);
  static const Color statusBlue = Color(0xFF0000FF);
  static const Color statusGreen = Color(0xFF00FF00);
  static const Color statusYellow = Color(0xFFFFFF00);
  static const Color statusOrange = Color(0xFFFF7F00);
  static const Color statusRed = Color(0xFFFF0000);

  // travel expense
  // static const Color blueLightMode = Color(0xFF64B5F6);
  // static const Color blueDarkMode = Color(0xFF1E88E5);
  //
  // static const Color greenLightMode = Color(0xFF81C784);
  // static const Color greenDarkMode = Color(0xFF2E7D32);
  //
  // static const Color purpleLightMode = Color(0xFFBA68C8);
  // static const Color purpleDarkMode = Color(0xFF7B1FA2);
  //
  // static const Color orangeLightMode = Color(0xFFFFB74D);
  // static const Color orangeDarkMode = Color(0xFFE65100);

  static const Color otherCardLightMode = Color(0xFFFFF3E0);
  static const Color otherCardDarkMode = Color(0xFF455A64);

  static const Color mealCardLightMode = Color(0xFFB3E5FC);
  static const Color mealCardDarkMode = Color(0xFF01579B);

  static const Color travelCardLightMode = Color(0xFFFFCDD2);
  static const Color travelCardDarkMode = Color(0xFF4A148C);

  static const Color lodgingCardLightMode = Color(0xFFB2DFDB);
  static const Color lodgingCardDarkMode = Color(0xFF00695C);
  static const Color pinkPunch = Color(0xFFE8356C);
  static const Color bluePunch = Color(0xFF00CCFF);
}

Color hexToColor(String hexColor, {double opacity = 1.0}) {
  // Remove the leading '#' if present
  hexColor = hexColor.replaceAll('#', '');

  // Ensure the hex color is 6 characters long (for RRGGBB)
  if (hexColor.length == 6) {
    // Convert opacity to a value between 0 and 255
    int alpha = (opacity * 255).round();

    // Parse the hex color and combine with the alpha value
    return Color(int.parse(hexColor, radix: 16) + (alpha << 24));
  } else {
    throw ArgumentError('Hex color must be 6 characters long.');
  }
}

class HexColor extends Color {
  HexColor(var hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF$hexColor';
    }
    return int.parse(hexColor, radix: 16);
  }
}

bool useWhiteForeground(Color color) {
  final int brightness =
      ((color.red * 299) + (color.green * 587) + (color.blue * 114)) ~/ 1000;
  return brightness < 128;
}
