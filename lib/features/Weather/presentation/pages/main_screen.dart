import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/Weather/presentation/bloc/weather_bloc.dart';
import 'package:weather_app/features/Weather/presentation/widgets/ListWearther.dart';
import 'package:weather_app/features/Weather/presentation/widgets/card_info.dart';
import 'package:weather_app/features/Weather/presentation/widgets/header_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        return SafeArea(
            child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 27, 27, 27),
          appBar: const PreferredSize(
            preferredSize: Size.fromHeight(70.0),
            child: HeaderWidget(),
          ),
          body: Column(
            children: [
              Container(
                child: state is WeatherLoaded
                    ? CardInfo(weatherInfo: state.weatherInfo)
                    : const Center(
                        child: CircularProgressIndicator(
                        color: Colors.amber,
                      )),
              ),
              const ListWearther()
            ],
          ),
        ));
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _initLoad();
  }

  _initLoad() {
    BlocProvider.of<WeatherBloc>(context).add(WeatherInitialEvent());
  }
}
