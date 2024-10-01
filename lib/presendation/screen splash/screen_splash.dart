import 'package:flutter/material.dart';
import 'package:restaurant_kot/consts/colors.dart';
import 'dart:async';

import 'package:restaurant_kot/presendation/screen%20home/screen_home.dart';
import 'package:restaurant_kot/presendation/screen%20login/login.dart';  // For using the Timer function

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    
    // Navigate to HomeScreen after 3 seconds
    Timer(const Duration(seconds: 4), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const ScreenLogin()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: mainclr,  // Splash screen background color
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
           
            Text(
              'Restaurant KOT',  // Splash screen title
              style: TextStyle(
                fontSize: 24.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}