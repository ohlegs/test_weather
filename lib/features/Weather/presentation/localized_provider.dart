import 'package:flutter/material.dart';
import 'package:weather_app/enum.dart';
import 'package:weather_app/locales.dart';

class LocaLizadeProvader extends ChangeNotifier {
  ILocalizedValues currentLocalization = RussianLocalizedValues();

  setCurrentLocalization(Localization localization) {
    if (localization == Localization.englishLocalizedValues) {
      currentLocalization = EnglishLocalizedValues();
    }
    if (localization == Localization.russianLocalizedValues) {
      currentLocalization = RussianLocalizedValues();
    }
    notifyListeners();
  }
}
