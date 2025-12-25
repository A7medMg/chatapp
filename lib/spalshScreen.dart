import 'dart:async';

import 'package:chatapp/view/screen/homeScreen.dart';
import 'package:chatapp/view/screen/onBording/onBording.dart';
import 'package:flutter/material.dart';

import 'data/webServices/cache.dart';

class SpalshScreen extends StatefulWidget {
  static String id='/';
  const SpalshScreen({super.key});

  @override
  State<SpalshScreen> createState() => _SpalshScreenState();
}

class _SpalshScreenState extends State<SpalshScreen> {

  @override

  void initState() {
   Timer( Duration(
       seconds: 4

   ),() async {

     await CacheHelper.isLoggedIn()?Navigator.pushReplacementNamed(context, Homescreen.id):Navigator.pushReplacementNamed(context, OnbordingScreen.id);

   });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset("assets/images/Classic.png"),
            ),
          ],
        )


    );
  }
}
