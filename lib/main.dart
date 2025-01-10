import 'package:acupad/pages/home.dart';
// import 'package:acupad/pages/login.dart';
import 'package:acupad/services/notification_services.dart';
import 'package:acupad/utils/preferences_util.dart';
import 'package:acupad/utils/time_format_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workmanager/workmanager.dart';

@pragma(
    'vm:entry-point') // Mandatory if the App is obfuscated or using Flutter 3.1+
void callbackDispatcher() {
  Workmanager().executeTask((taskName, inputData) async {
    try {
      // Inisialisasi SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      bool? checkedIn = prefs.getBool('checked_in') ?? false;

      if (checkedIn) {
        // Jalankan notifikasi jika 'checked_in' bernilai true
        try {
          await NotificationServices.showNotification();
          await prefs.setString(
              'last_notif',
              TimeFormatUtils.formatTime(
                  "${DateTime.now().hour}:${DateTime.now().minute}"));
          await prefs.setString(
              'next_notif',
              TimeFormatUtils.formatTime(
                  "${DateTime.now().hour}:${DateTime.now().minute}",
                  addTwoHours: true));
        } catch (e) {
          debugPrint("Error saat menampilkan notifikasi: $e");
        }
      } else {
        debugPrint(
            "Tugas di-skip karena 'checked_in' bernilai false atau null.");
      }

      return Future.value(true);
    } catch (e) {
      debugPrint("Error dalam callbackDispatcher: $e");
      return Future.value(false);
    }
  });
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync(() => PreferencesUtils().init());
  await NotificationServices.initialize();

  Workmanager().initialize(
      callbackDispatcher, // The top level function, aka callbackDispatcher
      isInDebugMode:
          false // If enabled it will post a notification whenever the task is running. Handy for debugging tasks
      );

  Workmanager().registerPeriodicTask(
    "periodic-notif",
    "periodicNotif",
    frequency: const Duration(hours: 2),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Acupad',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF182843),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
