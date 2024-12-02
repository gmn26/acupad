import 'package:acupad/component/check_in_button.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "09:00",
                style: TextStyle(
                  fontSize: 108.0,
                ),
              ),
              Text(
                "Good Morning, Ghazy!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 60.0),
              CheckInButton(),
            ],
          ),
        ),
      ),
    );
  }
}
