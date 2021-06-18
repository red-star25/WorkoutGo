import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:workout/Widgets/Global/clicked_category.dart';
import 'package:workout/controller/category_controller.dart';
import 'package:workout/model/BodyPartExercise/BodyPartMain.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BodyPartExercise extends StatelessWidget {
  final categoryController = Get.find<CategoryController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: <Widget>[
            SizedBox(
              height: 20.h,
            ),
            Container(
              padding: EdgeInsets.all(5.w),
              margin: EdgeInsets.symmetric(horizontal: 10.w),
              height: 60.h,
              child: Card(
                  color: Colors.deepOrange,
                  child: Stack(
                    children: <Widget>[
                      Center(
                        child: Text(
                          "Body Part Exercise",
                          style: GoogleFonts.ubuntu(
                              fontSize: 25.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  )),
            ),
            Expanded(
              child: StreamBuilder<List<BodyPartMain>>(
                  stream: categoryController
                      .getBodyPartExercise("body_part_exercise"),
                  builder:
                      (context, AsyncSnapshot<List<BodyPartMain>> snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasError) {
                      return const Center(
                        child: Text(
                          "Bad Server Response",
                          style: TextStyle(color: Colors.white),
                        ),
                      );
                    } else {
                      return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: StaggeredGridView.countBuilder(
                          crossAxisCount: 4,
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int index) =>
                              Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: ReusableCategory(
                              body_part_exercise: snapshot.data[index],
                              categoryController: categoryController,
                              screen: () => Get.to(
                                () => ClickedCategory(
                                  title: snapshot.data[index].title,
                                  name: snapshot.data[index].name,
                                  mainCollection: "body_part_exercise",
                                  colorGradient: snapshot.data[index].color,
                                ),
                              ),
                            ),
                          ),
                          staggeredTileBuilder: (int index) =>
                              StaggeredTile.count(2, index.isEven ? 2 : 3),
                          mainAxisSpacing: 4.0,
                          crossAxisSpacing: 4.0,
                        ),
                      );
                    }
                  }),
            )
          ],
        ));
  }
}

class ReusableCategory extends StatelessWidget {
  ReusableCategory(
      {this.body_part_exercise, this.screen, this.categoryController});
  final BodyPartMain body_part_exercise;
  final CategoryController categoryController;
  Function screen;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {screen()},
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            gradient: LinearGradient(colors: [
              categoryController.colorConvert(body_part_exercise.color[0])
                  as Color,
              categoryController.colorConvert(body_part_exercise.color[1])
                  as Color
            ])),
        child: Center(
          child: Text(
            body_part_exercise.title,
            style: GoogleFonts.righteous(
                fontSize: 25.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
        ),
      ),
    );
  }
}
