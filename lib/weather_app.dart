import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/features/Weather/presentation/bloc/weather_bloc.dart';
import 'package:weather_app/features/Weather/presentation/bloc/weather_list_bloc.dart';
import 'package:weather_app/features/Weather/presentation/localized_provider.dart';
import 'package:weather_app/features/Weather/presentation/pages/main_screen.dart';

class WeatherApp extends StatefulWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  _WeatherAppState createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => WeatherBloc(),
          ),
          BlocProvider(
            create: (context) => WeatherBlocList(),
          ),
          ChangeNotifierProvider(
            create: (context) => LocaLizadeProvader(),
          ),
        ],
        child: const MainScreen(),
      ),
    );
  }
}
