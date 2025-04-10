import 'package:flutter/material.dart';
import 'package:stafup/utils/fh_colors.dart';

enum AlertDialogType { success, error, warning, info }

class AlertBox extends StatelessWidget {
  final String title;
  final String message;
  final AlertDialogType type;
  final List<Widget> buttons;

  const AlertBox({
    Key? key,
    required this.title,
    required this.message,
    this.type = AlertDialogType.info,
    required this.buttons,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color _getHeaderColor() {
      switch (type) {
        case AlertDialogType.success:
          return Colors.green;
        case AlertDialogType.error:
          return Colors.red;
        case AlertDialogType.warning:
          return Colors.orange;
        case AlertDialogType.info:
          return Colors.blue;
      }
    }

    IconData _getIcon() {
      switch (type) {
        case AlertDialogType.success:
          return Icons.check_circle;
        case AlertDialogType.error:
          return Icons.error;
        case AlertDialogType.warning:
          return Icons.warning;
        case AlertDialogType.info:
          return Icons.info;
      }
    }

    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      title: Row(
        children: [
          Icon(_getIcon(), color: _getHeaderColor()),
          const SizedBox(width: 8),
          Text(title),
        ],
      ),
      content: Text(message),
      actions: buttons,
    );
  }
}

class DialogButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? color;
  final bool isPrimary;

  const DialogButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.color,
    this.isPrimary = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isPrimary
        ? ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: color ?? HrmColors.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            child: Text(
              text,
              style: const TextStyle(color: Colors.white),
            ),
          )
        : TextButton(
            onPressed: onPressed,
            child: Text(
              text,
              style: TextStyle(color: color ?? Colors.grey),
            ),
          );
  }
}

/// Function to show a dialog
void openDialog(
  BuildContext context, {
  required Widget content,
  bool barrierDismissible = true,
}) {
  showDialog(
    context: context,
    barrierDismissible: barrierDismissible,
    builder: (BuildContext context) {
      return content;
    },
  );
}

/// Toast message
void toast(String message) {
  debugPrint('Toast: $message');
  // In a real app, you'd use a toast library here
}

/// Text styles
TextStyle boldTextStyle({
  Color? color,
  double? size,
  FontWeight weight = FontWeight.bold,
}) {
  return TextStyle(
    color: color ?? Colors.black,
    fontWeight: weight,
    fontSize: size ?? 16,
  );
}
