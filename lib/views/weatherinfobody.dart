import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/models/weathermodel.dart';
import 'package:weather_app/views/searchbody.dart';

// ignore: must_be_immutable
class Weatherinfobody extends StatelessWidget {
  Weatherinfobody({super.key, required this.weathermodel,required this.days});
  Weathermodel weathermodel;
  List<Weathermodel2>? days;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${weathermodel.cityname} Weather',
              style: const TextStyle(color: Colors.white),
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
              child: const Padding(
                padding: EdgeInsets.only(right: 10.0),
                child: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          getcolortheme(weathermodel.state),
          getcolortheme(weathermodel.state)[300]!,
          getcolortheme(weathermodel.state)[50]!,
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              
              children: [
                CachedNetworkImage(
                  fit: BoxFit.fill,
                  width: 250,
                  height: 250,
                  imageUrl: 'https:${weathermodel.imagepath}',
                  placeholder: (context, url) =>
                     const Center(child:  CircularProgressIndicator()),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  'Avg : ${weathermodel.avgtemp.round()}',
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  'updated at ${weathermodel.date.hour}:${weathermodel.date.minute}',
                  style: const TextStyle(fontSize: 25, color: Colors.black54),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  '${weathermodel.state}',
                  style: const TextStyle(
                      fontSize: 27,
                      color: Colors.black87,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'maxTemp: ${weathermodel.maxtemp.round()}',
                      style: const TextStyle(
                          fontSize: 20,
                          color: Colors.black54,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'minTemp: ${weathermodel.mintemp.round()}',
                      style: const TextStyle(
                          fontSize: 20,
                          color: Colors.black54,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
               const  Padding(
                  padding:  EdgeInsets.only(left: 25.0),
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      
                     Text('3-Days Forecasts',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
                const SizedBox(height: 20,),
                Container(
                  decoration: const BoxDecoration(),
                  height: 170,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount:days!.length ,
                    itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 10.0,left: 20),
                      child: Container(
                        padding: const  EdgeInsets.all(15),
                        decoration: const BoxDecoration(color: Colors.amberAccent,borderRadius: BorderRadius.all(Radius.circular(25))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('Day: ${days![index].day}'),
                             Text('maxTemp: ${days![index].maxtemp2}'),
                             
                            CachedNetworkImage(
                              fit: BoxFit.fill,
                              width: 70,
                              height:70,
                              imageUrl:
                                  'https:${days![index].imageurl}',
                              placeholder: (context, url) =>
                                  const CircularProgressIndicator(),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                             Text('minTemp: ${days![index].mintemp2}'),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
