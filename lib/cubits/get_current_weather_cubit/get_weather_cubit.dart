import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_current_weather_cubit/get_current_weather_states.dart';
import 'package:weather_app/models/weathermodel.dart';
import 'package:weather_app/services/getweather.dart';

class Getweathercubit extends Cubit<Weatherstate> {
  Getweathercubit() : super(Initialstate());
  Weathermodel? weathermodel;
  List<Weathermodel2>? weathermodel2;

  getweather({required String cityname}) async {
    try {
       emit(Weatherloadingstate());
       weathermodel = await Getweather().getcurrentweather(cityname);
       weathermodel2 = (await Getweather().getforecastdays(cityname));

      emit(Weatherloadedstate(weathermodel: weathermodel!, weathermodel2: weathermodel2!));
    } catch (e) {
      emit(Weatherfaliurestate());
    }
  }
}
