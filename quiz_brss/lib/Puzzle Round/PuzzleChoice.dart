import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_brss/Betting%20Round/Betting%20Round.dart';
import 'package:quiz_brss/Betting%20Round/BettingRoundRule.dart';
import 'package:quiz_brss/endPage.dart';
import 'package:quiz_brss/questions/Puzzel%20Round/puzzleRound.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'dart:async';
import '../Rapid Fire Round/RapidFireRound.dart';
import '../Widgets/CircularButton2.dart';

class PuzzleChoice extends StatefulWidget {
  const PuzzleChoice({super.key});

  @override
  State<PuzzleChoice> createState() => _PuzzleChoiceState();
}

class _PuzzleChoiceState extends State<PuzzleChoice> {
  int _start = 30;
  bool _isTimerFinished = false;
  bool _isTimerRunning = false;
  int questionCount = 0;
  bool showAnswer = false;
  AudioPlayer audioPlayer = AudioPlayer();

  Timer? _timer;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
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

  bool _isContainerVisible = false;

  final List<bool> _isChecked = List<bool>.filled(20, false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF001C42),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Image.asset(
              'background.png', // Replace with your image path
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 50, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Theme(
                    data: Theme.of(context).copyWith(
                      unselectedWidgetColor: Colors
                          .white, // Set the unchecked checkbox color to white
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          children: List.generate(8, (index) {
                            int questionNumber = index + 1;
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  _isTimerRunning == false
                                      ? startTimer()
                                      : () {};

                                  showQuestion(questionNumber);
                                  _isChecked[index] = !_isChecked[index];
                                });
                              },
                              child: Row(
                                children: [
                                  Checkbox(
                                    value: _isChecked[index],
                                    onChanged: (bool? value) {
                                      setState(() {
                                        _isTimerRunning == false
                                            ? startTimer()
                                            : () {};

                                        showQuestion(questionNumber);
                                        _isChecked[index] = value!;
                                      });
                                    },
                                    // Set the checked checkbox color to white
                                  ),
                                  Text(
                                    'Question $questionNumber',
                                    style: TextStyle(
                                      color: Colors
                                          .white, // Set the text color to white
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
                      child: Column(
                        children: [
                          Text(
                            QuestionList[questionCount]['question']!,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 40 // Set the text color to white
                                ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Text(
                            QuestionList[questionCount]['word']!,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 48 // Set the text color to white
                                ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              showAnswer
                                  ? Card(
                                      color: const Color.fromARGB(
                                          255, 16, 110, 65),
                                      elevation: 4,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Text(
                                          'ANS:-  ${QuestionList[questionCount]['answer']}',
                                          softWrap: true,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 40,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    )
                                  : SizedBox()
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
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
                          max: 30,
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
              padding: const EdgeInsets.all(8.0),
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
                    SizedBox(width: 20),
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            showAnswer = true;
                            _isTimerRunning = false;
                            _isTimerFinished = false;
                            _start = 30;
                            _timer!.cancel();
                          });
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green),
                        child: Text("Show Answer",
                            style: TextStyle(
                                fontWeight: FontWeight.w100,
                                color: Colors.white))),
                    SizedBox(width: 20),
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _isTimerRunning = false;
                            _isTimerFinished = false;
                            _start = 30;
                            _timer!.cancel();
                            _isContainerVisible = true;
                          });
                        },
                        child: Text("Complete")),
                    CircularButton(),
                    CircularButton2(
                      icon: Icons.arrow_forward,
                      onTap: () {
                        Get.to(BettingRoundRule());
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

class CircularButton extends StatelessWidget {
  const CircularButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.0,
      height: 80.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.blue,
      ),
      child: InkWell(
        onTap: () {
          Get.to(endPage());
        },
        child: Icon(
          Icons.hail_outlined,
          color: Colors.white,
          size: 40.0,
        ),
      ),
    );
  }
}

class Checklist extends StatefulWidget {
  const Checklist({super.key});

  @override
  _ChecklistState createState() => _ChecklistState();
}

class _ChecklistState extends State<Checklist> {
  final List<bool> _isChecked = List<bool>.filled(20, false);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        unselectedWidgetColor:
            Colors.white, // Set the unchecked checkbox color to white
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            children: List.generate(10, (index) {
              int questionNumber = index + 1;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    //  startTimer();
                    _isChecked[index] = !_isChecked[index];
                  });
                },
                child: Row(
                  children: [
                    Checkbox(
                      value: _isChecked[index],
                      onChanged: (bool? value) {
                        setState(() {
                          _isChecked[index] = value!;
                        });
                      },
                      // Set the checked checkbox color to white
                    ),
                    Text(
                      'Question $questionNumber',
                      style: TextStyle(
                        color: Colors.white, // Set the text color to white
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
          Column(
            children: List.generate(10, (index) {
              int questionNumber = index + 11;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _isChecked[index + 10] = !_isChecked[index + 10];
                  });
                },
                child: Row(
                  children: [
                    Checkbox(
                      value: _isChecked[index + 10],
                      onChanged: (bool? value) {
                        setState(() {
                          _isChecked[index + 10] = value!;
                        });
                      },
                      // Set the checked checkbox color to white
                    ),
                    Text(
                      'Question $questionNumber',
                      style: TextStyle(
                        color: Colors.white, // Set the text color to white
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
