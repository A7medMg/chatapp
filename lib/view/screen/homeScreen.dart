import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  static String id="home";

  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Chats" ,style: TextStyle(
          color: Color(0xffA23603),
          fontSize: 30,
          fontWeight: FontWeight.bold,
          fontFamily: "Regular",
        ),),
      ),
    );
  }
}
