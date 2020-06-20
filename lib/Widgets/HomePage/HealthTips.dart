import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:workout/screens/bottom_card_1.dart';


Widget HealthTips(context,String bottomtitle){
  return Container(
    height: 200,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Home_BottomCardSwipe()));
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Color(0xFF200122),Color(0xFF6f0000)])
              ),
              child: Center(
                child: Text(
                  bottomtitle!=null?bottomtitle:"",
                  style: GoogleFonts.ubuntu(fontSize: 30,fontWeight: FontWeight.w900,color:Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}