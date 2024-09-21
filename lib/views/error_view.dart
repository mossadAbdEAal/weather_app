import 'package:flutter/material.dart';
import 'package:weather_app/views/searchbody.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: Container(
              padding: const EdgeInsets.all(10),
              height: 300,
              width: 300,
              decoration: const BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.all(Radius.circular(25))),
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/1000_F_95834632_CL4kevuB3WZLoX72MB52KTLJqx4qhvQj-removebg-preview.png',
                    height: 90,
                    width: 90,
                  ),
                  const Text(
                    'oops there is an error,',
                    style: TextStyle(color: Colors.amber, fontSize: 25),
                  ),
                  const Text(
                    'try later',
                    style: TextStyle(color: Colors.amber, fontSize: 25),
                  ),
                ],
              )),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
                color: Colors.lightGreen,
                borderRadius: BorderRadius.all(Radius.circular(25))),
            child: TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const Searchbody();
                  }));
                },
                child: const Text('search again')),
          ),
        ],
      ),
    );
  }
}
