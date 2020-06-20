import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:workout/screens/Sets.dart';
class Experience_Exercise_Model extends StatefulWidget {
  Map exercicseData;
  int index;
  Experience_Exercise_Model({this.exercicseData,this.index});

  @override
  _Experience_Exercise_ModelState createState() => _Experience_Exercise_ModelState();
}

class _Experience_Exercise_ModelState extends State<Experience_Exercise_Model> {

  Map steps;
  Future<void> getData()async{
    final databaseReference = Firestore.instance;
    await databaseReference.collection('experience_exercise').document("beginners").collection('exercise').document("ex${widget.index+1}").get().then((value){
      steps=value.data;
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
        body:steps!=null?Container(
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
                Padding(
                  padding: const EdgeInsets.only(left:15.0),
                  child: RichText(
                    text: TextSpan(
                      children: [
                          TextSpan(
                              text: "How to:\n",
                              style: GoogleFonts.ubuntu(fontSize: 22,color: Colors.white,fontWeight: FontWeight.bold)
                          ),
                          TextSpan(
                              text: "\n${steps["how_to"]}\n\n",
                              style: GoogleFonts.ubuntu(fontSize: 16,color: Colors.white,fontWeight: FontWeight.bold)
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

class Equipment extends StatelessWidget {
  const Equipment({
    Key key,
    @required this.widget,
  }) : super(key: key);

  final Experience_Exercise_Model widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Center(
          child: Text("Equipment",style: GoogleFonts.ubuntu(color: Colors.white,fontWeight: FontWeight.bold),),
        ),
        SizedBox(height: 5,),
        Container(
          height: 40,
          decoration: BoxDecoration(
              color: Colors.deepOrange,
              borderRadius: BorderRadius.circular(10)
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.exercicseData["equipment"],
                style: GoogleFonts.workSans(fontSize: 16,color: Colors.white,fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class Level extends StatelessWidget {
  const Level({
    Key key,
    @required this.widget,
  }) : super(key: key);

  final Experience_Exercise_Model widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Center(
          child: Text("Level",style: GoogleFonts.ubuntu(color: Colors.white,fontWeight: FontWeight.bold),),
        ),
        SizedBox(height: 5,),
        Container(
          height: 40,
          decoration: BoxDecoration(
              color: Colors.deepOrange,
              borderRadius: BorderRadius.circular(10)
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.exercicseData["difficulty"],
                style: GoogleFonts.workSans(fontSize: 16,color: Colors.white,fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
