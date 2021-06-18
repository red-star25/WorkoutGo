import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workout/model/BodyPartExercise/BodyPartMain.dart';
import 'package:workout/model/ClickedCategory/ClickedCategoryModel.dart';
import 'package:workout/model/MeditationModel/MeditationModel.dart';

class CategoryController extends GetxController {
  RxInt sets = 1.obs;
  RxBool hasHowTo = false.obs;

  List<BodyPartMain> bodyPartExercise(QuerySnapshot snapshot) {
    return snapshot.docs
        .map((doc) => BodyPartMain.fromJson(doc.data()))
        .toList();
  }

  Stream<List<BodyPartMain>> getBodyPartExercise(String categoryType) {
    final firebaseFirestore =
        FirebaseFirestore.instance.collection(categoryType);
    return firebaseFirestore.snapshots().map(bodyPartExercise);
  }

  List<BodyPartMain> experienceExercise(QuerySnapshot snapshot) {
    return snapshot.docs
        .map((doc) => BodyPartMain.fromJson(doc.data()))
        .toList();
  }

  Stream<List<BodyPartMain>> getexperienceExercise() {
    final firebaseFirestore = FirebaseFirestore.instance
        .collection("experience_exercise")
        .orderBy("i", descending: false);
    return firebaseFirestore.snapshots().map(experienceExercise);
  }

  List<ClickedCategoryModel> clickedCategory(QuerySnapshot snapshot) {
    return snapshot.docs
        .map((doc) => ClickedCategoryModel.fromJson(doc.data()))
        .toList();
  }

  Stream<List<ClickedCategoryModel>> getClickedCategory(
      String categoryName, String mainCollection) {
    if (categoryName == "Hips") categoryName = "butt_hips";
    if (categoryName == "Full Body") categoryName = "full_body";
    if (categoryName == "Legs") categoryName = "legs_thigh";
    final firebaseFirestore = FirebaseFirestore.instance
        .collection(mainCollection)
        .doc(
            "${categoryName[0].toLowerCase()}${categoryName.substring(1, categoryName.length)}")
        .collection("exercise")
        .orderBy("i", descending: false);
    return firebaseFirestore.snapshots().map(clickedCategory);
  }

  List<ClickedCategoryModel> yoga(QuerySnapshot snapshot) {
    return snapshot.docs
        .map((doc) => ClickedCategoryModel.fromJson(doc.data()))
        .toList();
  }

  Stream<List<ClickedCategoryModel>> getYoga() {
    final firebaseFirestore = FirebaseFirestore.instance
        .collection("yoga")
        .orderBy("i", descending: false);
    return firebaseFirestore.snapshots().map(yoga);
  }

  List<MeditationModel> meditation(QuerySnapshot snapshot) {
    return snapshot.docs
        .map((doc) => MeditationModel.fromJson(doc.data()))
        .toList();
  }

  Stream<List<MeditationModel>> getMeditation() {
    final firebaseFirestore = FirebaseFirestore.instance
        .collection("meditation")
        .orderBy("i", descending: false);
    return firebaseFirestore.snapshots().map(meditation);
  }

  colorConvert(String color) {
    // ignore: parameter_assignments
    color = color.replaceAll("#", "");
    if (color.length == 6) {
      return Color(int.parse("0xFF$color"));
    } else if (color.length == 8) {
      return Color(int.parse("0x$color"));
    }
  }
}
