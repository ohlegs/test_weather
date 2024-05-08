import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/Weather/presentation/bloc/weather_bloc.dart';
import 'package:weather_app/features/Weather/presentation/bloc/weather_list_bloc.dart';
import 'package:weather_app/features/Weather/presentation/widgets/weather_list_item.dart';

class ListWearther extends StatefulWidget {
  const ListWearther({Key? key}) : super(key: key);

  @override
  _ListWeartherState createState() => _ListWeartherState();
}

class _ListWeartherState extends State<ListWearther> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBlocList, WeatherState>(
      builder: (context, state) => state is WeatherLoadedList
          ? Expanded(
              child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.weatherInfo?.list!.length,
              itemBuilder: (context, index) =>
                  WeatherListItem(weatherInfo: state.weatherInfo!.list![index]),
            ))
          : const SizedBox.shrink(),
    );
  }
}
