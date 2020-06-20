import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
class Meditation_Data extends StatefulWidget {
  Map exercicseData;
  int index;

  Meditation_Data({this.exercicseData,this.index});

  @override
  _Meditation_DataState createState() => _Meditation_DataState();
}

class _Meditation_DataState extends State<Meditation_Data> {


  YoutubePlayerController _controller;
  @override
  void initState() {
    _controller=YoutubePlayerController(
      initialVideoId: widget.exercicseData["video_link"],
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
    super.initState();
  }

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
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 5,),
                YoutubePlayer(
                  controller: _controller,
                  showVideoProgressIndicator: true,
                  progressColors: ProgressBarColors(
                    backgroundColor: Colors.deepOrange,
                    bufferedColor: Colors.deepOrange,
                    playedColor: Colors.amber,
                    handleColor: Colors.amberAccent,
                  ),
                ),
                SizedBox(height: 5,),
              ],
            ),
          ),
        ):Center(child: CircularProgressIndicator())
    );
  }
}
