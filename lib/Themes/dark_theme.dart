import 'package:shared_preferences/shared_preferences.dart';



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
