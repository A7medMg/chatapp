
import 'package:chatapp/data/models/messageModel.dart';
import 'package:flutter/material.dart';

class CustomChatItem extends StatelessWidget {
  const CustomChatItem({super.key, required this.messageModel});
final MessageModel messageModel;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(

        margin: EdgeInsets.symmetric(vertical: 6,horizontal: 16),

        padding: EdgeInsets.only(left: 20,top: 20,bottom: 20,right: 20),
        decoration: BoxDecoration(


            color: Color(0xffA23603),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32),
                bottomRight: Radius.circular(32)
            )

        ),
        child: Text(messageModel.message,style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          fontFamily: "cairo",
        ),),
      ),
    );
  }
}
