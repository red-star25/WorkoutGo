import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:workout/Category_Widget/Experience/advance.dart';
import 'package:workout/Category_Widget/Experience/beginners.dart';
import 'package:workout/Category_Widget/Experience/intermidiate.dart';
class Experience extends StatefulWidget {
  @override
  _ExperienceState createState() => _ExperienceState();
}

class _ExperienceState extends State<Experience> {


  List<Map> experienceData=[];
  Future<void> getData()async{
    final databaseReference = Firestore.instance;
    await databaseReference.collection('experience_exercise').orderBy('i',descending: false).getDocuments().then((querysnapshot) {
      querysnapshot.documents.forEach((result) {
        experienceData.add(result.data);
      });
    });
    setState(() {});
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
        body:experienceData.isNotEmpty?Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20,),
                Container(
                  height: 50,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Card(
                    color: Colors.white24,
                    child: Container(
                      color: Colors.deepOrange,
                      child: Center(child:Text("Exercise by Experience",style: GoogleFonts.ubuntu(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),),),
                  ),
                ),
                SizedBox(height: 5,),
                Experience_Cards(experienceData: experienceData,index: 0,onClicked: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Beginners_Exercise()));
                },),
                SizedBox(height: 10,),
                Experience_Cards(experienceData: experienceData,index: 1,onClicked: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Intermediate_Exercise()));
          },
                ),
                SizedBox(height: 10,),
                Experience_Cards(experienceData: experienceData,index: 2,onClicked: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Advance_Exercise()));
        },),
                SizedBox(height: 10,),


              ],
            ),
          ),
        ):Center(child: CircularProgressIndicator(),)
    );
  }
}

class Experience_Cards extends StatelessWidget {
  Experience_Cards({this.experienceData,this.index,this.onClicked});

  int index;
  Function onClicked;
  final List<Map> experienceData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onClicked,
        child: Container(
          height: 200,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(image: NetworkImage(experienceData[index]["image"]),fit: BoxFit.cover)
          ),
          child: Center(
            child: Text(experienceData[index]["name"],style: GoogleFonts.ubuntu(fontSize: 40,color: Colors.white,fontWeight: FontWeight.bold),),
          ),
        ),
      ),
    );
  }
}
