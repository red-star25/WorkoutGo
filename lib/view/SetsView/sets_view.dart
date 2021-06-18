import 'package:flutter/material.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

class Sets extends StatefulWidget {
  Sets({@required this.sets, @required this.isSec, @required this.time});
  int sets;
  int time;
  bool isSec;
  @override
  _SetsState createState() => _SetsState();
}

class _SetsState extends State<Sets> {
  final _controller = CountDownController();
  bool isStarted = false;
  bool isCompleted = false;
  bool isPause = false;

  AudioPlayer player;
  @override
  void initState() {
    super.initState();
    player = AudioPlayer();
    setAudio();
  }

  Future setAudio() async {
    await player.setAsset('assets/sound/beep.mp3');
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                widget.sets != 0
                    ? "Remaining Set: ${widget.sets}"
                    : "All sets completed",
                style: TextStyle(
                    fontSize: 22.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
            CircularCountDownTimer(
              controller: _controller,
              duration: widget.isSec ? widget.time : widget.time * 60,
              width: MediaQuery.of(context).size.width / 2,
              height: MediaQuery.of(context).size.height / 2,
              ringColor: Colors.green,
              fillColor: Colors.white,
              backgroundColor: Colors.deepOrange,
              strokeWidth: 20.0,
              strokeCap: StrokeCap.round,
              textStyle: TextStyle(
                  fontSize: 33.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
              textFormat: CountdownTextFormat.S,
              isReverse: true,
              autoStart: false,
              onComplete: () {
                player.play().then((value) => player.stop());
                setState(() {
                  isStarted = false;
                  if (widget.sets > 0) {
                    widget.sets--;
                  }
                });
                if (widget.sets == 0) {
                  setState(() {
                    isCompleted = true;
                  });
                }
              },
            ),
            if (!isCompleted)
              !isStarted
                  ? SizedBox(
                      height: 40.h,
                      width: 0.6.sw,
                      child: ElevatedButton(
                        onPressed: () {
                          _controller.start();
                          setState(() {
                            isStarted = true;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.deepOrange,
                        ),
                        child: const Text(
                          "Start",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )
                  : !isPause
                      ? SizedBox(
                          height: 40.h,
                          width: 0.6.sw,
                          child: ElevatedButton(
                            onPressed: () {
                              _controller.pause();
                              setState(() {
                                isPause = true;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.deepOrange,
                            ),
                            child: const Text(
                              "Pause",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        )
                      : SizedBox(
                          height: 40.h,
                          width: 0.6.sw,
                          child: ElevatedButton(
                            onPressed: () {
                              _controller.resume();
                              setState(() {
                                isPause = false;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.deepOrange,
                            ),
                            child: const Text(
                              "Resume",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        )
            else
              SizedBox(
                height: 40.h,
                width: 0.6.sw,
                child: ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.deepOrange,
                  ),
                  child: const Text(
                    "Go Back",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
