import 'package:shared_preferences/shared_preferences.dart';

const USER_THEME_OPTION = "USER_THEME_OPTION";

class SettingsRepository {
  static Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  static Future<int> getUserThemeOption() async {
    return (await prefs).getInt(USER_THEME_OPTION) ?? 0;
  }

  static Future<void> setUserThemeOption(int option) async {
    (await prefs).setInt(USER_THEME_OPTION, option);
    return;
  }
}
