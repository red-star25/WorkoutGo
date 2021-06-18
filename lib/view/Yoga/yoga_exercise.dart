import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:workout/controller/category_controller.dart';
import 'package:workout/model/ClickedCategory/ClickedCategoryModel.dart';
import 'package:workout/Widgets/Global/category_exercise.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Yoga extends StatelessWidget {
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
                      "Yoga",
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
              child: StreamBuilder<List<ClickedCategoryModel>>(
                  stream: categoryController.getYoga(),
                  builder: (context,
                      AsyncSnapshot<List<ClickedCategoryModel>> snapshot) {
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
                              header: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                    color: Colors.black54,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        snapshot.data[index].name,
                                        style: GoogleFonts.ubuntu(
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    )),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: GestureDetector(
                                  onTap: () {
                                    categoryController.hasHowTo.value = true;
                                    Get.to(() => ClickedCategoryExercise(
                                          exerciseData: snapshot.data[index],
                                          index: index,
                                          mainCollection: "yoga",
                                        ));
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    child: CachedNetworkImage(
                                      imageUrl: snapshot.data[index].image,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                      placeholder: (context, url) =>
                                          const Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                    ),
                                  ),
                                ),
                              ));
                        },
                      );
                    }
                  }),
            ),
          ],
        ));
  }
}
