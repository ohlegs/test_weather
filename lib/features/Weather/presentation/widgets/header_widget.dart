import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/enum.dart';
import 'package:weather_app/features/Weather/presentation/bloc/weather_bloc.dart';
import 'package:weather_app/features/Weather/presentation/localized_provider.dart';
import 'package:weather_app/locales.dart';

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({super.key});

  @override
  _HeaderWidgetState createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  String dropdownValue = 'User Location';
  late LocaLizadeProvader _locaLizadeProvader;
  bool _checkInit = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<LocaLizadeProvader>(
      builder: (context, value, child) => Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        width: double.infinity,
        color: const Color(0xFFe96b4b),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 150,
              width: 250,
              child: DropdownButtonFormField(
                dropdownColor: Colors.white,
                value: dropdownValue,
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                  });
                },
                items: <String>[
                  "User Location",
                  "Minsk",
                  "Moscow",
                  "London",
                  "New York"
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    onTap: () {
                      _getWeather(context, value);
                    },
                    value: value,
                    child: Text(
                      value,
                      style: const TextStyle(fontSize: 15),
                    ),
                  );
                }).toList(),
              ),
            ),
            _checkInit
                ? GestureDetector(
                    onTap: () {},
                    child: ElevatedButton(
                      onPressed: () {
                        if (_locaLizadeProvader.currentLocalization
                            is EnglishLocalizedValues) {
                          print("EnglishLocalizedValues");
                          _locaLizadeProvader.setCurrentLocalization(
                              Localization.russianLocalizedValues);
                        } else {
                          print("RussianLocalizedValues");
                          _locaLizadeProvader.setCurrentLocalization(
                              Localization.englishLocalizedValues);
                        }
                      },
                      child: Text(_locaLizadeProvader.currentLocalization
                              is EnglishLocalizedValues
                          ? "EN"
                          : "RU"),
                    ))
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        _checkInit = true;
      });
      _locaLizadeProvader =
          Provider.of<LocaLizadeProvader>(context, listen: false);
      _locaLizadeProvader
          .setCurrentLocalization(Localization.englishLocalizedValues);
    });
  }

  _getWeather(BuildContext context, value) async {
    switch (value) {
      case "Minsk":
        BlocProvider.of<WeatherBloc>(context).add(
            WeatherGetEvent(latLang: await WeatherLocationType.minsk.position));
        break;
      case "Moscow":
        BlocProvider.of<WeatherBloc>(context).add(WeatherGetEvent(
            latLang: await WeatherLocationType.moscow.position));
        break;
      case "London":
        BlocProvider.of<WeatherBloc>(context).add(WeatherGetEvent(
            latLang: await WeatherLocationType.london.position));
        break;
      case "New York":
        BlocProvider.of<WeatherBloc>(context).add(WeatherGetEvent(
            latLang: await WeatherLocationType.newYork.position));
        break;
      case "User Location":
        BlocProvider.of<WeatherBloc>(context).add(WeatherGetEvent(
            latLang: await WeatherLocationType.userPosition.position));
        break;
    }
  }
}
