import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:workout/DatabaseModel/experience_exercise_model.dart';

class Intermediate_Exercise extends StatefulWidget {
  @override
  _Intermediate_ExerciseState createState() => _Intermediate_ExerciseState();
}

class _Intermediate_ExerciseState extends State<Intermediate_Exercise> {

  List<Map> intermediate_Data=[];

  Future<void> getData()async{
    final databaseReference = Firestore.instance;
    await databaseReference.collection('experience_exercise').document("intermediate").collection('exercise').orderBy("i",descending: false).getDocuments().then((querysnapshot) {
      querysnapshot.documents.forEach((result) {
        intermediate_Data.add(result.data);
      });
      setState(() {});
    });
  }
  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body:SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 20,),
            Container(
              height: 50,
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Card(
                color: Colors.white24,
                child: Container(
                  color: Colors.deepOrange,
                  child: Center(child:Text("Intermediate Exercise",style: GoogleFonts.ubuntu(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),),),
              ),
            ),
            Container(
              height: 670,
              child: GridView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: intermediate_Data.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:  2 ),
                itemBuilder: (BuildContext context, int index) {
                  return new GridTile(
                    header: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          color: Colors.black,
                          child: new Text(intermediate_Data[index]['name'],style: GoogleFonts.ubuntu(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),)),
                    ),
                    child: intermediate_Data!=null?
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Experience_Exercise_Model(exercicseData: intermediate_Data[index],index:index)));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: CachedNetworkImage(
                            imageUrl: intermediate_Data[index]["image"],
                            width: double.infinity,
                            fit: BoxFit.cover,
                            placeholder: (context, url) => Container(
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                        :Container(),

                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
