import 'package:flutter/material.dart';

class CheckInButton extends StatefulWidget {
  const CheckInButton({super.key});

  @override
  State<CheckInButton> createState() => _CheckInButtonState();
}

class _CheckInButtonState extends State<CheckInButton> {
  var _checkedIn = false;

  void _changeStatus() {
    setState(() {
      _checkedIn = !_checkedIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _changeStatus,
      child: CircleAvatar(
        radius: 90.0,
        backgroundColor: _checkedIn ? Colors.green : Colors.red,
        foregroundColor: Colors.white,
        child: Icon(
          _checkedIn ? Icons.alarm_on : Icons.alarm_off,
          size: 90.0,
        ),
      ),
    );
  }
}
