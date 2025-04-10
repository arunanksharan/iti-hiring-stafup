import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:stafup/feature/authentication/presentation/enter_number.dart';
import 'package:stafup/feature/bottom_navigation.dart';
import 'fh_colors.dart';
import 'fh_constant.dart';
import 'logger.dart';

String generateMd5(String input) {
  return md5.convert(utf8.encode(input)).toString();
}

NumberFormat rupeeFormat = NumberFormat.currency(
  locale: 'en_IN',
  symbol: '₹',
  decimalDigits: 0,
);

String formatDate(String dateStr) {
  // Parse the date string into a DateTime object
  final DateTime dateTime = DateTime.parse(dateStr);

  // Format the DateTime object into the desired format
  final DateFormat formatter = DateFormat('dd/MM/yyyy');
  final String formattedDate = formatter.format(dateTime);

  return formattedDate;
}

String? formatDateTimeString(String? dateTimeString) {
  if (dateTimeString == null) {
    return null;
  }

  try {
    final DateTime dateTime = DateTime.parse(dateTimeString);

    return DateFormat('dd MMM, yyyy', 'en_US').format(dateTime);
  } catch (e) {
    AppLoggerHelper.error('formatDateTimeString $e');
    if (kDebugMode) {
      print('Error parsing date: $e');
    }
    return null;
  }
}

//function to convert time

TimeOfDay? parseTimeOfDay(String timeString) {
  final regex = RegExp(r'(\d+):(\d+)\s*(AM|PM)', caseSensitive: false);
  final match = regex.firstMatch(timeString);

  if (match != null) {
    int hour = int.parse(match.group(1)!);
    final int minute = int.parse(match.group(2)!);
    final String period = match.group(3)!.toUpperCase();

    if (period == 'PM' && hour != 12) {
      hour += 12;
    } else if (period == 'AM' && hour == 12) {
      hour = 0;
    }

    return TimeOfDay(hour: hour, minute: minute);
  } else {
    return null;
  }
}

String greeting() {
  final hour = DateTime.now().hour;
  if (hour < 12) {
    return tr('good_morning');
  } else if (hour < 17) {
    return tr('good_afternoon');
  } else if (hour < 21) {
    return tr('good_evening');
  } else {
    return tr('good_night');
  }
}

String? formatDateTime(String? datetime) {
  try {
    final DateTime parsedDateTime = DateTime.parse(datetime!);
    final String formattedTime = DateFormat(
      'hh:mm a',
    ).format(parsedDateTime.toLocal());
    return formattedTime;
  } catch (e) {
    AppLoggerHelper.error(e.toString());
    return null;
  }
}

final currentDate = DateTime.now();

DateTime getDateQuarter(int year, int month, int day) {
  return DateTime.utc(year, month, day);
}

bool isLeapYear(int year) {
  if (year % 4 == 0) {
    if (year % 100 == 0) {
      if (year % 400 == 0) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  } else {
    return false;
  }
}

class GlobalFunction {
  bool validateMobileNumber(String value) {
    const String pattern = r'(^(?:[+0]9)?[0-9]{10,15}$)';
    final RegExp regExp = RegExp(pattern);
    if (value.length < 8) {
      return false;
    } else if (!regExp.hasMatch(value)) {
      return false;
    } else {
      return true;
    }
  }

  bool validateEmail(String value) {
    const String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    final RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return false;
    } else {
      return true;
    }
  }

  bool validateIFSC(String value) {
    const String pattern = r'^[A-Z]{4}[0][A-Z0-9]{6}$';
    final RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return false;
    } else {
      return true;
    }
  }

  bool isAdult(String birthDateString) {
    const String datePattern = 'dd-MM-yyyy';

    // Current time - at this moment
    final DateTime today = DateTime.now();

    // Parsed date to check
    final DateTime birthDate = DateFormat(datePattern).parse(birthDateString);

    // Date to check but moved 18 years ahead
    final DateTime adultDate = DateTime(
      birthDate.year + 18,
      birthDate.month,
      birthDate.day,
    );

    return adultDate.isBefore(today);
  }

  String ageCalculate(String birthDateString) {
    const String datePattern = 'dd-MM-yyyy';
    // Current time - at this moment
    final DateTime today = DateFormat(
      datePattern,
    ).parse(DateTime.now().toString());
    // Parsed date to check
    final DateTime birthDate = DateFormat(datePattern).parse(birthDateString);

    final String year = (today.year - birthDate.year).toString();
    final String month = (today.month - birthDate.month).abs().toString();

    return '$year year, $month months';
  }

  static disabledWalkThrough(
    BuildContext context, [
    String? initialRoute,
  ]) async {
    if (getBoolAsync(isLoggedIn) && getStringAsync(companyId) != '') {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => BottomNavigation()),
        (Route<dynamic> route) => false,
      );
    } else {
      EnterNumber().launch(context);
    }
  }

  // Alert with multiple and custom buttons
  onAlertButtonsPressed(context) {
    AlertBox(
      context: context,
      type: AlertDialogType.warning,
      title: 'RFLUTTER ALERT',
      desc: 'Flutter is more awesome with RFlutter Alert.',
      buttons: [
        DialogButton(
          onPressed:
              () => Navigator.of(context, rootNavigator: true).pop('dialog'),
          color: const Color.fromRGBO(0, 179, 134, 1),
          child: const Text(
            'FLAT',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        DialogButton(
          onPressed:
              () => Navigator.of(context, rootNavigator: true).pop('dialog'),
          gradient: const LinearGradient(
            colors: [
              Color.fromRGBO(116, 116, 191, 1),
              Color.fromRGBO(52, 138, 199, 1),
            ],
          ),
          child: const Text(
            'GRADIENT',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ],
    ).show();
  }

  actionDialog(
    BuildContext context,
    String orderId,
    String dealId,
    String status,
    String text,
    String title,
  ) {
    final TextEditingController controller = TextEditingController();
    openDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          title: Text(title, style: const TextStyle(fontSize: 18)),
          content: SizedBox(
            height: 190,
            child: Column(
              children: [
                Text(
                  'Are you sure! you want to $text this deal?',
                  style: TextStyle(
                    fontSize: 13,
                    color: black.withValues(alpha: 0.7),
                  ),
                ),
                if (text == 'reject')
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.grey[100]!),
                      ),
                    ),
                    height: 150,
                    child: TextFormField(
                      textCapitalization: TextCapitalization.words,
                      controller: controller,
                      textAlignVertical: TextAlignVertical.bottom,
                      maxLines: 5,
                      style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                      decoration: InputDecoration(
                        fillColor: Colors.grey[100],
                        filled: true,
                        hintText: 'Remark!',
                        focusedBorder: UnderlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(5),
                          ),
                          borderSide: BorderSide(color: Colors.grey[200]!),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(5),
                          ),
                          borderSide: BorderSide(color: Colors.grey[200]!),
                        ),
                      ),
                    ),
                  )
                else
                  Container(),
              ],
            ),
          ),
          actions: [
            MaterialButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Cancel',
                style: boldTextStyle(color: HrmColors.fhTitleColor),
              ),
            ),
            MaterialButton(
              onPressed: () {
                if (text == 'reject' && controller.text.isEmpty) {
                  toast("Remark field can't be empty!");
                } else {
                  finishScreen(Navigator.of(context));
                }
              },
              child: Text(
                'Submit',
                style: boldTextStyle(color: HrmColors.fhTitleColor),
              ),
            ),
          ],
        );
      },
    );
  }

  static bool setData(var token) {
    setValue(apiAuthToken, token);
    setValue(isLoggedIn, true);
    return true;
  }

  static bool adminLogout() {
    removeKey(apiAuthToken);
    setValue(isLoggedIn, false);

    toast('Successfully Logged Out!!!');
    return true;
  }

  staffLogout(BuildContext context) {
    toast('Successfully Logged Out!!!');
    GlobalFunction.disabledWalkThrough(context);
  }

  String removeDecimalZeroFormat(double v) {
    final NumberFormat formatter = NumberFormat();
    formatter.minimumFractionDigits = 0;
    formatter.maximumFractionDigits = 2;
    return formatter.format(v);
  }

  String formatTime(int timeNum) {
    return timeNum < 10 ? '0$timeNum' : timeNum.toString();
  }

  static Map<String, String> setHeader() {
    final Map<String, String> header = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Access-Control-Allow-Origin': '*',
      'Authorization': 'Bearer ${getStringAsync(apiAuthToken)}',
    };
    return header;
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}

class LowerCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    return TextEditingValue(
      text: newValue.text.toLowerCase(),
      selection: newValue.selection,
    );
  }
}

finishScreen(NavigatorState navigator) {
  if (navigator.canPop()) {
    navigator.pop(false);
  }
}

String extractMessageFromException(Object e) {
  return e.toString().replaceFirst('Exception: ', '');
}

String customFormatTime(String time) {
  try {
    final parsedTime = DateFormat('HH:mm').parse(time);
    final formattedTime = DateFormat('hh:mm a').format(parsedTime);
    return formattedTime;
  } catch (e) {
    AppLoggerHelper.error(e.toString());
    return time;
  }
}

String customDateTimeFormat(String date) {
  final dateTime = DateFormat('dd MMM, yyyy', 'en-US').parse(date);
  return DateFormat('dd-MM-yyyy').format(dateTime);
}

String customDateFormat(String dateString) {
  if (dateString.isNotEmpty) {
    final formatter = DateFormat('dd MMM, yyyy', 'en-US');
    final parsedDate = formatter.parse(dateString);
    final formattedDate = DateFormat('yyyy-MM-dd').format(parsedDate);
    return formattedDate;
  }
  return '';
}

String customTimeFormatApi(String time) {
  final dateTime = DateFormat.jm().parse(time.toLowerCase());
  return DateFormat('HH:mm:ss').format(dateTime);
}

String getDuration({required String inTime, required String outTime}) {
  final time1 = DateFormat('h:mm a').parse(inTime.toLowerCase());
  final time2 = DateFormat('h:mm a').parse(outTime.toLowerCase());

  final Duration difference = time2.difference(time1);

  return '${difference.inHours}:${difference.inMinutes.remainder(60)}:00';
}

String customTimeConverter(String timeString) {
  final List<String> parts = timeString.split(':');
  final int hours = int.parse(parts[0]);
  final int minutes = int.parse(parts[1]);

  String result = hours >= 1 ? '$hours hour${hours > 1 ? 's' : ''}' : '';
  if (minutes > 0) {
    result += minutes >= 1 ? ' $minutes minute${minutes > 1 ? 's' : ''}' : '';
  }

  return result;
}

Widget advanceInfoRow({
  required String label,
  required String value,
  required IconData icon,
  required Color textColor,
  required Color labelColor,
}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Icon(icon, color: Colors.grey, size: 20),
      const SizedBox(width: 8),
      Expanded(
        child: RichText(
          text: TextSpan(
            style: TextStyle(fontSize: 14, color: textColor),
            children: [
              TextSpan(
                text: '$label ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: labelColor,
                ),
              ),
              TextSpan(
                text: value,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}

DateTime convertToDateTime(String? dateString) {
  if (dateString == null || dateString.isEmpty) {
    throw const FormatException('Date string is empty or null');
  }

  try {
    final DateFormat formatter = DateFormat('dd MMM, yyyy', 'en_US');
    return formatter.parse(dateString);
  } catch (e) {
    AppLoggerHelper.error(e.toString());
    throw FormatException('Error parsing date string: $dateString', e);
  }
}

String formatTimeToString(TimeOfDay timeOfDay) {
  final String hour = timeOfDay.hourOfPeriod.toString().padLeft(2, '0');
  final String minute = timeOfDay.minute.toString().padLeft(2, '0');
  final String period = timeOfDay.period == DayPeriod.am ? 'AM' : 'PM';
  return '$hour:$minute $period';
}
