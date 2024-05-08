abstract class ILocalizedValues {
  String get cloud_cover;
  String get wind_speed;
  String get visibility;
  String get today;
  List<String> get cities;
  String get ms;
  String get km;
  String get update;
  String get minute;
  String get back;
  String get hours;
}

class RussianLocalizedValues implements ILocalizedValues {
  @override
  List<String> get cities =>
      ["Моё местопложение" "Минск", "Москва", "Лондон", "Нью-Йорк"];

  @override
  String get cloud_cover => "Облачность";

  @override
  String get today => "Сегодня";

  @override
  String get visibility => "Видимость";

  @override
  String get wind_speed => "Скорость ветра";

  @override
  String get back => "Назад";

  @override
  String get km => "км";

  @override
  String get minute => "мин";

  @override
  String get ms => "м/с";

  @override
  String get update => "Обновлено";

  @override
  // TODO: implement hours
  String get hours => "часов";
}

class EnglishLocalizedValues implements ILocalizedValues {
  @override
  List<String> get cities =>
      ["My position", "Minsk", "Moscow", "London", "New York"];

  @override
  String get cloud_cover => "Cloud cover";

  @override
  String get today => "Today";

  @override
  String get visibility => "Visibility";

  @override
  String get wind_speed => "Wind speed";

  @override
  String get back => "Back";

  @override
  String get km => "km";

  @override
  String get minute => "min";

  @override
  String get ms => "m/s";

  @override
  String get update => "Updated";

  @override
  // TODO: implement hours
  String get hours => "hours";
}
