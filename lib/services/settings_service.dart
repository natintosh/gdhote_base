import 'package:gdhote/repositories/settings_respository.dart';
import 'package:gdhote/utils/helpers/types_helper.dart';

class SettingsService {
  static Future<ThemeOptionType> getThemeOption() async {
    final option = await SettingsRepository.getUserThemeOption();

    return option == 0
        ? ThemeOptionType.LIGHT
        : option == 1 ? ThemeOptionType.DARK : ThemeOptionType.SYSTEM;
  }

  static Future<void> setThemeOption(ThemeOptionType optionType) async {
    final option = ThemeOptionType.values.indexOf(optionType);
    return SettingsRepository.setUserThemeOption(option);
  }
}
