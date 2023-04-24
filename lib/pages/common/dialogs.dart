import 'package:eltracmo_staff/common/app_theme.dart';
import 'package:flutter/material.dart';

class Dialogs {
  static Widget getConfirmDialog(
    BuildContext context,
    String title,
    String text,
    String confirmButton,
    VoidCallback onConfirm, {
    String? cancelButton,
    VoidCallback? onCancel,
  }) {
    return AlertDialog(
      title: Text(
        title,
        style: TextStyle(
            fontSize: 21.0,
            color: AppTheme.primaryColor,
            fontWeight: FontWeight.bold),
      ),
      content: SizedBox(
        width: 300.0,
        child: Text(text),
      ),
      actions: [
        TextButton(
          onPressed: () {
            if (null == onCancel) {
              Navigator.of(context).pop();
            } else {
              onCancel();
            }
          },
          child: Text(
            (cancelButton ?? 'Cancel'),
            style: const TextStyle(
              fontSize: 16.0,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            onConfirm();
          },
          child: Text(
            confirmButton,
            style: const TextStyle(
              fontSize: 16.0,
            ),
          ),
        ),
      ],
    );
  }

  static Widget getAlertDialog(
    BuildContext context,
    String title,
    String text, {
    String? buttonText,
    VoidCallback? onConfirm,
  }) {
    return AlertDialog(
      title: Text(
        title,
        style: TextStyle(
            fontSize: 21.0,
            color: AppTheme.primaryColor,
            fontWeight: FontWeight.bold),
      ),
      content: SizedBox(
        width: 300.0,
        child: Text(text),
      ),
      actions: [
        TextButton(
          onPressed: () {
            if (null == onConfirm) {
              Navigator.of(context).pop();
            } else {
              onConfirm();
            }
          },
          child: Text(
            (buttonText ?? 'OK'),
            style: const TextStyle(
              fontSize: 16.0,
            ),
          ),
        ),
      ],
    );
  }
}
