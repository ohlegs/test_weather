// To parse this JSON data, do
//
//     final weatherInfoList = weatherInfoListFromMap(jsonString);

import 'dart:convert';

WeatherInfoList weatherInfoListFromMap(String str) =>
    WeatherInfoList.fromMap(json.decode(str));

String weatherInfoListToMap(WeatherInfoList data) => json.encode(data.toMap());

class WeatherInfoList {
  String? cod;
  int? message;
  int? cnt;
  List<WeatherInfoElement>? list;
  City? city;

  WeatherInfoList({
    this.cod,
    this.message,
    this.cnt,
    this.list,
    this.city,
  });

  factory WeatherInfoList.fromMap(Map<String, dynamic> json) => WeatherInfoList(
        cod: json["cod"],
        message: json["message"],
        cnt: json["cnt"],
        list: json["list"] == null
            ? []
            : List<WeatherInfoElement>.from(
                json["list"]!.map((x) => WeatherInfoElement.fromMap(x))),
        city: json["city"] == null ? null : City.fromMap(json["city"]),
      );

  Map<String, dynamic> toMap() => {
        "cod": cod,
        "message": message,
        "cnt": cnt,
        "list":
            list == null ? [] : List<dynamic>.from(list!.map((x) => x.toMap())),
        "city": city?.toMap(),
      };
}

class City {
  int? id;
  String? name;
  Coord? coord;
  String? country;
  int? population;
  int? timezone;
  int? sunrise;
  int? sunset;

  City({
    this.id,
    this.name,
    this.coord,
    this.country,
    this.population,
    this.timezone,
    this.sunrise,
    this.sunset,
  });

  factory City.fromMap(Map<String, dynamic> json) => City(
        id: json["id"],
        name: json["name"],
        coord: json["coord"] == null ? null : Coord.fromMap(json["coord"]),
        country: json["country"],
        population: json["population"],
        timezone: json["timezone"],
        sunrise: json["sunrise"],
        sunset: json["sunset"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "coord": coord?.toMap(),
        "country": country,
        "population": population,
        "timezone": timezone,
        "sunrise": sunrise,
        "sunset": sunset,
      };
}

class Coord {
  double? lat;
  double? lon;

  Coord({
    this.lat,
    this.lon,
  });

  factory Coord.fromMap(Map<String, dynamic> json) => Coord(
        lat: json["lat"]?.toDouble(),
        lon: json["lon"]?.toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "lat": lat,
        "lon": lon,
      };
}

class WeatherInfoElement {
  int? dt;
  Main? main;
  List<Weather>? weather;
  Clouds? clouds;
  Wind? wind;
  int? visibility;
  double? pop;
  Rain? rain;
  Sys? sys;
  String? dtTxt;

  WeatherInfoElement({
    this.dt,
    this.main,
    this.weather,
    this.clouds,
    this.wind,
    this.visibility,
    this.pop,
    this.rain,
    this.sys,
    this.dtTxt,
  });

  factory WeatherInfoElement.fromMap(Map<String, dynamic> json) =>
      WeatherInfoElement(
        dt: json["dt"],
        main: json["main"] == null ? null : Main.fromMap(json["main"]),
        weather: json["weather"] == null
            ? []
            : List<Weather>.from(
                json["weather"]!.map((x) => Weather.fromMap(x))),
        clouds: json["clouds"] == null ? null : Clouds.fromMap(json["clouds"]),
        wind: json["wind"] == null ? null : Wind.fromMap(json["wind"]),
        visibility: json["visibility"],
        pop: json["pop"]?.toDouble(),
        rain: json["rain"] == null ? null : Rain.fromMap(json["rain"]),
        sys: json["sys"] == null ? null : Sys.fromMap(json["sys"]),
        dtTxt: json["dt_txt"],
      );

  Map<String, dynamic> toMap() => {
        "dt": dt,
        "main": main?.toMap(),
        "weather": weather == null
            ? []
            : List<dynamic>.from(weather!.map((x) => x.toMap())),
        "clouds": clouds?.toMap(),
        "wind": wind?.toMap(),
        "visibility": visibility,
        "pop": pop,
        "rain": rain?.toMap(),
        "sys": sys?.toMap(),
        "dt_txt": dtTxt,
      };
}

class Clouds {
  int? all;

  Clouds({
    this.all,
  });

  factory Clouds.fromMap(Map<String, dynamic> json) => Clouds(
        all: json["all"],
      );

  Map<String, dynamic> toMap() => {
        "all": all,
      };
}

class Main {
  double? temp;
  double? feelsLike;
  double? tempMin;
  double? tempMax;
  int? pressure;
  int? seaLevel;
  int? grndLevel;
  int? humidity;
  double? tempKf;

  Main({
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.seaLevel,
    this.grndLevel,
    this.humidity,
    this.tempKf,
  });

  factory Main.fromMap(Map<String, dynamic> json) => Main(
        temp: json["temp"]?.toDouble(),
        feelsLike: json["feels_like"]?.toDouble(),
        tempMin: json["temp_min"]?.toDouble(),
        tempMax: json["temp_max"]?.toDouble(),
        pressure: json["pressure"],
        seaLevel: json["sea_level"],
        grndLevel: json["grnd_level"],
        humidity: json["humidity"],
        tempKf: json["temp_kf"]?.toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "temp": temp,
        "feels_like": feelsLike,
        "temp_min": tempMin,
        "temp_max": tempMax,
        "pressure": pressure,
        "sea_level": seaLevel,
        "grnd_level": grndLevel,
        "humidity": humidity,
        "temp_kf": tempKf,
      };
}

class Rain {
  double? the1H;

  Rain({
    this.the1H,
  });

  factory Rain.fromMap(Map<String, dynamic> json) => Rain(
        the1H: json["1h"]?.toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "1h": the1H,
      };
}

class Sys {
  String? pod;

  Sys({
    this.pod,
  });

  factory Sys.fromMap(Map<String, dynamic> json) => Sys(
        pod: json["pod"],
      );

  Map<String, dynamic> toMap() => {
        "pod": pod,
      };
}

class Weather {
  int? id;
  String? main;
  String? description;
  String? icon;

  Weather({
    this.id,
    this.main,
    this.description,
    this.icon,
  });

  factory Weather.fromMap(Map<String, dynamic> json) => Weather(
        id: json["id"],
        main: json["main"],
        description: json["description"],
        icon: json["icon"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "main": main,
        "description": description,
        "icon": icon,
      };
}

class Wind {
  double? speed;
  int? deg;
  double? gust;

  Wind({
    this.speed,
    this.deg,
    this.gust,
  });

  factory Wind.fromMap(Map<String, dynamic> json) => Wind(
        speed: json["speed"]?.toDouble(),
        deg: json["deg"],
        gust: json["gust"]?.toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "speed": speed,
        "deg": deg,
        "gust": gust,
      };
}
