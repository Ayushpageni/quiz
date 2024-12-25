import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'dart:async';
import '../Buzzer Round/BuzzerRound.dart';
import '../Widgets/CircularButton2.dart';
import '../questions/General Round/generalQuestionSets.dart';

class Choice extends StatefulWidget {
  const Choice({super.key});

  @override
  State<Choice> createState() => _ChoiceState();
}

class _ChoiceState extends State<Choice> {
  bool showAnswer = false;

  int _start = 45;
  int questionCount = 0;
  bool _isTimerFinished = false;
  bool _isTimerRunning = false;
  bool _isPassTimerFinished = false;
  bool _isPassTimerRunning = false;

  Timer? _timer;
  AudioPlayer audioPlayer = AudioPlayer();

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
    setState(() {
      showAnswer = false;
      questionCount = number;
      print(number);
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
            _isPassTimerFinished = true;
          });
          timer.cancel();
        } else {
          setState(() {
            _start--;
            _isTimerRunning = true;
            _isPassTimerRunning = true;
          });
        }
      },
    );
  }

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
                // mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.start,
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
                          children: List.generate(10, (index) {
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
                        SizedBox(
                          width: 30,
                        ),
                        Column(
                          children: List.generate(10, (index) {
                            int questionNumber = index + 11;
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  _isTimerRunning == false
                                      ? startTimer()
                                      : () {};
                                  showQuestion(questionNumber);
                                  _isChecked[index + 10] =
                                      !_isChecked[index + 10];
                                });
                              },
                              child: Row(
                                children: [
                                  Checkbox(
                                    value: _isChecked[index + 10],
                                    onChanged: (bool? value) {
                                      setState(() {
                                        showQuestion(questionNumber);
                                        _isTimerRunning == false
                                            ? startTimer()
                                            : () {};
                                        _isChecked[index + 10] = value!;
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
                      padding: const EdgeInsets.fromLTRB(36, 0, 0, 0),
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  questionCount == 0
                                      ? ''
                                      : 'Question no ' +
                                          QuestionList[questionCount]
                                              ['questionno']! +
                                          ":",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 48, // Set the text color to white
                                  ),
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                Text(
                                  QuestionList[questionCount]['question'] ?? '',
                                  softWrap: true,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 40, // Set the text color to white
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
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(16.0),
                                              child: Text(
                                                'ANS:-  ${QuestionList[questionCount]['answer']}',
                                                softWrap: true,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 36,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          )
                                        : SizedBox()
                                  ],
                                ), // Use SizedBox to add empty space if the answer is not shown
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment:
                  MainAxisAlignment.end, // Align children to the right
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 15, 150),
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
                            startAngle: 0,
                            angleRange: 360,
                            customWidths: CustomSliderWidths(
                              trackWidth: 36,
                              progressBarWidth: 20,
                              handlerSize: 7,
                            ),
                          ),
                          min: 0,
                          max: 45,
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
                                    fontSize: 36,
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
                            color: _isTimerFinished || _isPassTimerFinished
                                ? Colors.red
                                : Colors.white,
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
                            _isTimerRunning = false;
                            _isTimerFinished = false;
                            _isPassTimerRunning = false;
                            _isPassTimerFinished = false;
                            _start = 45;
                            _timer!.cancel();
                          });
                        },
                        child: Text(
                          "Restart",
                        )),
                    ElevatedButton(
                        onPressed: () {
                          _isTimerFinished = false;
                          _isPassTimerFinished = false;
                          setState(() {
                            _isPassTimerRunning == true
                                ? _timer!.cancel()
                                : _isPassTimerRunning = true;

                            _start = 10;
                            startTimer();
                          });
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepOrange),
                        child: Text(
                          "Pass",
                          style: TextStyle(
                              fontWeight: FontWeight.w100, color: Colors.white),
                        )),
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            showAnswer = true;
                            // showAnswer = true;
                            _isTimerFinished = false;
                            _isPassTimerFinished = false;
                            _isTimerRunning = false;
                            _isTimerFinished = false;
                            _start = 45;
                            _timer!.cancel();
                          });
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green),
                        child: Text(
                          "Show Answer",
                          style: TextStyle(
                              fontWeight: FontWeight.w100, color: Colors.white),
                        )),
                    CircularButton2(
                      icon: Icons.arrow_forward,
                      onTap: () {
                        Get.to(BuzzerRound());
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
