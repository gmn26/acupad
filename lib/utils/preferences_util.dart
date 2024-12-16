import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesUtils extends GetxService {
  late SharedPreferences _preferences;

  Future<PreferencesUtils> init() async {
    _preferences = await SharedPreferences.getInstance();
    return this;
  }

  bool? getCheckedIn() => _preferences.getBool('checked_in');
  String? getCheckInTime() => _preferences.getString('checked_in_time');
  String? getLastNotif() => _preferences.getString('last_notif');
  String? getNextNotif() => _preferences.getString('next_notif');

  Future<bool> setCheckedIn(bool checkedIn) =>
      _preferences.setBool('checked_in', checkedIn);
  Future<bool> setCheckedInTime(String checkedInTime) =>
      _preferences.setString('checked_in_time', checkedInTime);
  Future<bool> setLastNotif(String lastNotif) =>
      _preferences.setString('last_notif', lastNotif);
  Future<bool> setNextNotif(String nextNotif) =>
      _preferences.setString('next_notif', nextNotif);
}
