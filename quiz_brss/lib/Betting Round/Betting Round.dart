import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_brss/Rapid%20Fire%20Round/RapidFireRound.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import '../Widgets/CircularButton2.dart';
// import 'AudioRound.dart';
import 'package:video_player/video_player.dart';

import '../questions/Betting Round/bettingRound.dart';

class BettingRound extends StatefulWidget {
  const BettingRound({super.key});

  @override
  State<BettingRound> createState() => _BettingRoundState();
}

class _BettingRoundState extends State<BettingRound> {
  VideoPlayerController? controller;

  int _start = 60;
  bool _isTimerFinished = false;
  bool _isTimerRunning = false;
  int questionCount = 0;
  bool showAnswer = false;
  AudioPlayer audioPlayer = AudioPlayer();

  Timer? _timer;

  late VideoPlayerController _controller;
  late VideoPlayerController _controller1;
  bool _isInitialized = false;
  bool _isInitialized1 = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/photo/flowingwater.mp4')
      ..initialize().then((_) {
        setState(() {
          _isInitialized = true;
        });
      });
    _controller1 = VideoPlayerController.asset('assets/photo/ques17.mp4')
      ..initialize().then((_) {
        setState(() {
          _isInitialized1 = true;
        });
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer!.cancel();

    super.dispose();
  }

  void showQuestion(int number) {
    // print("HELLO");
    showAnswer = false;

    setState(() {
      questionCount = number;
      // print(number);
    });
  }

  void playBuzzerSound() async {
    audioPlayer.play(
        'assets/sounds/buz1.wav'); // Replace 'assets/sounds/Ques1 audio clip.mp3' with your buzzer sound file path
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 1) {
          playBuzzerSound();
        }
        if (_start == 0) {
          setState(() {
            _isTimerFinished = true;
          });
          timer.cancel();
        } else {
          setState(() {
            _start--;
            _isTimerRunning = true;
          });
        }
      },
    );
  }

  final bool _isContainerVisible = false;

  int questionNumber = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF001C42),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              'background.png', // Replace with your background image path
              fit: BoxFit.cover,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(50.0),
                child: Column(
                  children: [
                    const Text(
                      'Betting Round',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Sans',
                        fontSize: 40.0,
                      ),
                    ),
                    SizedBox(width: 35),
                    const SizedBox(
                      height: 80,
                    ),
                    Text(
                      questions[questionNumber]['question']!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontFamily: 'Sans',
                        fontSize: 40.0,
                      ),
                    ),
                    const SizedBox(
                      height: 45,
                    ),
                    Column(
                      children: [
                        const SizedBox(
                          height: 25,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            showAnswer
                                ? Card(
                                    color:
                                        const Color.fromARGB(255, 16, 110, 65),
                                    elevation: 4,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Text(
                                        questions[questionNumber]['answer']!,
                                        softWrap: true,
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 35,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  )
                                : const SizedBox()
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment:
                  MainAxisAlignment.end, // Align children to the right
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 10, 150),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: 150,
                        height: 150,
                        child: SleekCircularSlider(
                          appearance: CircularSliderAppearance(
                            size: MediaQuery.of(context).size.width * 0.84,
                            customColors: CustomSliderColors(
                              trackColor:
                                  const Color.fromARGB(255, 189, 67, 67),
                              progressBarColor: Color(0xfff24ffcc),
                              dotColor: Colors.black,
                              shadowColor: Colors.grey.shade600,
                            ),
                            startAngle: 360,
                            angleRange: 360,
                            customWidths: CustomSliderWidths(
                              trackWidth: 36,
                              progressBarWidth: 22,
                              handlerSize: 7,
                            ),
                          ),
                          min: 0,
                          max: 60,
                          initialValue: _start.toDouble(),
                          onChange: (double value) {
                            setState(() {
                              _start = value.round();
                            });
                          },
                          innerWidget: (percentage) => Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '${_start.round()}',
                                  style: const TextStyle(
                                    fontSize: 32,
                                    color: Color(0xfff24ffcc),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        _isTimerFinished ? 'Time Out' : 'seconds',
                        style: TextStyle(
                            color: _isTimerFinished ? Colors.red : Colors.white,
                            fontSize: 30.0,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircularButton2(
                      icon: Icons.arrow_back,
                      onTap: () {
                        // Go back to the previous page
                        Get.back();
                      },
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          showAnswer = true;
                          _isTimerRunning = false;
                          _isTimerFinished = false;
                          _start = 60;
                          _timer!.cancel();
                        });
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green),
                      child: const Text("Show Answer",
                          style: TextStyle(
                              fontWeight: FontWeight.w100,
                              color: Colors.white)),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            showAnswer = false;
                            startTimer();
                            questionNumber = 1;
                          });
                        },
                        child: const Text("1")),
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            showAnswer = false;
                            startTimer();
                            questionNumber = 2;
                          });
                        },
                        child: const Text("2")),
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            showAnswer = false;
                            startTimer();
                            questionNumber = 3;
                          });
                        },
                        child: const Text("3")),
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            showAnswer = false;
                            startTimer();
                            questionNumber = 4;
                          });
                        },
                        child: const Text("4")),
                    CircularButton2(
                      icon: Icons.arrow_forward,
                      onTap: () {
                        Get.to(const RapidFireRound());
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
