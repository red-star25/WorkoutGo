import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:workout/screens/Sets.dart';
class Yoga_Data extends StatefulWidget {
  Map exercicseData;
  int index;
  Yoga_Data({this.exercicseData,this.index});

  @override
  _Yoga_DataState createState() => _Yoga_DataState();
}

class _Yoga_DataState extends State<Yoga_Data> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body:widget.exercicseData!=null?Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Card(
                  color: Colors.black,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(40.0),bottomLeft: Radius.circular(40.0)),
                    child: CachedNetworkImage(
                      imageUrl: widget.exercicseData["image"],
                      width: double.infinity,
                      height: 250,
                      fit: BoxFit.fitWidth,
                      placeholder: (context, url) => Container(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child:Text(
                    "${widget.exercicseData["name"]}",
                    style: GoogleFonts.ubuntu(fontSize: 23,color: Colors.white,fontWeight: FontWeight.bold,),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 30,),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.only(left:15.0),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: "About\n",
                            style: GoogleFonts.ubuntu(fontSize: 22,fontWeight: FontWeight.bold)
                        ),
                        TextSpan(
                            text: "\n${widget.exercicseData["info"]}\n\n",
                            style: GoogleFonts.ubuntu(fontSize: 16,fontWeight: FontWeight.bold)
                        ),
                          TextSpan(
                              text: "How to:\n",
                              style: GoogleFonts.ubuntu(fontSize: 22,fontWeight: FontWeight.bold)
                          ),
                          TextSpan(
                              text: "\n${widget.exercicseData["how_to"]}\n\n",
                            style: GoogleFonts.ubuntu(fontSize: 16,fontWeight: FontWeight.bold)
                          ),

                      ],

                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: ExerciseNow,
                      child: Container(
                        height: 40,
                        width:MediaQuery.of(context).size.width,
                        color: Colors.deepOrange,
                        child: Center(child: Text("Exercise Now",style: GoogleFonts.ubuntu(fontSize: 18,color: Colors.white,fontWeight: FontWeight.w900),)),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5,)
              ],
            ),
          ),
        ):Center(child: CircularProgressIndicator())
    );
  }
  int sets=0;
  ExerciseNow(){
    showDialog(
        context: context,
        builder: (BuildContext context){
          return SimpleDialog(
            backgroundColor: Colors.white,
            title: Text("Sets:",style: GoogleFonts.workSans(fontSize: 18,fontWeight: FontWeight.bold),),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  keyboardType: TextInputType.number,
                  onChanged: (value){
                    setState(() {
                      sets=int.parse(value);
                    });
                  },
                  decoration: InputDecoration(
                    hintText: "How many Sets",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    color: Colors.deepOrange,
                    onPressed: (){
                      sets!=0?Navigator.push(context, MaterialPageRoute(builder: (context)=>Sets(sets:sets))):print("0");
                    },
                    child: Text("Ready",style: GoogleFonts.workSans(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),
                  )
              )
            ],
          );
        }
    );
  }
}
