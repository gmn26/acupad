import 'dart:developer';

import 'package:acupad/utils/preferences_util.dart';
import 'package:get/get.dart';

class PreferencesController extends GetxController {
  final PreferencesUtils _preferencesUtils = Get.find();
  var status = false.obs;
  var checkInTime = ''.obs;
  var lastNotif = ''.obs;
  var nextNotif = ''.obs;

  @override
  void onInit() {
    super.onInit();
    _loadStatus();
  }

  Future<void> _loadStatus() async {
    status.value = _preferencesUtils.getCheckedIn() ?? false;
    checkInTime.value = _preferencesUtils.getCheckInTime() ?? "-";
    lastNotif.value = _preferencesUtils.getLastNotif() ?? "-";
    nextNotif.value = _preferencesUtils.getNextNotif() ?? "-";
  }

  Future<void> changeStatus(bool status) async {
    try {
      await _preferencesUtils.setCheckedIn(status);
      bool? stat = await _preferencesUtils.getCheckedIn() ?? false;
      if(stat){
        await _preferencesUtils.setCheckedInTime("${DateTime.now().hour}:${DateTime.now().minute}");
        await _preferencesUtils.setLastNotif("${DateTime.now().hour}:${DateTime.now().minute}");
        await _preferencesUtils.setNextNotif("${DateTime.now().hour+2}:${DateTime.now().minute}");
      }else{
        await _preferencesUtils.setNextNotif("-");
      }
      await _loadStatus();
    } catch (error) {
      log("Error updating status: $error");
    }
  }

  Future<void> notifRunning() async {
    try {
      await _preferencesUtils.setLastNotif("${DateTime.now().hour}:${DateTime.now().minute}");
      await _preferencesUtils.setNextNotif("${DateTime.now().hour+2}:${DateTime.now().minute}");
    } catch(error) {
      log("Error updating status: $error");
    }
  }
}
