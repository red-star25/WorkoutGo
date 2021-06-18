import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:workout/model/BottomCard/BottomCard.dart';

import '../model/PopularExercise/PopularExercise.dart';

class DashboardController extends GetxController {
  RxBool hasHowTo = false.obs;

  List<PopularExercise> popularExercise(QuerySnapshot snapshot) {
    return snapshot.docs
        .map((doc) => PopularExercise.fromJson(doc.data()))
        .toList();
  }

  Stream<List<PopularExercise>> get getPopularExercise {
    final firebaseFirestore =
        FirebaseFirestore.instance.collection("popular_exercise");
    return firebaseFirestore.snapshots().map(popularExercise);
  }

  String bottomTitle;
  Future<NewsCard> fetchNews() async {
    final response = await http.get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?category=health&apiKey=7a4dcc7ae1f84371bd3199fab8d5f208&pageSize=20'));

    if (response.statusCode == 200) {
      return NewsCard.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load news');
    }
  }
}
