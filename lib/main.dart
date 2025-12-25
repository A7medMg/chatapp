import 'package:chatapp/spalshScreen.dart';
import 'package:chatapp/view/screen/homeScreen.dart';
import 'package:chatapp/view/screen/login/loginScreen.dart';
import 'package:chatapp/view/screen/login/register.dart';
import 'package:chatapp/view/screen/onBording/onBording.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        SpalshScreen.id:(context)=> SpalshScreen(),
        OnbordingScreen.id:(context)=>const OnbordingScreen(),
        LoginScreen.id:(context)=>const LoginScreen(),
        RegisterScreen.id:(context)=> RegisterScreen(),
        Homescreen.id:(context)=> Homescreen(),
      },
      initialRoute: SpalshScreen.id,


    );
  }
}

