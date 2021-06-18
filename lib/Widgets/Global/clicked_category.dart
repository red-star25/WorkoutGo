import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:workout/Widgets/Global/category_exercise.dart';
import 'package:workout/controller/category_controller.dart';
import 'package:workout/model/ClickedCategory/ClickedCategoryModel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ClickedCategory extends StatelessWidget {
  final String title, name, mainCollection;
  final List<String> colorGradient;
  ClickedCategory(
      {@required this.title,
      @required this.name,
      @required this.mainCollection,
      this.colorGradient});

  final categoryController = Get.find<CategoryController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: <Widget>[
            Container(
              height: 50.h,
              margin: EdgeInsets.symmetric(horizontal: 20.w),
              child: Card(
                color: Colors.white24,
                child: Container(
                  color: Colors.deepOrange,
                  child: Center(
                    child: Text(
                      title,
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
              height: 20.h,
            ),
            Expanded(
              child: StreamBuilder<List<ClickedCategoryModel>>(
                  stream: categoryController.getClickedCategory(
                    name,
                    mainCollection,
                  ),
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
                      return StaggeredGridView.countBuilder(
                        padding: const EdgeInsets.all(4.0),
                        crossAxisCount: 4,
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) =>
                            GestureDetector(
                          onTap: () {
                            Get.to(() => ClickedCategoryExercise(
                                  exerName: name,
                                  exerciseData: snapshot.data[index],
                                  index: index,
                                  mainCollection: mainCollection,
                                ));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0),
                                    gradient: LinearGradient(colors: [
                                      categoryController.colorConvert(
                                          colorGradient[0]) as Color,
                                      categoryController.colorConvert(
                                          colorGradient[1]) as Color
                                    ])),
                                child: Center(
                                  child: Text(snapshot.data[index].name,
                                      style: GoogleFonts.ubuntu(
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                      textAlign: TextAlign.center),
                                )),
                          ),
                        ),
                        staggeredTileBuilder: (int index) =>
                            StaggeredTile.count(2, index.isEven ? 2 : 3),
                        mainAxisSpacing: 4.0,
                        crossAxisSpacing: 4.0,
                      );
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
