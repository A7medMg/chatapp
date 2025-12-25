import 'package:chatapp/view/screen/homeScreen.dart';
import 'package:chatapp/view/screen/login/register.dart';
import 'package:flutter/material.dart';

import '../../../data/webServices/data.dart';
import '../../widget/TextFormFiled.dart';
import '../../widget/customButton.dart';

class LoginScreen extends StatefulWidget {
  static String id = "login";

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool obscure = true;
  TextEditingController passWord = TextEditingController();
  TextEditingController email = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 140),
            Image.asset("assets/images/Classic.png"),
            const SizedBox(height: 90),
            Center(
              child: const Text(
                "Welcome back",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  fontFamily: "Regular",
                  color: Color(0xffA23603),
                ),
              ),
            ),
            const  SizedBox(height: 100),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    CustomTextFiled(
                      hintText: 'email',
                      prefixIcon: Icons.email,
                      controller: email,
                      validator: (String? p1) {
                        if (p1!.isEmpty ||
                            !p1.contains("@") ||
                            !p1.contains(".") ) {
                          return "email is required";
                        }
                      },
                    ),
                    const SizedBox(height: 50),
                    CustomTextFiled(
                      hintText: 'password',
                      prefixIcon: Icons.lock,
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            obscure = !obscure;
                          });
                        },
                        icon: Icon(
                          obscure ? Icons.visibility : Icons.visibility_off,
                          color: Color(0xffA23603),
                        ),
                      ),
                      controller: passWord,
                      obscureText: obscure,
                      validator: (String? p1) {
                        if (p1!.isEmpty ) {
                          return "password is required";
                        }
                      },
                    ),

                    const SizedBox(height: 70),
                    CustomButton(text: "Login", onPressed: () {
                      if (formKey.currentState!.validate()) {
                      DataMethods().signIn(
                        email: email.text,
                        password: passWord.text,
                        context: context, );

                      }

                    }),
                    const SizedBox(height: 20),
                    TextButton(onPressed: (){
                      Navigator.pushNamed(context, RegisterScreen.id);
                    }, child: Text("New user? Create an account",style: TextStyle(
                      color: Color(0xffA23603),
                      fontSize: 16,
                      fontFamily: "Regular",
                    ),))


                  ],
                ),
              ),
            ),




          ],
        ),
      ),
    );
  }
}
