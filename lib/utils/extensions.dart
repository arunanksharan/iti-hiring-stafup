import 'package:flutter/material.dart';

extension WidgetExtensions on Widget {
  /// Navigate to widget
  Future<T?> launch<T>(BuildContext context, {bool isNewTask = false}) async {
    if (isNewTask) {
      return await Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => this),
        (route) => false,
      );
    } else {
      return await Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => this),
      );
    }
  }
}

extension StringExtensions on String {
  /// Show toast message
  void toast() {
    // Implement your toast logic here or use a library like fluttertoast
    debugPrint('Toast: $this');
  }
}
