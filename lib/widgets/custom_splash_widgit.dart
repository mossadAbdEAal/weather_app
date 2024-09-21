import 'package:flutter/material.dart';

class CustomSplashWidget extends StatelessWidget{
  const CustomSplashWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff6347A6),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset('assets/images/FocusArea__Weather-02-removebg-preview.png',width: 250,height: 250,),


            ),
            const  SizedBox(height: 20,),
            Text('Weather App',style: TextStyle(color: Colors.amber[700],fontWeight: FontWeight.bold,fontSize: 30),)
          ],
        ),
      )
    );
  }

}