import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getflutter/components/card/gf_card.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:workout/screens/category/body_part_exercise.dart';
import 'package:workout/screens/category/experience.dart';
import 'package:workout/screens/category/meditation.dart';
import 'package:workout/screens/category/yoga.dart';


Widget categoryCard(){
  return GFCard(
    color: Colors.white24,
    height: 50.0,
    content: Align(
      alignment: Alignment.centerLeft,
      child: Text(
        "Choose Your Category",
        style: GoogleFonts.breeSerif(
            fontSize: 25, fontWeight: FontWeight.bold,color: Colors.white),
      ),
    ),
  );
}


Widget CategoryHomeCard(BuildContext context){
  return Container(
      height: 160,
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        SizedBox(width: 5,),
        ReusableCategoryCard(categoryName: "Exercise by\nBody Part",color: LinearGradient(colors: [Colors.deepOrange,Colors.orange]),
        screen: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>Body_Part_Exercise())),),
        SizedBox(width: 10,),
        ReusableCategoryCard(categoryName: "Exercise by\nExperience",color: LinearGradient(colors: [Colors.deepPurple,Colors.purple]),
          screen: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>Experience())),
        ),
        SizedBox(width: 10,),
        ReusableCategoryCard(categoryName: "Yoga",color: LinearGradient(colors: [Color(0xFF642B73),Color(0xFFC6426E)]),
          screen: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>Yoga())),
        ),
        SizedBox(width: 10,),
        ReusableCategoryCard(categoryName: "Meditation",color: LinearGradient(colors: [Color(0xFF159957),Color(0xFF155799)]),
          screen: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>Meditation())),
        ),
        SizedBox(width: 5,)
      ],
    )
  );
}

class ReusableCategoryCard extends StatelessWidget {
  String categoryName;
  LinearGradient color;
  Function screen;

  ReusableCategoryCard({@required this.categoryName,@required this.color,@required this.screen});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:screen,
      child: Container(
        width: 130,
        decoration: BoxDecoration(
            gradient: color,
            borderRadius: BorderRadius.circular(10)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(categoryName,style: GoogleFonts.ubuntu(color: Colors.white,fontWeight: FontWeight.w900,fontSize: 20),textAlign: TextAlign.center,)
          ],
        ),

      ),
    );
  }
}