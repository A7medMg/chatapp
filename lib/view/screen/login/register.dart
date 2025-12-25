import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../data/webServices/data.dart';
import '../../widget/TextFormFiled.dart';
import '../../widget/customButton.dart';

class RegisterScreen extends StatefulWidget {
  static String id="register";

   RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController firstName=TextEditingController();

  TextEditingController lastName=TextEditingController();

  TextEditingController email=TextEditingController();

  TextEditingController password=TextEditingController();

  bool obscure=true;

  GlobalKey<FormState> formKey=GlobalKey<FormState>();

  @override
  void dispose() {
    firstName.dispose();
    lastName.dispose();
    email.dispose();
    password.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              const SizedBox(height: 40),
              Image.asset("assets/images/Classic.png"),
              Text("Register",style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Color(0xffA23603),
                fontFamily: "Regular")),
              const SizedBox(height: 80),
              Row(
                children: [
                  Expanded(
                    child: CustomTextFiled(hintText: 'First name', prefixIcon: Icons.person, controller: firstName, validator: (String? p1) {
                      if (p1!.isEmpty) {
                        return "First name is required";
                      }
                    },),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: CustomTextFiled(hintText: 'Last name', prefixIcon: Icons.person, controller: lastName, validator: (String? p1) {
                      if (p1!.isEmpty) {
                        return "Last name is required";
                      }
                    },),
                  )

                ],
              ),
              const SizedBox(height: 20),
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
              const SizedBox(height: 20),
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
                controller: password,
                obscureText: obscure,
                validator: (String? p1) {
                  if (p1!.isEmpty ) {
                    return "password is required";
                  }
                },
              ),

              const SizedBox(height: 70),
              CustomButton(text: "register", onPressed: ()async {
                if (formKey.currentState!.validate()) {
                  DataMethods().signUp(
                    email: email.text,
                    password: password.text,
                    context: context,
                  ) ;




                }
              }),
              const SizedBox(height: 20),




            ],
          ),
        ),
      ),
    );
  }
}
