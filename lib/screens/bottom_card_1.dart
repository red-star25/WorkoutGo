import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class Home_BottomCardSwipe extends StatefulWidget {
  @override
  _Home_BottomCardSwipeState createState() => _Home_BottomCardSwipeState();
}

class _Home_BottomCardSwipeState extends State<Home_BottomCardSwipe> {

  List<Map> bottomCard=[];
  Future<void> getData()async{
    final databaseReference = Firestore.instance;
    await databaseReference.collection('bottomCards').getDocuments().then((querysnapshot) {
      querysnapshot.documents.forEach((result) {
        bottomCard.add(result.data);
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
        body:bottomCard.isNotEmpty?Padding(
          padding: const EdgeInsets.all(18.0),
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: PageView(
              scrollDirection: Axis.horizontal,
              children: [
                for(int i=0;i<5;i++)
                Container(
                  height: 100,
                  width: 100,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 250,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              image: DecorationImage(image: NetworkImage(bottomCard[i]["image"]),fit: BoxFit.cover)
                          ),
                        ),
                        SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(bottomCard[i]["title"],style: GoogleFonts.ubuntu(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),),
                        ),
                        SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(bottomCard[i]["details"],style: GoogleFonts.ubuntu(fontSize: 20,color: Colors.white),),
                        ),

                      ],
                    ),
                  ),
                ),
              ],
            )
          ),
        ):Center(child: CircularProgressIndicator(),)
    );
  }
}
