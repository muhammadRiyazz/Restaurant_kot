import 'package:flutter/material.dart';

import 'presendation/screen splash/screen_splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Removes the debug banner
      title: 'Kot',
      theme: ThemeData(
        primaryColor: const Color.fromRGBO(17, 55, 127, 1), // Set RGBA color
                fontFamily: 'Montserrat',  // Apply Montserrat font globally

      ),
      home: const SplashScreen(), // Start with the splash screen
    );
  }
}
