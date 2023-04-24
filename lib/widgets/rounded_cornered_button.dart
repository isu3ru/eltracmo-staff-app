import 'package:flutter/material.dart';

import '../common/app_theme.dart';

class RoundedCorneredButton extends StatefulWidget {
  final String buttonText;
  final VoidCallback onPressed;
  final Icon? icon;
  final bool isDisabled;

  const RoundedCorneredButton(
      {super.key,
      required this.buttonText,
      required this.onPressed,
      this.icon,
      required this.isDisabled});

  @override
  State<RoundedCorneredButton> createState() => _RoundedCorneredButtonState();
}

class _RoundedCorneredButtonState extends State<RoundedCorneredButton> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(13.0),
        ),
      ),
      color: AppTheme.buttonColor,
      onPressed: (widget.isDisabled) ? null : widget.onPressed,
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 24.0),
      disabledColor: Colors.grey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            width: 8.0,
          ),
          Text(
            widget.buttonText,
            style: const TextStyle(
              fontSize: 20.0,
              color: Colors.white,
              height: 1.3,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
