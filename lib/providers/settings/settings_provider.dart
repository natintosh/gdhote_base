import 'package:flutter/material.dart';
import 'package:gdhote/services/settings_service.dart';
import 'package:gdhote/utils/helpers/types_helper.dart';

class SettingsProvider extends ChangeNotifier {
  ThemeOptionType _optionType = ThemeOptionType.LIGHT;
  Future<ThemeOptionType> _themeOption;

  Future<ThemeOptionType> getUserThemeOption() async {
    _themeOption = SettingsService.getThemeOption();
    this.themeOption = await _themeOption;

    return _themeOption;
  }

  void setUserThemeOption(ThemeOptionType themeOption) async {
    await SettingsService.setThemeOption(themeOption);
    notifyListeners();
  }

  ThemeOptionType get themeOption {
    return _optionType;
  }

  set themeOption(ThemeOptionType themeOption) {
    setUserThemeOption(themeOption);
    _optionType = themeOption;
  }
}
