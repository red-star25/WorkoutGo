
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:workout/Widgets/HomePage/Carousel.dart';
import 'package:workout/Widgets/HomePage/CategoryCard.dart';
import 'package:workout/Widgets/HomePage/HealthTips.dart';
import 'package:workout/Widgets/HomePage/HomePage_AppBar.dart';


class Workout_HomePage extends StatefulWidget {
  @override
  _Workout_HomePageState createState() => _Workout_HomePageState();
}

class _Workout_HomePageState extends State<Workout_HomePage> {


  @override
  void initState() {
    getdata();
    getBottomTitle();
    super.initState();
  }

  List<Map> popularExercise = [];

  Future getdata() async {
    Firestore firestoreInstance = Firestore.instance;
    await firestoreInstance
        .collection("popular_exercise")
        .getDocuments()
        .then((querySnapshot) async{
      querySnapshot.documents.forEach((result) {
        popularExercise.add(result.data);
      });
    });
    setState(() {
      
    });
  }

  String bottomTitle;
   Future<void>getBottomTitle()async{
    final databaseReference = Firestore.instance;
    await databaseReference.collection('bottomCards').document("title").get().then((value){
      bottomTitle=value.data["title"];
    });
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body:Container(
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                appBar_Home(),
                Carousel(popularExercise,context),
                categoryCard(),
                CategoryHomeCard(context),
                HealthTips(context,bottomTitle),
                Center(child: Text("Powered by NakumsDtech",style: GoogleFonts.ubuntu(fontSize: 10,fontWeight: FontWeight.bold,color: Colors.white),),),
              ],
            ),
          ),
        )
      ),
    );
  }
}
