import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // a scaffold with loading spinner in the center
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Column(
            children: [
              Image.asset(
                'assets/images/eltracmo_logo.png',
                width: 200.0,
                height: 100.0,
              ),
              const SizedBox(
                height: 32.0,
              ),
              const Text(
                'Loading, please wait...',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w300,
                ),
              ),
              const SizedBox(
                height: 32.0,
              ),
              const CircularProgressIndicator(),
            ],
          ),
        ),
      ],
    ));
  }
}
