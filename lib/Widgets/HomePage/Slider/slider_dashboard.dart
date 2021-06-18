import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:workout/Widgets/HomePage/Slider/popular_onclicked.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:workout/controller/dashboard_controller.dart';
import 'package:workout/model/PopularExercise/PopularExercise.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget dashBoardSlider() {
  final dashBoardController = Get.find<DashboardController>();
  return StreamBuilder<List<PopularExercise>>(
      stream: dashBoardController.getPopularExercise,
      builder: (context, AsyncSnapshot<List<PopularExercise>> snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(
            child: Text(
              "Bad Server Response",
              style: TextStyle(color: Colors.white),
            ),
          );
        } else {
          return SizedBox(
            width: 1.sw,
            child: CarouselSlider(
                options: CarouselOptions(
                  enlargeCenterPage: true,
                  autoPlayInterval: const Duration(seconds: 2),
                  autoPlayCurve: Curves.easeInCubic,
                  autoPlay: true,
                ),
                items: [
                  for (int i = 0; i < snapshot.data.length; i++)
                    Container(
                      margin: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5.0)),
                        child: Opacity(
                          opacity: 1.0,
                          child: Stack(
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => PopularOnClicked(
                                        exerciseData: snapshot.data[i],
                                        index: i,
                                      ),
                                    ),
                                  );
                                },
                                child: CachedNetworkImage(
                                  imageUrl: snapshot.data[i].image_url,
                                  width: 1.sw,
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) => const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                ),
                              ),
                              Align(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    snapshot.data[i].exer_name,
                                    style: GoogleFonts.ubuntu(
                                        fontSize: 28.sp,
                                        fontWeight: FontWeight.w900,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    snapshot.data[i].body_part,
                                    style: GoogleFonts.ubuntu(
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w900,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                ]),
          );
        }
      });
}
