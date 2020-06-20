import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget appBar_Home(){
  return Container(
    width: double.infinity,
    height: 50,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: CircleAvatar(
            radius: 20,
            backgroundImage:AssetImage("assets/logo2.png"),
          ),
        ),
        SizedBox(width: 10,),
        Text("Workout Go",style: GoogleFonts.ubuntu(fontSize: 28,fontWeight: FontWeight.bold,color: Colors.white),),
      ],
    ),
  );
}