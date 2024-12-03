import 'dart:developer';

import 'package:acupad/utils/preferences_util.dart';
import 'package:get/get.dart';

class PreferencesController extends GetxController {
  final PreferencesUtils _preferencesUtils = Get.find();
  var status = false.obs;

  @override
  void onInit() {
    super.onInit();
    _loadStatus();
  }

  Future<void> _loadStatus() async {
    status.value = _preferencesUtils.getCheckedIn() ?? false;
  }

  Future<void> changeStatus(bool status) async {
    try {
      await _preferencesUtils.setCheckedIn(status);
      await _loadStatus();
    } catch (error) {
      log("Error updating status: $error");
    }
  }
}
