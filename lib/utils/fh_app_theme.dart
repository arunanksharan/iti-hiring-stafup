import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stafup/utils/theme/app_colors.dart';
import 'package:stafup/utils/theme/app_typography.dart';
import 'package:itq_utils/itq_utils.dart';

import 'fh_colors.dart';

class AppThemeData {
  AppThemeData._();

  static final ThemeData lightTheme = ThemeData(
    fontFamily: GoogleFonts.poppins().fontFamily,
    splashColor: Colors.transparent,
    hoverColor: Colors.transparent,
    highlightColor: Colors.transparent,
    dividerColor: Colors.transparent,
    colorScheme: const ColorScheme.light(
      primary: HrmColors.primaryColor,
    ).copyWith(error: Colors.red),
    useMaterial3: true,
    scaffoldBackgroundColor: HrmColors.white,
    primaryColor: HrmColors.primaryColor,
    primaryColorDark: HrmColors.primaryColor,
    appBarTheme: const AppBarTheme(
      color: HrmColors.white,
      iconTheme: IconThemeData(color: textPrimaryColor),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
      ),
    ),
    drawerTheme: const DrawerThemeData(
      scrimColor: Colors.transparent,
      elevation: 0.5,
    ),
    textSelectionTheme: const TextSelectionThemeData(cursorColor: Colors.black),
    cardTheme: const CardTheme(color: HrmColors.white),
    cardColor: HrmColors.white,
    iconTheme: const IconThemeData(color: textPrimaryColor),
    bottomSheetTheme: const BottomSheetThemeData(backgroundColor: whiteColor),
    textTheme: const TextTheme(
      labelLarge: TextStyle(color: HrmColors.primaryColor),
      titleLarge: TextStyle(color: textPrimaryColor),
      titleSmall: TextStyle(color: textSecondaryColor),
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  ).copyWith(
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.linux: OpenUpwardsPageTransitionsBuilder(),
        TargetPlatform.macOS: OpenUpwardsPageTransitionsBuilder(),
      },
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    fontFamily: GoogleFonts.poppins().fontFamily,
    splashColor: Colors.transparent,
    hoverColor: Colors.black12,
    highlightColor: HrmColors.appBackgroundColorDark,
    dividerColor: const Color(0xFFDADADA).withValues(alpha: 0.3),
    colorScheme: const ColorScheme.dark(
      primary: HrmColors.appBackgroundColorDark,
      onPrimary: HrmColors.cardBackgroundBlackDark,
    ).copyWith(secondary: whiteColor).copyWith(error: const Color(0xFFCF6676)),
    useMaterial3: true,
    scaffoldBackgroundColor: HrmColors.appBackgroundColorDark,
    drawerTheme: const DrawerThemeData(
      scrimColor: Colors.transparent,
      elevation: 0.5,
    ),
    appBarTheme: const AppBarTheme(
      color: HrmColors.appBackgroundColorDark,
      iconTheme: IconThemeData(color: blackColor),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
      ),
    ),
    primaryColor: HrmColors.colorPrimaryBlack,
    primaryColorDark: HrmColors.colorPrimaryBlack,
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: HrmColors.white,
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: HrmColors.appBackgroundColorDark,
    ),
    primaryTextTheme: TextTheme(
      titleLarge: primaryTextStyle(color: HrmColors.white),
      labelSmall: primaryTextStyle(color: HrmColors.white),
    ),
    cardTheme: const CardTheme(color: HrmColors.cardBackgroundBlackDark),
    cardColor: HrmColors.appSecondaryBackgroundColor,
    iconTheme: const IconThemeData(color: whiteColor),
    textTheme: const TextTheme(
      labelLarge: TextStyle(color: HrmColors.colorPrimaryBlack),
      titleLarge: TextStyle(color: whiteColor),
      titleSmall: TextStyle(color: Colors.white54),
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  ).copyWith(
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.linux: OpenUpwardsPageTransitionsBuilder(),
        TargetPlatform.macOS: OpenUpwardsPageTransitionsBuilder(),
      },
    ),
  );
}

class AppTheme {
  AppTheme._();

  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: null, // Use platform-default fonts
    primaryColor: AppColors.primary500, // Main primary color
    // Color Scheme: Defines the overall color palette for components
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary500, // Base color for derivation
      brightness: Brightness.light,
      // Override specific scheme colors:
      primary: AppColors.primary500,
      secondary: AppColors.secondary500,
      // Use surface for component backgrounds like Card, Dialog
      surface: AppColors.white, // Changed from 'background'
      error: AppColors.error,
      onPrimary: AppColors.white, // Text/icons on primary color
      onSecondary: AppColors.white, // Text/icons on secondary color
      // Use onSurface for text/icons on component backgrounds
      onSurface: AppColors.textPrimary, // Changed from 'onBackground'
      onError: AppColors.white, // Text/icons on error color
      // background and onBackground are derived if needed, but we explicitly set scaffoldBackgroundColor
    ),

    // Scaffold Background Color (explicitly set)
    scaffoldBackgroundColor:
        AppColors.backgroundPrimary, // Still use this for the main scaffold
    // Text Theme: Apply the custom text styles
    // NOTE: Removed 'const' here as TextTheme() constructor itself might not be const
    // if properties within AppTypography weren't truly const (though they are in our case).
    // It's safer to remove 'const' unless absolutely sure everything down the chain is const.
    textTheme: TextTheme(
      // Removed 'const'
      displayLarge: AppTypography.displayLarge,
      displayMedium: AppTypography.displayMedium,
      displaySmall: AppTypography.displaySmall,
      headlineLarge: AppTypography.headlineLarge,
      headlineMedium: AppTypography.headlineMedium,
      headlineSmall: AppTypography.headlineSmall,
      titleLarge: AppTypography.titleLarge,
      titleMedium: AppTypography.titleMedium,
      titleSmall: AppTypography.titleSmall,
      bodyLarge: AppTypography.bodyLarge,
      bodyMedium: AppTypography.bodyMedium,
      bodySmall: AppTypography.bodySmall,
      labelLarge: AppTypography.labelLarge, // Used for buttons by default
      labelMedium: const TextStyle(
        fontWeight: FontWeight.w500,
      ), // Can be const if defined directly
      labelSmall: const TextStyle(
        fontWeight: FontWeight.w500,
      ), // Can be const if defined directly
    ).apply(
      // Apply default text colors
      bodyColor: AppColors.textPrimary, // Default text color for body styles
      displayColor:
          AppColors.textPrimary, // Default text color for display styles
    ),

    // --- Component Themes (Removed 'const' where .copyWith was used) ---
    appBarTheme: AppBarTheme(
      // Removed 'const'
      backgroundColor: AppColors.primary500,
      foregroundColor: AppColors.white,
      elevation: 4.0,
      centerTitle: true,
      // Using .copyWith requires the AppBarTheme constructor NOT to be const
      titleTextStyle: AppTypography.titleLarge.copyWith(color: AppColors.white),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      // StyleFrom results are not const, so ElevatedButtonThemeData cannot be const
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary500,
        foregroundColor: AppColors.white,
        // Using .copyWith requires the styleFrom result NOT to be const
        textStyle: AppTypography.labelLarge.copyWith(color: AppColors.white),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      ),
    ),

    textButtonTheme: TextButtonThemeData(
      // StyleFrom results are not const
      style: TextButton.styleFrom(
        foregroundColor: AppColors.primary500,
        // Using .copyWith requires the styleFrom result NOT to be const
        textStyle: AppTypography.labelLarge.copyWith(
          fontWeight: FontWeight.w600,
        ),
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      // Removed 'const'
      filled: true,
      fillColor: AppColors.neutral100,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: AppColors.primary500, width: 2.0),
      ),
      // Using .copyWith requires the InputDecorationTheme constructor NOT to be const
      labelStyle: AppTypography.bodyMedium.copyWith(
        color: AppColors.textSecondary,
      ),
      hintStyle: AppTypography.bodyMedium.copyWith(
        color: AppColors.textTertiary,
      ),
      errorStyle: AppTypography.bodySmall.copyWith(color: AppColors.error),
    ),

    cardTheme: CardTheme(
      // Removed 'const' (safer if shape or other properties might become non-const later)
      elevation: 2.0,
      color: AppColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0),
    ),

    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
