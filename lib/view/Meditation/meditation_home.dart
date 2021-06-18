import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:workout/view/Meditation/meditation_clicked.dart';
import 'package:workout/controller/category_controller.dart';
import 'package:workout/model/MeditationModel/MeditationModel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Meditation extends StatelessWidget {
  final categoryController = Get.find<CategoryController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          SizedBox(
            height: 20.h,
          ),
          Container(
            height: 50.h,
            margin: EdgeInsets.symmetric(horizontal: 20.w),
            child: Card(
              child: Container(
                color: Colors.deepOrange,
                child: Center(
                  child: Text(
                    "Meditation",
                    style: GoogleFonts.ubuntu(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: StreamBuilder<List<MeditationModel>>(
                stream: categoryController.getMeditation(),
                builder:
                    (context, AsyncSnapshot<List<MeditationModel>> snapshot) {
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
                    return GridView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                      itemBuilder: (BuildContext context, int index) {
                        return GridTile(
                          footer: Container(
                              color: Colors.black54,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  snapshot.data[index].name,
                                  style: GoogleFonts.ubuntu(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              )),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: GestureDetector(
                              onTap: () {
                                Get.to(() => MeditationClicked(
                                      exercicseData: snapshot.data[index],
                                      index: index,
                                    ));
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15.0),
                                child: CachedNetworkImage(
                                  imageUrl: snapshot.data[index].image,
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) => const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }
                }),
          ),
        ],
      ),
    );
  }
}
