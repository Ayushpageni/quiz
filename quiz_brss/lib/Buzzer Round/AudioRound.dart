import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:audioplayers/audioplayers.dart';
import 'package:quiz_brss/questions/Burzer%20Round/audioRound.dart';

import '../Puzzle Round/PuzzleRound.dart';
import '../Widgets/CircularButton2.dart';

class AudioRound extends StatefulWidget {
  const AudioRound({super.key});

  @override
  State<AudioRound> createState() => _AudioRoundState();
}

class _AudioRoundState extends State<AudioRound> {
  late AudioPlayer audioPlayer;
  late String audioUrl = questions[1]["audio"]!;
  bool isPlaying = false;
  bool showAnswer = false;
  int questionNumber = 0;
  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  Future<void> playAudio() async {
    int result = await audioPlayer.play(audioUrl);
    if (result == 1) {
      setState(() {
        isPlaying = true;
      });
    }
  }

  Future<void> pauseAudio() async {
    int result = await audioPlayer.pause();
    if (result == 1) {
      setState(() {
        isPlaying = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF001C42),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              'background.png', // Replace with your background image path
              fit: BoxFit.cover,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    questions[questionNumber]["question"]!,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Sans',
                      fontSize: 40.0,
                    ),
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        isPlaying ? 'Audio is playing' : 'Audio is paused',
                        style: TextStyle(fontSize: 20.0, color: Colors.white),
                      ),
                      SizedBox(height: 20.0),
                      ElevatedButton(
                        onPressed: isPlaying ? pauseAudio : playAudio,
                        child: Text(isPlaying ? 'Pause' : 'Play'),
                      ),
                      SizedBox(height: 20.0),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          showAnswer
                              ? Card(
                                  color: const Color.fromARGB(255, 16, 110, 65),
                                  elevation: 4,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Text(
                                      questions[questionNumber]['answer']!,
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
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          showAnswer = true;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green),
                      child: Text("Show Answer"),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            showAnswer = false;

                            questionNumber = 1;
                            audioUrl = questions[1]['audio']!;
                          });
                        },
                        child: Text("1")),
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            showAnswer = false;

                            questionNumber = 2;
                            audioUrl = questions[2]['audio']!;
                          });
                        },
                        child: Text("2")),
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            showAnswer = false;

                            questionNumber = 3;
                            audioUrl = questions[3]['audio']!;
                          });
                        },
                        child: Text("3")),
                    ElevatedButton(
                        onPressed: () {
                          showAnswer = false;

                          setState(() {
                            questionNumber = 4;
                            audioUrl = questions[4]['audio']!;
                          });
                        },
                        child: Text("4")),
                    CircularButton2(
                      icon: Icons.arrow_forward,
                      onTap: () {
                        Get.to(PuzzleRound());
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

// class AudioPlayerScreen extends StatefulWidget {
//   final String songUrl;
//   AudioPlayerScreen({required this.songUrl});
//   @override
//   _AudioPlayerScreenState createState() => _AudioPlayerScreenState();
// }

// class _AudioPlayerScreenState extends State<AudioPlayerScreen> {
//   late AudioPlayer audioPlayer;
//   late String audioUrl = widget.songUrl;
//   bool isPlaying = false;

//   @override
//   void initState() {
//     super.initState();
//     audioPlayer = AudioPlayer();
//   }

//   @override
//   void dispose() {
//     audioPlayer.dispose();
//     super.dispose();
//   }

//   Future<void> playAudio() async {
//     int result = await audioPlayer.play(audioUrl);
//     if (result == 1) {
//       setState(() {
//         isPlaying = true;
//       });
//     }
//   }

//   Future<void> pauseAudio() async {
//     int result = await audioPlayer.pause();
//     if (result == 1) {
//       setState(() {
//         isPlaying = false;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           Text(
//             isPlaying ? 'Audio is playing' : 'Audio is paused',
//             style: TextStyle(fontSize: 20.0, color: Colors.white),
//           ),
//           SizedBox(height: 20.0),
//           ElevatedButton(
//             child: Text(isPlaying ? 'Pause' : 'Play'),
//             onPressed: isPlaying ? pauseAudio : playAudio,
//           ),
//         ],
//       ),
//     );
//   }
// }
