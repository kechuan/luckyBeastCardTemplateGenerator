import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lucky_beast_card_template_generator/i18n/strings.g.dart';
import 'package:lucky_beast_card_template_generator/internal/const.dart';
import 'package:lucky_beast_card_template_generator/internal/enum.dart';

class AppModel extends ChangeNotifier {

  AppModel();

  //AppLocale appLocale;
  int currentItemIndex = 0;

  SeasonType themeColorType = SeasonType.autumn;
  ThemeMode themeMode = ThemeMode.light;

  Set<String> illustrationPaths = {};
  bool displayReferenceLine = false;

  String? importDirectoryPath;

  set updateCurrentItemIndex(int newIndex) {
    currentItemIndex = newIndex;
    notifyListeners();
  }

  void updateAppLocale(AppLocale newAppLocale) {
    LocaleSettings.setLocale(newAppLocale);
    notifyListeners();
  }

  set updateIllustrationPaths(Set<String> newillustrationPaths) {
    illustrationPaths = newillustrationPaths;
    notifyListeners();
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

  Set<String> handleImportIllustration(String path) {

    Set<String> importPath = {};

    FileSystemEntityType fileType = FileSystemEntity.typeSync(path);

    

    if (fileType == FileSystemEntityType.file) {
      String extension = path.split('.').last.toLowerCase();
      if (kIllustrationType.contains(extension)) {
        importPath.add(path);
      }

    }

    else {

      final List<FileSystemEntity> entities = Directory(path).listSync();

      for (var entity in entities) {
        if (entity is File) {
          String extension = entity.path.split('.').last.toLowerCase();
          if (kIllustrationType.contains(extension)) {
            importPath.add(entity.path);
          }
        }

        else {
          importPath.addAll(handleImportIllustration(entity.path));
        }
      }
    }

    return importPath;

  }

}
