import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workout/view/Dashboard/bottomcard_view.dart';

Widget healthNews() {
  return SizedBox(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Get.to(() => HomeBottomCard());
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 1.sh,
              width: 1.sw,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  gradient: LinearGradient(
                      colors: [Color(0xFF200122), Color(0xFF6f0000)])),
              child: Center(
                child: Text(
                  "World Health News",
                  style: GoogleFonts.ubuntu(
                      fontSize: 30.sp,
                      fontWeight: FontWeight.w900,
                      color: Colors.white),
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
