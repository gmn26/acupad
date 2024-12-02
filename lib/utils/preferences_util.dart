import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesUtils extends GetxService {
  late SharedPreferences _preferences;

  Future<PreferencesUtils> init() async {
    _preferences = await SharedPreferences.getInstance();
    return this;
  }

  bool? getCheckedIn() => _preferences.getBool('checked_in');

  Future<bool> setCheckedIn(bool checkedIn) =>
      _preferences.setBool('checked_in', checkedIn);
}
