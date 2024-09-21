import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_current_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/main.dart';

class Searchbody extends StatelessWidget {
  const Searchbody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: getcolortheme(
          BlocProvider.of<Getweathercubit>(context).weathermodel?.state),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Search a city',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/istockphoto-1158395759-1024x1024-removebg-preview.png',
            height: 300,
            width: 300,
            fit: BoxFit.fill,
          ),
          Center(
              child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              onSubmitted: (value) async {
                BlocProvider.of<Getweathercubit>(context)
                    .getweather(cityname: value);
                Navigator.pop(context);
              },
              autofocus: true,
              decoration:  InputDecoration(
                focusColor: Colors.amber,
                focusedBorder:  const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                labelText: 'Search',
                labelStyle: TextStyle(color: Colors.brown[900]),
                hintStyle: TextStyle(color:  Colors.brown[900]),
                suffix: Icon(
                  Icons.search,
                  color: Colors.brown[900],
                ),
                hintText: 'Enter City Name',
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
              ),
            ),
          )),
        ],
      ),
    );
  }
}
