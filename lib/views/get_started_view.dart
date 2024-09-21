import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_current_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/views/homepage.dart';

class GetStartedView extends StatelessWidget {
  const GetStartedView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Getweathercubit(),
      child: Scaffold(
        backgroundColor: const Color(0xff6347A6),
        body: Padding(
          padding: const EdgeInsets.only(top: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.,
            children: [
              Image.asset(
                'assets/images/sun-cloud.png',
                height: 250,
                width: 250,
              ),
              const SizedBox(
                height: 60,
              ),
              const Text(
                'Weather',
                style: TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'ForeCasts',
                style: TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                    color: Colors.yellowAccent),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                      color: Color(0xffDDB130),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const Homepage();
                        }));
                      },
                      child: const Center(
                          child: Text(
                        'Get Start',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
