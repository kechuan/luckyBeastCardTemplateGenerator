import 'package:flutter/foundation.dart';
import 'package:lucky_beast_card_template_generator/i18n/strings.g.dart';

class NavigationPanelModel extends ChangeNotifier {

  NavigationPanelModel({
    this.appLocale = AppLocale.zhCn
  });

  AppLocale appLocale;
  int currentItemIndex = 0;

  bool navOpenedStatus = true;


  void setCurrentItemIndex(int newIndex) {
    currentItemIndex = newIndex;
    notifyListeners();
  }

  void setAppLocale(AppLocale newAppLocale) {
    appLocale = newAppLocale;
    notifyListeners();
  }


}