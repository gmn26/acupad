import 'package:acupad/controller/preferences_controller.dart';
import 'package:acupad/pages/home.dart';
import 'package:acupad/services/notification_services.dart';
import 'package:acupad/utils/preferences_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workmanager/workmanager.dart';

@pragma('vm:entry-point') // Mandatory if the App is obfuscated or using Flutter 3.1+
void callbackDispatcher() {
  Workmanager().executeTask((taskName, inputData) async {
    final preferencesController = Get.put(PreferencesController());
    print("Periodic Task berjalan: $taskName");

    // Ambil nilai dari SharedPreferences
    bool checkedIn = await preferencesController.status.value;
    print("Status 'checked_in': $checkedIn");

    if (checkedIn == true) {
      await NotificationServices.showNotification();
      print("Notifikasi ditampilkan karena 'checked_in' bernilai true.");
    } else {
      print("Tugas di-skip karena 'checked_in' bernilai false atau null.");
    }

    return Future.value(true); // Indikasi sukses
  });
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync(() => PreferencesUtils().init());
  await NotificationServices.initialize();

  Workmanager().initialize(
      callbackDispatcher, // The top level function, aka callbackDispatcher
      isInDebugMode: true // If enabled it will post a notification whenever the task is running. Handy for debugging tasks
  );
  Workmanager().registerPeriodicTask(
    "preiodic-notif",
    "periodicNotif",
    frequency: Duration(minutes: 15),
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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
