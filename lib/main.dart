import 'package:flutter/material.dart';
import 'package:car_buddy/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'CarBuddy',
      theme: ThemeData(
        // primarySwatch: Colors.indigo,
      ),
      home: const SplashScreen(),
    );
  }
}
