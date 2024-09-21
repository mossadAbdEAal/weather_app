import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_current_weather_cubit/get_current_weather_states.dart';
import 'package:weather_app/cubits/get_current_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/views/error_view.dart';
import 'package:weather_app/views/no_weather_body.dart';
import 'package:weather_app/views/weatherinfobody.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Getweathercubit, Weatherstate>(
      builder: (context, state) {
        if (state is Initialstate) {
          return const Noweatherbody();
        } else if (state is Weatherloadedstate) {
          return Weatherinfobody(
            weathermodel: state.weathermodel,
            days: state.weathermodel2,
          );
        }
        else if(state is Weatherloadingstate){
          return  Scaffold(
            backgroundColor: getcolortheme(BlocProvider.of<Getweathercubit>(context).weathermodel?.state) ,
            body:const  Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Center(child: CircularProgressIndicator()),
                 SizedBox(height: 50,),
                 Text('Weather data is loading',style: TextStyle(color: Colors.amberAccent,fontSize: 25),),
              ],
            ) ,) ;

        } else {
          return const ErrorView();
        }
      },
    );
  }
}
