import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_current_weather_cubit/get_current_weather_states.dart';
import 'package:weather_app/cubits/get_current_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/views/splash_screen_view.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Getweathercubit(),
      child: const Custommaterialappwidget(),
    );
  }
}

class Custommaterialappwidget extends StatelessWidget {
  const Custommaterialappwidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Getweathercubit, Weatherstate>(
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            
            iconTheme: const IconThemeData(color: Colors.white),
            primaryColor:getcolortheme(BlocProvider.of<Getweathercubit>(context).weathermodel?.state) ,
            primaryColorDark: getcolortheme (BlocProvider.of<Getweathercubit>(context).weathermodel?.state),
            primaryColorLight: getcolortheme(BlocProvider.of<Getweathercubit>(context).weathermodel?.state),
            appBarTheme: AppBarTheme(color:getcolortheme(BlocProvider.of<Getweathercubit>(context).weathermodel?.state) ),
            primarySwatch: getcolortheme(BlocProvider.of<Getweathercubit>(context).weathermodel?.state),
            useMaterial3: true,
          ),
          home: const SplashScreen(),
        );
      },
    );
  }
}

MaterialColor getcolortheme(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }
  switch (condition) {
    case "Sunny":
      return Colors.deepOrange;
    case "Partly cloudy":
    case "Patchy light drizzle":
    case "Light drizzle":
    case "Patchy light rain":
    case "Light rain":
    case "Light rain shower":
      return Colors.lightBlue;
    case "Cloudy":
    case "Overcast":
    case "Mist":
    case "Fog":
    case "Freezing fog":
      return Colors.grey;
    case "Patchy rain possible":
    case "Moderate rain at times":
    case "Moderate rain":
    case "Heavy rain at times":
    case "Heavy rain":
    case "Moderate or heavy rain shower":
    case "Torrential rain shower":
    case "Patchy light rain with thunder":
    case "Moderate or heavy rain with thunder":
      return Colors.blue;
    case "Patchy snow possible":
    case "Patchy moderate snow":
    case "Light snow":
    case "Patchy light snow":
    case "Moderate snow":
    case "Patchy heavy snow":
    case "Heavy snow":
    case "Moderate or heavy snow showers":
    case "Patchy light snow with thunder":
    case "Moderate or heavy snow with thunder":
      return Colors.cyan;
    case "Patchy sleet possible":
    case "Light sleet":
    case "Light sleet showers":
    case "Moderate or heavy sleet":
    case "Moderate or heavy sleet showers":
      return Colors.lightGreen;
    case "Patchy freezing drizzle possible":
    case "Freezing drizzle":
    case "Light freezing rain":
    case "Heavy freezing drizzle":
    case "Moderate or heavy freezing rain":
      return Colors.lightBlue;
    case "Thundery outbreaks possible":
    case "Blowing snow":
    case "Blizzard":
      return Colors.cyan;
    case "Ice pellets":
    case "Light showers of ice pellets":
    case "Moderate or heavy showers of ice pellets":
      return Colors.brown;
    case "Light snow showers":
      return Colors.pink;
    default:
      return Colors.blue; // Default color
  }
}
