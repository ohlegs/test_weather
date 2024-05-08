import 'package:flutter/material.dart';
import 'package:weather_app/features/Weather/data/models/WeatherInfoList.dart';

class WeatherListItem extends StatelessWidget {
  final WeatherInfoElement weatherInfo;
  const WeatherListItem({super.key, required this.weatherInfo});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      color: Colors.red,
      height: 150,
      width: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
              height: 50,
              width: 50,
              fit: BoxFit.scaleDown,
              errorBuilder: (context, error, stackTrace) => const Icon(
                    Icons.error,
                  ),
              "https://openweathermap.org/img/wn/${weatherInfo.weather![0].icon}@2x.png"),
          Text(weatherInfo.weather![0].description!),
          Text("${(weatherInfo.main!.temp! - 273.15).toInt()} °C"),
          Text(_dateParse(weatherInfo.dtTxt)),
        ],
      ),
    );
  }

  String _dateParse(String? dtTxt) {
    if (dtTxt != null) {
      final date = DateTime.parse(dtTxt);
      return " ${date.day > 9 ? date.day : "0${date.day}"}.${date.month > 9 ? date.month : "0${date.month}"}.${date.year} ${date.hour > 9 ? date.hour : "0${date.hour}"}:${date.minute > 9 ? date.minute : "0${date.minute}"}";
    }
    return '';
  }
}
