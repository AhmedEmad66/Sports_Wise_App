import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sport_wise_app/Res/app_colors.dart';



class ThemeChangeHelper {
  Future<void> cashAppTheme(bool appTheme) async {
    final sharedPref = await SharedPreferences.getInstance();
    sharedPref.setBool("THEME", appTheme);
  }

  Future<bool> getCashedAppTheme() async {
    final sharedPref = await SharedPreferences.getInstance();
    var cashedAppTheme = sharedPref.getBool("THEME");
    cashedAppTheme = !cashedAppTheme!;
    return cashedAppTheme;
  }
}
