import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class Sets extends StatefulWidget {
  int sets;
  Sets({this.sets});
  @override
  _SetsState createState() => _SetsState();
}

class _SetsState extends State<Sets> {

  int _counter=30;
  bool _isStarted=false;
  Timer _timer;
  bool _isNext=false;

  void _startTimer(){
    setState(() {
      _isStarted=true;
    });
    _counter=30;
    _timer =Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if(_counter>0){
          _counter--;
          _isNext=false;
        }
        else{
          _isNext=true;
          widget.sets--;
          _timer.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body:widget.sets!=null?Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Center(
                child: _counter.toString()!="0"?Text(
                  _counter.toString(),
                  style: GoogleFonts.ubuntu(fontSize: 80,color: Colors.white),
                ):Text(
                  "Set complete",
                  style: GoogleFonts.ubuntu(fontSize: 20,color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 10,),
            !_isStarted?RaisedButton(
              onPressed: _startTimer,
              color: Colors.deepOrange,
              child: Text(
                "Start Timer",
                style: GoogleFonts.ubuntu(fontSize: 20,color: Colors.white),
              ),
            ):Container(),
            widget.sets>0&&_isNext?RaisedButton(
              onPressed: _startTimer,
              color: Colors.deepOrange,
              child: Text(
                "Next Set",
                style: GoogleFonts.ubuntu(fontSize: 20,color: Colors.white),
              ),
            ):Container(),
            widget.sets==0?
            Text("Done",style: GoogleFonts.ubuntu(fontSize: 30,color: Colors.green,fontWeight: FontWeight.bold),):Container()
          ],
        ):Center(
          child: Text(
              "Please Enter Number of Set",
              style: GoogleFonts.ubuntu(fontSize: 30,color: Colors.red,fontWeight: FontWeight.bold)
          ),
        )
    );
  }
}
