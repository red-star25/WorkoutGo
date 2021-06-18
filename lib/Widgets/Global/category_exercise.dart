import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:workout/controller/category_controller.dart';
import 'package:workout/model/ClickedCategory/ClickedCategoryModel.dart';
import 'package:workout/view/SetsView/sets_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ClickedCategoryExercise extends StatelessWidget {
  final categoryController = Get.find<CategoryController>();
  ClickedCategoryModel exerciseData;
  int index;
  String exerName, mainCollection;
  ClickedCategoryExercise(
      {this.exerciseData,
      this.index,
      this.exerName,
      @required this.mainCollection});

  Future getSteps() async {
    final ds = await FirebaseFirestore.instance
        .collection(mainCollection)
        .doc(exerName == "Hips"
            ? "butt_hips"
            : exerName == "Full Body"
                ? "full_body"
                : exerName == "Legs"
                    ? "legs_thigh"
                    : "${exerName[0].toLowerCase()}${exerName.substring(1, exerName.length)}")
        .collection("exercise")
        .doc("ex${index + 1}")
        .collection("steps")
        .doc("1")
        .get();
    return ds.data();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.black,
          body: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Card(
                    color: Colors.black,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(40.0),
                          bottomLeft: Radius.circular(40.0)),
                      child: CachedNetworkImage(
                        imageUrl: exerciseData.image,
                        height: 250.h,
                        width: 1.sw,
                        fit: BoxFit.fitWidth,
                        placeholder: (context, url) => const Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      exerciseData.name,
                      style: GoogleFonts.ubuntu(
                        fontSize: 23.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      if (exerciseData.difficulty != null &&
                          exerciseData.difficulty.isNotEmpty)
                        Level(exerciseModel: exerciseData)
                      else
                        Container(),
                      if (exerciseData.equipment != null)
                        Equipment(exerciseModel: exerciseData)
                      else
                        Container()
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  if (exerciseData.how_to == null)
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: FutureBuilder(
                          future: getSteps(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return Container();
                            } else {
                              return Column(
                                children: [
                                  for (int i = 0; i < snapshot.data.length; i++)
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Step:${i + 1}",
                                            style: GoogleFonts.ubuntu(
                                                fontSize: 18.sp,
                                                color: Colors.deepOrange,
                                                fontWeight: FontWeight.bold)),
                                        Text(
                                            "${snapshot.data["step${i + 1}"]}\n\n",
                                            style: GoogleFonts.ubuntu(
                                                fontSize: 15.sp,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold)),
                                      ],
                                    )
                                ],
                              );
                            }
                          }),
                    )
                  else
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: FutureBuilder(
                          future: exerName != null
                              ? FirebaseFirestore.instance
                                  .collection(mainCollection)
                                  .doc(
                                      "${exerName[0].toLowerCase()}${exerName.substring(1, exerName.length)}")
                                  .collection("exercise")
                                  .doc("ex${index + 1}")
                                  .get()
                                  .then((value) {
                                  return value.data();
                                })
                              : FirebaseFirestore.instance
                                  .collection(mainCollection)
                                  .doc("p${index + 1}")
                                  .get()
                                  .then((value) {
                                  return value.data();
                                }),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return Container();
                            } else {
                              return Column(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("How To\n",
                                          style: GoogleFonts.ubuntu(
                                              fontSize: 18.sp,
                                              color: Colors.deepOrange,
                                              fontWeight: FontWeight.bold)),
                                      Text("${snapshot.data["how_to"]}\n\n",
                                          style: GoogleFonts.ubuntu(
                                              fontSize: 15.sp,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  )
                                ],
                              );
                            }
                          }),
                    ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () => exerciseNow(context),
                        child: Container(
                          height: 40.h,
                          width: MediaQuery.of(context).size.width,
                          color: Colors.deepOrange,
                          child: Center(
                              child: Text(
                            "Exercise Now",
                            style: GoogleFonts.ubuntu(
                                fontSize: 18.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.w900),
                          )),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  )
                ],
              ),
            ),
          )),
    );
  }
}

exerciseNow(BuildContext context) {
  final setController = TextEditingController();
  final timeController = TextEditingController();
  bool isSec = true;
  bool isMin = false;
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) => SimpleDialog(
            backgroundColor: Colors.white,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  "Enter Total Sets:",
                  style:
                      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: setController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: "Number of sets ",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  "Enter Total Time/Set:",
                  style:
                      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: timeController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: "Time per set ",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          isSec = true;
                          isMin = false;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                          primary: isSec ? Colors.deepOrange : Colors.grey),
                      child: const Text("sec")),
                  SizedBox(
                    width: 10.w,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          isSec = false;
                          isMin = true;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                          primary: isMin ? Colors.deepOrange : Colors.grey),
                      child: const Text("min")),
                ],
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.deepOrange),
                    onPressed: () {
                      if (setController.text.isNotEmpty &&
                          timeController.text.isNotEmpty) {
                        Get.back();
                        Get.to(
                          () => Sets(
                            sets: int.parse(setController.text),
                            time: int.parse(timeController.text),
                            isSec: isSec ? true : false,
                          ),
                        );
                      } else {
                        Get.snackbar("Invalid Input",
                            "Please enter number of sets & time",
                            snackPosition: SnackPosition.BOTTOM,
                            colorText: Colors.white,
                            backgroundColor: Colors.deepOrange);
                      }
                    },
                    child: Text(
                      "Ready",
                      style: GoogleFonts.workSans(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ))
            ],
          ),
        );
      });
}

class Equipment extends StatelessWidget {
  const Equipment({
    Key key,
    @required this.exerciseModel,
  }) : super(key: key);

  final ClickedCategoryModel exerciseModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Center(
          child: Text(
            "Equipment",
            style: GoogleFonts.ubuntu(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 5.h,
        ),
        Container(
          height: 40.h,
          decoration: BoxDecoration(
              color: Colors.deepOrange,
              borderRadius: BorderRadius.circular(10)),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                exerciseModel.equipment,
                style: GoogleFonts.workSans(
                    fontSize: 16.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class Level extends StatelessWidget {
  const Level({
    Key key,
    @required this.exerciseModel,
  }) : super(key: key);

  final ClickedCategoryModel exerciseModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Center(
          child: Text(
            "Level",
            style: GoogleFonts.ubuntu(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 5.h,
        ),
        Container(
          height: 40.h,
          decoration: BoxDecoration(
              color: Colors.deepOrange,
              borderRadius: BorderRadius.circular(10)),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                exerciseModel.difficulty,
                style: GoogleFonts.workSans(
                    fontSize: 16.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
