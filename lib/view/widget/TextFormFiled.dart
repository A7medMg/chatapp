import 'package:flutter/material.dart';

class CustomTextFiled extends StatelessWidget {
  final String hintText;

  final IconData prefixIcon;
  final IconButton ? suffixIcon;
  final bool ? obscureText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
   CustomTextFiled({super.key,
     required this.hintText,
  required this.prefixIcon,

  required this.controller,
  required this.validator,  this.suffixIcon,  this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText??false,
      controller: controller,
      validator: validator,
      decoration: InputDecoration(

        hintText: hintText,

        hintStyle: TextStyle(
          color: Color(0xffA23603),

          fontFamily: "Regular",
        ),
        suffixIcon: suffixIcon,
        prefixIcon: Icon(prefixIcon,color: Color(0xffA23603),),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),

      ),
    );
  }
}
