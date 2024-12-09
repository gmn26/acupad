import 'package:acupad/controller/preferences_controller.dart';
import 'package:acupad/services/notification_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckInButton extends StatefulWidget {
  const CheckInButton({super.key});

  @override
  State<CheckInButton> createState() => _CheckInButtonState();
}

class _CheckInButtonState extends State<CheckInButton> {
  final preferencesController = Get.put(PreferencesController());

  void _changeStatus(PreferencesController controller) async {
    try {
      await NotificationServices.showNotification();
    } catch (e) {
      print(e);
    }
    // Toggle the status in the controller
    await controller.changeStatus(!controller.status.value);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return GestureDetector(
        onTap: () => _changeStatus(preferencesController),
        child: CircleAvatar(
          radius: 90.0,
          backgroundColor:
              preferencesController.status.value ? Colors.green : Colors.red,
          foregroundColor: Colors.white,
          child: Icon(
            preferencesController.status.value
                ? Icons.alarm_on
                : Icons.alarm_off,
            size: 90.0,
          ),
        ),
      );
    });
  }
}
