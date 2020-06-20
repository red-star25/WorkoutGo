import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getflutter/components/carousel/gf_carousel.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:workout/DatabaseModel/popular_onclicked.dart';

Widget Carousel(List<Map<dynamic, dynamic>> popularExercise,context) {
      int Cardindex;
  return popularExercise.isNotEmpty?GFCarousel(
    autoPlayInterval: Duration(seconds: 2),
    enlargeMainPage: true,
    autoPlayCurve: Curves.easeInCubic,
    scrollDirection: Axis.horizontal,
    autoPlay: true,
    items: popularExercise.map(
      (url) {
        return Container(
          margin: EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            child: Opacity(
              opacity: 1.0,
              child: Stack(
                children: <Widget>[
                  GestureDetector(
                    onTap: (){
                      print(Cardindex.toString());
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Popular_onClicked(index: Cardindex+1,exercicseData: url,)));
                    },
                    child: CachedNetworkImage(
                      imageUrl: url["image_url"],
                      width: 1000,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Container(
                          child: Center(
                        child: CircularProgressIndicator(),
                      )),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        url["exer_name"].toString(),
                        style: GoogleFonts.ubuntu(
                            fontSize: 28,
                            fontWeight: FontWeight.w900,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "${url["body_part"]}",
                        style: GoogleFonts.ubuntu(
                            fontSize: 13,
                            fontWeight: FontWeight.w900,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    ).toList(),
    onPageChanged: (value){
      Cardindex=value;
    },
  ):Center(
    child: CircularProgressIndicator(),
  );
}