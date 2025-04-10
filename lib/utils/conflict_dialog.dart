import 'package:flutter/material.dart';

class ConflictDialog extends StatelessWidget {
  final String title;
  final String content;
  final VoidCallback onOkPressed;

  const ConflictDialog({
    super.key,
    required this.title,
    required this.content,
    required this.onOkPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: <Widget>[
        TextButton(
          onPressed: onOkPressed,
          child: const Text('OK'),
        ),
      ],
    );
  }
}
