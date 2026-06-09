import 'package:flutter/material.dart';
import 'package:lucky_beast_card_template_generator/i18n/strings.g.dart';
import 'package:lucky_beast_card_template_generator/internal/enum.dart';
import 'package:lucky_beast_card_template_generator/internal/platform/illustration_import.dart';

class AppModel extends ChangeNotifier {

  AppModel() : appLocale = LocaleSettings.currentLocale;

  AppLocale appLocale;
  int currentItemIndex = 0;

  SeasonType themeColorType = SeasonType.winter;
  ThemeMode themeMode = ThemeMode.light;

  Set<String> illustrationPaths = {};
  Map<String, String> illustrationNames = {};
  bool displayReferenceLine = false;

  String? importDirectoryPath;

  set updateCurrentItemIndex(int newIndex) {
    currentItemIndex = newIndex;
    notifyListeners();
  }

  void updateAppLocale(AppLocale newAppLocale) {
    LocaleSettings.setLocale(newAppLocale);
    appLocale = newAppLocale;
    notifyListeners();
  }

  set updateIllustrationPaths(Set<String> newillustrationPaths) {
    illustrationPaths = newillustrationPaths;
    illustrationNames = {
      for (final entry in illustrationNames.entries)
        if (newillustrationPaths.contains(entry.key)) entry.key: entry.value,
    };
    notifyListeners();
  }

  void addIllustrations(Map<String, String> newIllustrations) {
    illustrationPaths = {
      ...illustrationPaths,
      ...newIllustrations.keys,
    };
    illustrationNames = {
      ...illustrationNames,
      ...newIllustrations,
    };
    notifyListeners();
  }

  String illustrationDisplayName(String source) {
    return displayNameForIllustration(source, illustrationNames[source]);
  }

  set updateDisplayReferenceLineMode(bool newMode) {
    displayReferenceLine = newMode;
    notifyListeners();
  }

  set updateThemeColor(SeasonType newThemeColorType) {
    themeColorType = newThemeColorType;
    notifyListeners();
  }

  set updateThemeMode(ThemeMode newThemeMode) {
    themeMode = newThemeMode;
    notifyListeners();
  }

}
