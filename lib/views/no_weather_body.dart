// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:weather_app/views/searchbody.dart';

class Noweatherbody extends StatelessWidget {
  const Noweatherbody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'The Weather',
                style: TextStyle(color: Colors.white),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const Searchbody();
                      },
                    ),
                  );
                },
                child: const Icon(
                  Icons.search,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        body: const Padding(
          padding: EdgeInsets.all(35.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'There is no weather 😔 start',
                style: TextStyle(color: Colors.black, fontSize: 25),
              ),
              Text(
                'searching now 🔍',
                style: TextStyle(color: Colors.black, fontSize: 25),
              ),
            ],
          ),
        ),
      );
  }
}
