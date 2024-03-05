import 'package:car_buddy/addcarscreen.dart';
import 'package:car_buddy/fueltabscreen.dart';
import 'package:car_buddy/profiletabscreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CarTabScreen extends StatefulWidget {
  const CarTabScreen({super.key});

  @override
  State<CarTabScreen> createState() => _CarTabScreenState();
}

class _CarTabScreenState extends State<CarTabScreen> {
  late List<Widget> tabchildren;
  int _currentIndex = 0;
  String maintitle = "Car";

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
        title: Text("CarBuddy",
        style: GoogleFonts.comfortaa(
          fontWeight: FontWeight.bold))),
      body: Center(
        child: Text("You haven't add a car",
      style: GoogleFonts.comfortaa(
          fontWeight: FontWeight.bold,
          color: Colors.grey),)
  
  ),
  
  floatingActionButton: FloatingActionButton(
    onPressed: () {
      Navigator.push(context,
              MaterialPageRoute(builder: (content)=> const AddCarScreen()));
    },
    mouseCursor: MaterialStateMouseCursor.clickable,
    tooltip: 'Register Car',
    hoverElevation: 10,
    backgroundColor: const Color.fromRGBO(249, 148, 23, 1),
    child: const Icon(Icons.add),
  ),
  floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  
}