import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/deviceType.dart';
import 'package:weather_app/features/Weather/data/models/LatLang.dart';
import 'package:weather_app/features/Weather/data/models/WeatherInfo.dart';
import 'package:geocoding_resolver/geocoding_resolver.dart';
import 'package:weather_app/features/Weather/presentation/bloc/weather_bloc.dart';
import 'package:weather_app/features/Weather/presentation/bloc/weather_list_bloc.dart';
import 'package:weather_app/features/Weather/presentation/localized_provider.dart';
import 'package:weather_app/locales.dart';

class CardInfo extends StatefulWidget {
  final WeatherInfo? weatherInfo;
  const CardInfo({Key? key, required this.weatherInfo}) : super(key: key);

  @override
  _CardInfoState createState() => _CardInfoState();
}

class _CardInfoState extends State<CardInfo> {
  String? _sity;
  String? _country;
  Timer? _timer;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Consumer<LocaLizadeProvader>(builder: (context, value, child) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: DeviceType.fromResolution(width).isMobile
              ? BorderRadius.zero
              : BorderRadius.circular(10),
        ),
        margin: DeviceType.fromResolution(width).isMobile
            ? EdgeInsets.zero
            : const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              value.currentLocalization.today,
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              alignment: WrapAlignment.center,
              runAlignment: WrapAlignment.spaceBetween,
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white,
                  ),
                  margin: const EdgeInsets.only(top: 16, left: 16, right: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "${value.currentLocalization.cloud_cover}: ${(widget.weatherInfo!.clouds!.all!).toInt()}%",
                        style:
                            const TextStyle(fontSize: 30, color: Colors.black),
                      ),
                      Text(
                        "${value.currentLocalization.wind_speed}: ${(widget.weatherInfo!.wind!.speed!).toInt()}${value.currentLocalization.ms}",
                        style:
                            const TextStyle(fontSize: 30, color: Colors.black),
                      ),
                      Text(
                        "${value.currentLocalization.visibility}: ${widget.weatherInfo!.visibility! ~/ 1000}${value.currentLocalization.km}",
                        style:
                            const TextStyle(fontSize: 30, color: Colors.black),
                      ),
                      Text(
                        _timeFromUpdate(
                            widget.weatherInfo!.dt!, value.currentLocalization),
                        style:
                            const TextStyle(fontSize: 15, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.network(
                        height: 170,
                        width: 150,
                        fit: BoxFit.scaleDown,
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(
                              Icons.error,
                            ),
                        "https://openweathermap.org/img/wn/${widget.weatherInfo!.weather![0].icon}@4x.png"),
                    Text(
                      "${(widget.weatherInfo!.main!.temp! - 273.15).toInt()} °C",
                      style: const TextStyle(fontSize: 30, color: Colors.white),
                    ),
                    Text("${widget.weatherInfo!.weather![0].main}",
                        style:
                            const TextStyle(fontSize: 30, color: Colors.white)),
                    Text(
                        textAlign: TextAlign.center,
                        "${_sity != null ? "${_sity!}," : _sity} $_country",
                        style:
                            const TextStyle(fontSize: 30, color: Colors.white)),
                  ],
                ),
              ],
            )
          ],
        ),
      );
    });
  }

  String _dateParse() {
    final date =
        DateTime.fromMillisecondsSinceEpoch(widget.weatherInfo!.dt! * 1000);
    return " ${date.day > 9 ? date.day : "0${date.day}"}.${date.month > 9 ? date.month : "0${date.month}"}.${date.year} ${date.hour > 9 ? date.hour : "0${date.hour}"}:${date.minute > 9 ? date.minute : "0${date.minute}"}";
  }

  @override
  void initState() {
    super.initState();
    _getGeo(widget.weatherInfo);
    _timer ??= Timer.periodic(const Duration(minutes: 1), (timer) {
      setState(() {});
    });
  }

  _getGeo(WeatherInfo? weatherInfo) async {
    BlocProvider.of<WeatherBlocList>(context).add(WeatherGetEventList(
        latLang: LatLong(
            lat: widget.weatherInfo!.coord!.lat ?? 0,
            long: widget.weatherInfo!.coord!.lon ?? 0)));
    print("_getGeo ${weatherInfo?.coord?.lat}");
    GeoCoder geoCoder = GeoCoder();
    try {
      Address coordinates = await geoCoder.getAddressFromLatLng(
        latitude: weatherInfo!.coord!.lat ?? 0,
        longitude: weatherInfo!.coord!.lon ?? 0,
      );
      setState(() {
        _sity = coordinates.addressDetails.city;
        _country = coordinates.addressDetails.country;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    _timer = null;
    super.dispose();
  }

  String _timeFromUpdate(int time, ILocalizedValues value) {
    DateTime now = DateTime.now();
    Duration diff = now.difference(now);

    if (diff.inMinutes < 60) {
      return "${value.update} ${diff.inMinutes} ${value.minute}. ${value.back}";
    } else if (diff.inHours < 5) {
      return "${value.update} ${diff.inHours} ${value.hours} ${value.back}";
    } else {
      return _dateParse();
    }
  }
}
