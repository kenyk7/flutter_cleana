import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeCtrl extends GetxController {
  late SharedPreferences prefs;
  // ThemeMode _themeMode = ThemeMode.system;
  // ThemeMode get themeMode => _themeMode;

  var isDarkMode = false.obs;

  @override
  onReady() {
    getThemeModeFromPreferences();
    super.onReady();
  }

  Future<void> setThemeMode(ThemeMode themeMode) async {
    Get.changeThemeMode(themeMode);
    // _themeMode = themeMode;
    isDarkMode.value = themeMode == ThemeMode.dark;
    prefs = await SharedPreferences.getInstance();
    await prefs.setString('theme', themeMode.toString().split('.')[1]);
  }

  getThemeModeFromPreferences() async {
    ThemeMode tm;
    prefs = await SharedPreferences.getInstance();
    String themeText = prefs.getString('theme') ?? 'system';
    try {
      tm = ThemeMode.values.firstWhere((e) => describeEnum(e) == themeText);
    } catch (e) {
      tm = ThemeMode.system;
    }
    setThemeMode(tm);
  }
}
