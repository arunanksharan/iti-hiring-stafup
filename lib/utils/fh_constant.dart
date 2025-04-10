// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'fh_colors.dart';

const apiAuthToken = 'API_AUTH_TOKEN';
const refreshToken = 'REFRESH_TOKEN';


const isLoggedIn = 'IS_LOGGED_IN';
const companyId = 'COMPANY_ID';

/// Alert types
enum AlertType { error, success, info, warning, none }

/// Alert animation types
enum AnimationType { fromRight, fromLeft, fromTop, fromBottom, grow, shrink }

final fhTextStyle = GoogleFonts.manrope(color: HrmColors.fhTitleColor);


const kButtonDecoration = BoxDecoration(
  borderRadius: BorderRadius.all(Radius.circular(5)),
);

const kInputDecoration = InputDecoration(
  hintStyle: TextStyle(color: HrmColors.fhBorderColorTextField),
  filled: true,
  fillColor: Colors.white70,
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8.0)),
    borderSide: BorderSide(color: HrmColors.fhBorderColorTextField, width: 1),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(6.0)),
    borderSide: BorderSide(color: HrmColors.fhBorderColorTextField, width: 1),
  ),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(5.0),
    borderSide: BorderSide(color: HrmColors.fhMainColor.withValues(alpha: 0.1)),
  );
}

final otpInputDecoration = InputDecoration(
  contentPadding: const EdgeInsets.symmetric(vertical: 5.0),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);
