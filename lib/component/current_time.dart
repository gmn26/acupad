import 'package:flutter/material.dart';
import 'dart:async';

class CurrentTimeWidget extends StatefulWidget {
  const CurrentTimeWidget({super.key});

  @override
  CurrentTimeWidgetState createState() => CurrentTimeWidgetState();
}

class CurrentTimeWidgetState extends State<CurrentTimeWidget> {
  String _currentTime = "";
  String _currentHour = "";
  String _greeting = "";

  @override
  void initState() {
    super.initState();
    _updateTime(); // Start updating time
  }

  void _updateTime() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {
          _currentHour = DateTime.now()
              .toLocal()
              .toString()
              .substring(11, 13); // hour only
          if (int.parse(_currentHour) >= 0 && int.parse(_currentHour) < 4) {
            _greeting = "Selamat Malam";
          } else if (int.parse(_currentHour) >= 4 &&
              int.parse(_currentHour) < 6) {
            _greeting = "Selamat Subuh";
          } else if (int.parse(_currentHour) >= 6 &&
              int.parse(_currentHour) < 11) {
            _greeting = "Selamat Pagi";
          } else if (int.parse(_currentHour) >= 11 &&
              int.parse(_currentHour) < 15) {
            _greeting = "Selamat Siang";
          } else if (int.parse(_currentHour) >= 15 &&
              int.parse(_currentHour) < 18) {
            _greeting = "Selamat Sore";
          } else if (int.parse(_currentHour) >= 18 &&
              int.parse(_currentHour) < 19) {
            _greeting = "Selamat Petang";
          } else {
            _greeting = "Selamat Malam";
          }
          _currentTime =
              DateTime.now().toLocal().toString().substring(11, 19); // HH:mm:ss
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          _greeting,
          style: const TextStyle(
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Text(
          _currentTime,
          style: const TextStyle(
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
