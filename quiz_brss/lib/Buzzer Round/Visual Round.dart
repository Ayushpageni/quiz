import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_brss/questions/Burzer%20Round/visualRound.dart';

import '../Widgets/CircularButton2.dart';
import 'AudioRound.dart';
import 'package:video_player/video_player.dart';

class VisualRound extends StatefulWidget {
  const VisualRound({super.key});

  @override
  State<VisualRound> createState() => _VisualRoundState();
}

class _VisualRoundState extends State<VisualRound> {
  VideoPlayerController? controller;

  int _start = 30;
  bool _isTimerFinished = false;
  bool _isTimerRunning = false;
  int questionCount = 0;
  bool showAnswer = false;

  Timer? _timer;

  late VideoPlayerController _controller;
  late VideoPlayerController _controller1;
  late VideoPlayerController _controller2;
  late VideoPlayerController _controller3;
  late VideoPlayerController _controller4;
  late VideoPlayerController _controller5;
  late VideoPlayerController _controller6;
  late VideoPlayerController _controller7;
  late VideoPlayerController _controller8;
  late VideoPlayerController _controller9;
  late VideoPlayerController _controller10;
  late VideoPlayerController _controller11;
  late VideoPlayerController _controller12;
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
    _controller2 = VideoPlayerController.asset('assets/photo/set4v3.mp4')
      ..initialize().then((_) {
        setState(() {
          _isInitialized1 = true;
        });
      });
    _controller3 = VideoPlayerController.asset('assets/photo/set4v4.mp4')
      ..initialize().then((_) {
        setState(() {
          _isInitialized1 = true;
        });
      });
    _controller4 = VideoPlayerController.asset('assets/photo/set7v3.mp4')
      ..initialize().then((_) {
        setState(() {
          _isInitialized1 = true;
        });
      });
    _controller5 = VideoPlayerController.asset('assets/photo/set7v4.mp4')
      ..initialize().then((_) {
        setState(() {
          _isInitialized1 = true;
        });
      });
    _controller6 = VideoPlayerController.asset('../assets/photo/set8v3.mp4')
      ..initialize().then((_) {
        setState(() {
          _isInitialized1 = true;
        });
      });
    _controller7 = VideoPlayerController.asset('../assets/photo/set8v4.mp4')
      ..initialize().then((_) {
        setState(() {
          _isInitialized1 = true;
        });
      });
    _controller8 = VideoPlayerController.asset('assets/photo/set9v3.mp4')
      ..initialize().then((_) {
        setState(() {
          _isInitialized1 = true;
        });
      });
    _controller9 = VideoPlayerController.asset('assets/photo/set9v4.mp4')
      ..initialize().then((_) {
        setState(() {
          _isInitialized1 = true;
        });
      });
    _controller10 = VideoPlayerController.asset('assets/photo/set10v3.mp4')
      ..initialize().then((_) {
        setState(() {
          _isInitialized1 = true;
        });
      });
    _controller11 = VideoPlayerController.asset('assets/photo/set11v4.mp4')
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

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
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
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    const Text(
                      'Visual Round',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Sans',
                        fontSize: 40.0,
                      ),
                    ),
                    // SizedBox(width: 20),

                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      questions[questionNumber]['question']!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontFamily: 'Sans',
                        fontSize: 36.0,
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 350,
                          width: 350,
                          child: questionNumber == 0
                              ? Container()
                              : questions[questionNumber]['answer'] ==
                                      'H\u2082O'
                                  ? _isInitialized
                                      ? Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            AspectRatio(
                                              aspectRatio:
                                                  _controller.value.aspectRatio,
                                              child: VideoPlayer(_controller),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                IconButton(
                                                  icon: Icon(_controller
                                                          .value.isPlaying
                                                      ? Icons.pause
                                                      : Icons.play_arrow),
                                                  onPressed: () {
                                                    setState(() {
                                                      _controller
                                                              .value.isPlaying
                                                          ? _controller.pause()
                                                          : _controller.play();
                                                    });
                                                  },
                                                )
                                              ],
                                            ),
                                          ],
                                        )
                                      : Container()
                                  : questions[questionNumber]['answer'] ==
                                          'Bidhya Chapagain'
                                      ? _isInitialized1
                                          ? Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                AspectRatio(
                                                  aspectRatio: _controller1
                                                      .value.aspectRatio,
                                                  child:
                                                      VideoPlayer(_controller1),
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    IconButton(
                                                      icon: Icon(_controller1
                                                              .value.isPlaying
                                                          ? Icons.pause
                                                          : Icons.play_arrow),
                                                      onPressed: () {
                                                        setState(() {
                                                          _controller1.value
                                                                  .isPlaying
                                                              ? _controller1
                                                                  .pause()
                                                              : _controller1
                                                                  .play();
                                                        });
                                                      },
                                                    )
                                                  ],
                                                ),
                                              ],
                                            )
                                          : Container()
                                      : questions[questionNumber]['answer'] ==
                                              '12 gau'
                                          ? _isInitialized1
                                              ? Stack(
                                                  alignment: Alignment.center,
                                                  children: [
                                                    AspectRatio(
                                                      aspectRatio: _controller2
                                                          .value.aspectRatio,
                                                      child: VideoPlayer(
                                                          _controller2),
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        IconButton(
                                                          icon: Icon(_controller2
                                                                  .value
                                                                  .isPlaying
                                                              ? Icons.pause
                                                              : Icons
                                                                  .play_arrow),
                                                          onPressed: () {
                                                            setState(() {
                                                              _controller2.value
                                                                      .isPlaying
                                                                  ? _controller2
                                                                      .pause()
                                                                  : _controller2
                                                                      .play();
                                                            });
                                                          },
                                                        )
                                                      ],
                                                    ),
                                                  ],
                                                )
                                              : Container()
                                          : questions[questionNumber]['answer'] ==
                                                  'aincho paincho'
                                              ? _isInitialized1
                                                  ? Stack(
                                                      alignment:
                                                          Alignment.center,
                                                      children: [
                                                        AspectRatio(
                                                          aspectRatio:
                                                              _controller3.value
                                                                  .aspectRatio,
                                                          child: VideoPlayer(
                                                              _controller3),
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            IconButton(
                                                              icon: Icon(_controller3
                                                                      .value
                                                                      .isPlaying
                                                                  ? Icons.pause
                                                                  : Icons
                                                                      .play_arrow),
                                                              onPressed: () {
                                                                setState(() {
                                                                  _controller3
                                                                          .value
                                                                          .isPlaying
                                                                      ? _controller3
                                                                          .pause()
                                                                      : _controller3
                                                                          .play();
                                                                });
                                                              },
                                                            )
                                                          ],
                                                        ),
                                                      ],
                                                    )
                                                  : Container()
                                              : questions[questionNumber]
                                                          ['answer'] ==
                                                      'Deepak bajracharya'
                                                  ? _isInitialized1
                                                      ? Stack(
                                                          alignment:
                                                              Alignment.center,
                                                          children: [
                                                            AspectRatio(
                                                              aspectRatio:
                                                                  _controller4
                                                                      .value
                                                                      .aspectRatio,
                                                              child: VideoPlayer(
                                                                  _controller4),
                                                            ),
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                IconButton(
                                                                  icon: Icon(_controller4
                                                                          .value
                                                                          .isPlaying
                                                                      ? Icons
                                                                          .pause
                                                                      : Icons
                                                                          .play_arrow),
                                                                  onPressed:
                                                                      () {
                                                                    setState(
                                                                        () {
                                                                      _controller4
                                                                              .value
                                                                              .isPlaying
                                                                          ? _controller4
                                                                              .pause()
                                                                          : _controller4
                                                                              .play();
                                                                    });
                                                                  },
                                                                )
                                                              ],
                                                            ),
                                                          ],
                                                        )
                                                      : Container()
                                                  : questions[questionNumber]
                                                              ['answer'] ==
                                                          'joystick'
                                                      ? _isInitialized1
                                                          ? Stack(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              children: [
                                                                AspectRatio(
                                                                  aspectRatio:
                                                                      _controller5
                                                                          .value
                                                                          .aspectRatio,
                                                                  child: VideoPlayer(
                                                                      _controller5),
                                                                ),
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    IconButton(
                                                                      icon: Icon(_controller5
                                                                              .value
                                                                              .isPlaying
                                                                          ? Icons
                                                                              .pause
                                                                          : Icons
                                                                              .play_arrow),
                                                                      onPressed:
                                                                          () {
                                                                        setState(
                                                                            () {
                                                                          _controller5.value.isPlaying
                                                                              ? _controller5.pause()
                                                                              : _controller5.play();
                                                                        });
                                                                      },
                                                                    )
                                                                  ],
                                                                ),
                                                              ],
                                                            )
                                                          : Container()
                                                      : questions[questionNumber]
                                                                  ['answer'] ==
                                                              'Bouddhanath temple'
                                                          ? _isInitialized1
                                                              ? Stack(
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
                                                                  children: [
                                                                    AspectRatio(
                                                                      aspectRatio: _controller6
                                                                          .value
                                                                          .aspectRatio,
                                                                      child: VideoPlayer(
                                                                          _controller6),
                                                                    ),
                                                                    Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        IconButton(
                                                                          icon: Icon(_controller6.value.isPlaying
                                                                              ? Icons.pause
                                                                              : Icons.play_arrow),
                                                                          onPressed:
                                                                              () {
                                                                            setState(() {
                                                                              _controller6.value.isPlaying ? _controller6.pause() : _controller6.play();
                                                                            });
                                                                          },
                                                                        )
                                                                      ],
                                                                    ),
                                                                  ],
                                                                )
                                                              : Container()
                                                          : questions[questionNumber][
                                                                      'answer'] ==
                                                                  'Kiran KC'
                                                              ? _isInitialized1
                                                                  ? Stack(
                                                                      alignment:
                                                                          Alignment
                                                                              .center,
                                                                      children: [
                                                                        AspectRatio(
                                                                          aspectRatio: _controller7
                                                                              .value
                                                                              .aspectRatio,
                                                                          child:
                                                                              VideoPlayer(_controller7),
                                                                        ),
                                                                        Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children: [
                                                                            IconButton(
                                                                              icon: Icon(_controller7.value.isPlaying ? Icons.pause : Icons.play_arrow),
                                                                              onPressed: () {
                                                                                setState(() {
                                                                                  _controller7.value.isPlaying ? _controller7.pause() : _controller7.play();
                                                                                });
                                                                              },
                                                                            )
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    )
                                                                  : Container()
                                                              : questions[questionNumber][
                                                                          'answer'] ==
                                                                      'Dolakha (kuri village)'
                                                                  ? _isInitialized1
                                                                      ? Stack(
                                                                          alignment:
                                                                              Alignment.center,
                                                                          children: [
                                                                            AspectRatio(
                                                                              aspectRatio: _controller8.value.aspectRatio,
                                                                              child: VideoPlayer(_controller8),
                                                                            ),
                                                                            Row(
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              children: [
                                                                                IconButton(
                                                                                  icon: Icon(_controller8.value.isPlaying ? Icons.pause : Icons.play_arrow),
                                                                                  onPressed: () {
                                                                                    setState(() {
                                                                                      _controller8.value.isPlaying ? _controller8.pause() : _controller8.play();
                                                                                    });
                                                                                  },
                                                                                )
                                                                              ],
                                                                            ),
                                                                          ],
                                                                        )
                                                                      : Container()
                                                                  : questions[questionNumber]['answer'] ==
                                                                          'Lalit rajbansi'
                                                                      ? _isInitialized1
                                                                          ? Stack(
                                                                              alignment: Alignment.center,
                                                                              children: [
                                                                                AspectRatio(
                                                                                  aspectRatio: _controller9.value.aspectRatio,
                                                                                  child: VideoPlayer(_controller9),
                                                                                ),
                                                                                Row(
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                  children: [
                                                                                    IconButton(
                                                                                      icon: Icon(_controller9.value.isPlaying ? Icons.pause : Icons.play_arrow),
                                                                                      onPressed: () {
                                                                                        setState(() {
                                                                                          _controller9.value.isPlaying ? _controller9.pause() : _controller9.play();
                                                                                        });
                                                                                      },
                                                                                    )
                                                                                  ],
                                                                                ),
                                                                              ],
                                                                            )
                                                                          : Container()
                                                                      : questions[questionNumber]['answer'] == 'Amrit gurung'
                                                                          ? _isInitialized1
                                                                              ? Stack(
                                                                                  alignment: Alignment.center,
                                                                                  children: [
                                                                                    AspectRatio(
                                                                                      aspectRatio: _controller10.value.aspectRatio,
                                                                                      child: VideoPlayer(_controller10),
                                                                                    ),
                                                                                    Row(
                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                      children: [
                                                                                        IconButton(
                                                                                          icon: Icon(_controller10.value.isPlaying ? Icons.pause : Icons.play_arrow),
                                                                                          onPressed: () {
                                                                                            setState(() {
                                                                                              _controller10.value.isPlaying ? _controller10.pause() : _controller10.play();
                                                                                            });
                                                                                          },
                                                                                        )
                                                                                      ],
                                                                                    ),
                                                                                  ],
                                                                                )
                                                                              : Container()
                                                                          : questions[questionNumber]['answer'] == 'Raju pariyar'
                                                                              ? _isInitialized1
                                                                                  ? Stack(
                                                                                      alignment: Alignment.center,
                                                                                      children: [
                                                                                        AspectRatio(
                                                                                          aspectRatio: _controller11.value.aspectRatio,
                                                                                          child: VideoPlayer(_controller11),
                                                                                        ),
                                                                                        Row(
                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                          children: [
                                                                                            IconButton(
                                                                                              icon: Icon(_controller11.value.isPlaying ? Icons.pause : Icons.play_arrow),
                                                                                              onPressed: () {
                                                                                                setState(() {
                                                                                                  _controller11.value.isPlaying ? _controller11.pause() : _controller11.play();
                                                                                                });
                                                                                              },
                                                                                            )
                                                                                          ],
                                                                                        ),
                                                                                      ],
                                                                                    )
                                                                                  : Container()
                                                                              : Image.asset(
                                                                                  questions[questionNumber]['image']!,
                                                                                  fit: BoxFit.cover, // This will fit the image inside the container while maintaining its aspect ratio.
                                                                                ),
                        ),
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
                                            fontSize: 28,
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

                            questionNumber = 1;
                          });
                        },
                        child: const Text("1")),
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            showAnswer = false;
                            questionNumber = 2;
                          });
                        },
                        child: const Text("2")),
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            showAnswer = false;

                            questionNumber = 3;
                          });
                        },
                        child: const Text("3")),
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            showAnswer = false;

                            questionNumber = 4;
                          });
                        },
                        child: const Text("4")),
                    CircularButton2(
                      icon: Icons.arrow_forward,
                      onTap: () {
                        Get.to(const AudioRound());
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
