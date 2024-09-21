import 'package:flutter/material.dart';
import 'package:weather_app/views/get_started_view.dart';
import 'package:weather_app/widgets/custom_splash_widgit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Simulate a delay before navigating to the next screen
    Future.delayed(const Duration(seconds: 4), () {
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const GetStartedView()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const CustomSplashWidget();
  }
}
