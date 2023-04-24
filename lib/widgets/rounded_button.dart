import 'package:flutter/material.dart';

class RoundedButton extends StatefulWidget {
  final String buttonText;
  final VoidCallback onPressed;

  const RoundedButton(
      {super.key, required this.buttonText, required this.onPressed});

  @override
  State<RoundedButton> createState() => _RoundedButtonState();
}

class _RoundedButtonState extends State<RoundedButton> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0))),
      color: Theme.of(context).primaryColor,
      onPressed: widget.onPressed,
      padding: const EdgeInsets.all(16.0),
      child: Text(
        widget.buttonText,
        style: const TextStyle(fontSize: 18.0, color: Colors.white),
      ),
    );
  }
}
