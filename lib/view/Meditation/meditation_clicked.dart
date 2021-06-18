import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:workout/model/MeditationModel/MeditationModel.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MeditationClicked extends StatefulWidget {
  final MeditationModel exercicseData;
  final int index;

  const MeditationClicked({this.exercicseData, this.index});

  @override
  _MeditationClickedState createState() => _MeditationClickedState();
}

class _MeditationClickedState extends State<MeditationClicked> {
  YoutubePlayerController _controller;

  @override
  void initState() {
    _controller = YoutubePlayerController(
      initialVideoId: widget.exercicseData.video_link,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SizedBox(
          width: 1.sw,
          height: 1.sh,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Card(
                  color: Colors.black,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(40.0),
                        bottomLeft: Radius.circular(40.0)),
                    child: CachedNetworkImage(
                      imageUrl: widget.exercicseData.image,
                      width: 1.sw,
                      height: 250.h,
                      fit: BoxFit.fitWidth,
                      placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    widget.exercicseData.name,
                    style: GoogleFonts.ubuntu(
                      fontSize: 23.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: "About\n",
                            style: GoogleFonts.ubuntu(
                                fontSize: 22.sp, fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: "\n${widget.exercicseData.info}\n\n",
                            style: GoogleFonts.ubuntu(
                                fontSize: 16.sp, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                YoutubePlayer(
                  controller: _controller,
                  showVideoProgressIndicator: true,
                  progressColors: const ProgressBarColors(
                    backgroundColor: Colors.deepOrange,
                    bufferedColor: Colors.deepOrange,
                    playedColor: Colors.amber,
                    handleColor: Colors.amberAccent,
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
              ],
            ),
          ),
        ));
  }
}
