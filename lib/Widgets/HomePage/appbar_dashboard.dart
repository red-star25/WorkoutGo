import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget appbarDashboard() {
  return SizedBox(
    width: 1.sw,
    height: 50.h,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Padding(
          padding: EdgeInsets.all(5.0),
          child: CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage("assets/logo2.png"),
          ),
        ),
        SizedBox(
          width: 10.w,
        ),
        Text(
          "Workout Go",
          style: GoogleFonts.ubuntu(
              fontSize: 28.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
      ],
    ),
  );
}
