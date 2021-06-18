import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workout/controller/category_controller.dart';
import 'package:workout/model/BodyPartExercise/BodyPartMain.dart';
import 'package:workout/Widgets/Global/clicked_category.dart';

class Experience extends StatelessWidget {
  final categoryController = Get.find<CategoryController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: StreamBuilder<List<BodyPartMain>>(
            stream: categoryController.getexperienceExercise(),
            builder: (context, AsyncSnapshot<List<BodyPartMain>> snapshot) {
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
                  height: 1.sh,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20.h,
                        ),
                        Container(
                          height: 50.h,
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          child: Card(
                            color: Colors.white24,
                            child: Container(
                              color: Colors.deepOrange,
                              child: Center(
                                child: Text(
                                  "Exercise by Experience",
                                  style: GoogleFonts.ubuntu(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        for (int i = 0; i < snapshot.data.length; i++)
                          ExperienceCards(
                            categoryController: categoryController,
                            experienceData: snapshot.data[i],
                            index: i,
                            onClicked: () {
                              categoryController.hasHowTo.value = true;
                              Get.to(
                                () => ClickedCategory(
                                  title: snapshot.data[i].title,
                                  name: snapshot.data[i].name,
                                  mainCollection: "experience_exercise",
                                  colorGradient: snapshot.data[i].color,
                                ),
                              );
                            },
                          ),
                      ],
                    ),
                  ),
                );
              }
            }));
  }
}

class ExperienceCards extends StatelessWidget {
  ExperienceCards(
      {this.experienceData,
      this.index,
      this.onClicked,
      this.categoryController});

  int index;
  Function onClicked;
  final BodyPartMain experienceData;
  final CategoryController categoryController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () => {onClicked()},
        child: Container(
          decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(15.0),
              gradient: LinearGradient(colors: [
                categoryController.colorConvert(experienceData.color[0])
                    as Color,
                categoryController.colorConvert(experienceData.color[1])
                    as Color
              ])),
          height: 200.h,
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: Text(
              experienceData.title,
              style: GoogleFonts.ubuntu(
                  fontSize: 40.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
