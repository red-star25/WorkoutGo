import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:workout/view/BodyPart/bodypart_exercise.dart';
import 'package:workout/view/ExperienceExercise/experience_exercise.dart';
import 'package:workout/view/Meditation/meditation_home.dart';
import 'package:workout/view/Yoga/yoga_exercise.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget categoryCard() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Card(
      color: Colors.white24,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            "Categories",
            style: GoogleFonts.breeSerif(
                fontSize: 25.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
        ),
      ),
    ),
  );
}

Widget categoryHomeCard(BuildContext context) {
  return SizedBox(
      child: ListView(
    scrollDirection: Axis.horizontal,
    children: <Widget>[
      SizedBox(
        width: 5.w,
      ),
      ReusableCategoryCard(
        categoryName: "Exercise by\nBody Part",
        color: const LinearGradient(colors: [Colors.deepOrange, Colors.orange]),
        screen: () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => BodyPartExercise())),
      ),
      SizedBox(
        width: 10.w,
      ),
      ReusableCategoryCard(
        categoryName: "Exercise by\nExperience",
        color: const LinearGradient(colors: [Colors.deepPurple, Colors.purple]),
        screen: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => Experience())),
      ),
      SizedBox(
        width: 10.w,
      ),
      ReusableCategoryCard(
        categoryName: "Yoga",
        color: const LinearGradient(
            colors: [Color(0xFF642B73), Color(0xFFC6426E)]),
        screen: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => Yoga())),
      ),
      SizedBox(
        width: 10.w,
      ),
      ReusableCategoryCard(
        categoryName: "Meditation",
        color: const LinearGradient(
            colors: [Color(0xFF159957), Color(0xFF155799)]),
        screen: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => Meditation())),
      ),
      SizedBox(
        width: 5.w,
      )
    ],
  ));
}

class ReusableCategoryCard extends StatelessWidget {
  String categoryName;
  LinearGradient color;
  Function screen;

  ReusableCategoryCard(
      {@required this.categoryName,
      @required this.color,
      @required this.screen});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {screen()},
      child: Container(
        width: 120.w,
        decoration: BoxDecoration(
            gradient: color, borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              categoryName,
              style: GoogleFonts.ubuntu(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 20.sp),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
