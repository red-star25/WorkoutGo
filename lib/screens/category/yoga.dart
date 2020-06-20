import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:workout/DatabaseModel/yoga_model.dart';

class Yoga extends StatefulWidget {
  @override
  _YogaState createState() => _YogaState();
}

class _YogaState extends State<Yoga> {
  List<Map> yogaData = [];

  Future<void> getData() async {
    final databaseReference = Firestore.instance;
    await databaseReference
        .collection('yoga')
        .orderBy("i", descending: false)
        .getDocuments()
        .then((querysnapshot) {
      querysnapshot.documents.forEach((result) {
        yogaData.add(result.data);
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
        body: Column(
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
                      "Yoga",
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
              height: MediaQuery.of(context).size.height*0.87,
              child: GridView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: yogaData.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:  2 ),
                itemBuilder: (BuildContext context, int index) {
                  return new GridTile(
                    header: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          color: Colors.black,
                          child: new Text(yogaData[index]['name'],style: GoogleFonts.ubuntu(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),)),
                    ),
                    child: yogaData!=null?
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Yoga_Data(exercicseData: yogaData[index],index:index)));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: CachedNetworkImage(
                            imageUrl: yogaData[index]["image"],
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
        ));
  }
}
