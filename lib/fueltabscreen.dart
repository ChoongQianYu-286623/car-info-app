import 'package:car_buddy/cartabscreen.dart';
import 'package:car_buddy/profiletabscreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FuelTabScreen extends StatefulWidget {
  const FuelTabScreen({super.key});

  @override
  State<FuelTabScreen> createState() => _FuelTabScreenState();
}

class _FuelTabScreenState extends State<FuelTabScreen> {
  late List<Widget> tabchildren;
  int _currentIndex = 1;
  String maintitle = "Fuel";

  @override
  void initState(){
    super.initState();
    // print(widget.user.name);
    // print("Buyer");
    
  }

  @override
  void dispose(){
    super.dispose();
    print("dispose");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(54, 48, 98, 1),
        title: Text("Fuel Consumption",
        style: GoogleFonts.comfortaa(
          fontWeight: FontWeight.bold))),
      body: Center(
        child: Text(
          maintitle
        )
        ),
    );
  }

  
}