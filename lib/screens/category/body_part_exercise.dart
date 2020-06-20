import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:workout/Category_Widget/Body_Part/Full_Body_Integrated.dart';
import 'package:workout/Category_Widget/Body_Part/Legs_Thigh.dart';
import 'package:workout/Category_Widget/Body_Part/Neck.dart';
import 'package:workout/Category_Widget/Body_Part/Shoulders.dart';
import 'package:workout/Category_Widget/Body_Part/abs.dart';
import 'package:workout/Category_Widget/Body_Part/arms.dart';
import 'package:workout/Category_Widget/Body_Part/back.dart';
import 'package:workout/Category_Widget/Body_Part/butt_hips.dart';
import 'package:workout/Category_Widget/Body_Part/chest.dart';

class Body_Part_Exercise extends StatefulWidget {
  @override
  _Body_Part_ExerciseState createState() => _Body_Part_ExerciseState();
}

class _Body_Part_ExerciseState extends State<Body_Part_Exercise> {
  List<Map> body_part_exercise = [];

  Future getdata() async {
    Firestore firestoreInstance = Firestore.instance;
   await  firestoreInstance
        .collection("body_part_exercise")
        .getDocuments()
        .then((querySnapshot) {
      querySnapshot.documents.forEach((result) {
        body_part_exercise.add(result.data);
      });
    });
   print(body_part_exercise);
   setState(() {

   });
  }

  @override
  void initState() {
    getdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.symmetric(horizontal: 10),
                height: 60,
                child: Card(
                    color: Colors.black,
                    child: Stack(
                      children: <Widget>[
                        Center(
                          child: Text(
                            "Body Part Exercise",
                            style: GoogleFonts.ubuntu(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ],
                    )),
              ),
             body_part_exercise.isNotEmpty? Container(
                  height: 680,
                  child: GridView.count(
                    primary: false,
                    padding: const EdgeInsets.all(20),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 2,
                    children: <Widget>[
                      Reusable_Category(
                        body_part_exercise: body_part_exercise,
                        index: 0,
                        screen: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>Abs())),
                      ),
                      Reusable_Category(
                        body_part_exercise: body_part_exercise,
                        index: 1,
                        screen: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>Arms())),
                      ),

                      Reusable_Category(
                        body_part_exercise: body_part_exercise,
                        index: 2,
                        screen: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>Back())),
                      ),
                      Reusable_Category(
                        body_part_exercise: body_part_exercise,
                        index: 3,
                        screen: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>Butt())),
                      ),
                      Reusable_Category(
                        body_part_exercise: body_part_exercise,
                        index: 4,
                        screen: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>Chest())),
                      ),
                      Reusable_Category(
                        body_part_exercise: body_part_exercise,
                        index: 5,
                        screen: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>Full_Body())),
                      ),
                      Reusable_Category(
                        body_part_exercise: body_part_exercise,
                        index: 6,
                        screen: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>Legs())),
                      ),
                      Reusable_Category(
                        body_part_exercise: body_part_exercise,
                        index: 7,
                        screen: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>Neck())),
                      ),
                      Reusable_Category(
                        body_part_exercise: body_part_exercise,
                        index: 8,
                        screen: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>Shoulder())),
                      ),
                    ],
                  ),):Container(),
            ],
          ),
        )
        );
  }
}

class Reusable_Category extends StatelessWidget {
  Reusable_Category({this.body_part_exercise, this.index,this.screen});
  final List<Map> body_part_exercise;
  int index;
  Function screen;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: screen,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.0)),
        child: Stack(
          children: <Widget>[
            body_part_exercise!=null?CachedNetworkImage(
              imageUrl: body_part_exercise[index]["image"],
              width: double.infinity,
              fit: BoxFit.cover,
              placeholder: (context, url) => Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ):Container(),
            Center(
              child: Text(
                body_part_exercise!=null?body_part_exercise[index]["name"]:"",
                style: GoogleFonts.righteous(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),
              )
            )
          ],
        )
      ),
    );
  }
}
