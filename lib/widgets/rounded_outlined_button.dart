import 'package:flutter/material.dart';

import '../common/app_theme.dart';

class RoundedOutlinedButton extends StatefulWidget {
  final String buttonText;
  final VoidCallback onPressed;
  final Icon? icon;
  final bool isDisabled;

  const RoundedOutlinedButton(
      {super.key,
      required this.buttonText,
      required this.onPressed,
      this.icon,
      required this.isDisabled});

  @override
  State<RoundedOutlinedButton> createState() => _RoundedOutlinedButtonState();
}

class _RoundedOutlinedButtonState extends State<RoundedOutlinedButton> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        // add border color
        side: BorderSide(color: AppTheme.buttonColor),
        borderRadius: const BorderRadius.all(
          Radius.circular(13.0),
        ),
      ),
      color: Colors.white,
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
            style: TextStyle(
              fontSize: 20.0,
              color: AppTheme.buttonColor,
              height: 1.3,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
