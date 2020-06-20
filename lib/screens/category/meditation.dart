import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:workout/DatabaseModel/meditation_model.dart';

class Meditation extends StatefulWidget {
  @override
  _MeditationState createState() => _MeditationState();
}

class _MeditationState extends State<Meditation> {
  List<Map> meditationData = [];

  Future<void> getData() async {
    final databaseReference = Firestore.instance;
    await databaseReference
        .collection('meditation')
        .orderBy("i", descending: false)
        .getDocuments()
        .then((querysnapshot) {
      querysnapshot.documents.forEach((result) {
        meditationData.add(result.data);
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
        body: Container(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                height: 50,
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Card(
                  child: Container(
                    color: Colors.deepOrange,
                    child: Center(
                      child: Text(
                        "Meditation",
                        style: GoogleFonts.ubuntu(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: 670,
                child: GridView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: meditationData.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount:  2 ),
                  itemBuilder: (BuildContext context, int index) {
                    return new GridTile(
                      header: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            color: Colors.black,
                            child: new Text(meditationData[index]['name'],style: GoogleFonts.ubuntu(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),)),
                      ),
                      child: meditationData!=null?
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Meditation_Data(exercicseData: meditationData[index],index:index)));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: CachedNetworkImage(
                              imageUrl: meditationData[index]["image"],
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
        ));
  }
}
