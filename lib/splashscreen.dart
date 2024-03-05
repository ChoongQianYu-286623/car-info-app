import 'dart:async';
import 'package:car_buddy/loginscreen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
  super.initState();
  Timer(
  const Duration(seconds: 5),
  () => Navigator.pushReplacement(context,
  MaterialPageRoute(builder: (content) =>  const LoginScreen())));
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/splash.png'),
                  fit: BoxFit.cover))),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 50, 0, 20),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                            CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                            "Version 1.0",
                            style: TextStyle(
                            fontSize: 10,
                            color: Colors.white,
                            fontWeight: FontWeight.w100),
                            )
                            ],
                                ),
                            )
        ],
      ),
    );
  }
}