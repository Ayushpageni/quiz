import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Widgets/CircularButton2.dart';
import 'Choice.dart';

class GeneralRound extends StatefulWidget {
  const GeneralRound({super.key});

  @override
  State<GeneralRound> createState() => _GeneralRoundState();
}

class _GeneralRoundState extends State<GeneralRound> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF001C42),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Image.asset(
              'background.png', // Replace with your image path
              fit: BoxFit.cover,
            ),
            const Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(top: 60.0),
                child: Text(
                  '     Round 1: General Round',
                  style: TextStyle(
                      fontSize: 48,
                      fontFamily: 'sans',
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '1. Each participant/team will be asked a set of general knowledge questions.',
                      style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'sans',
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      '2. The time limit for each question is 45 seconds.',
                      style: TextStyle(
                        fontSize: 27,
                        fontFamily: 'sans',
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      '3. Points for each correct answer is (10 points for the directly asked question & 5 points for the passed question).',
                      style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'sans',
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      '4. No negative markings for incorrect answers.',
                      style: TextStyle(
                        fontSize: 27,
                        fontFamily: 'sans',
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
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
                    const SizedBox(width: 20),
                    CircularButton2(
                      icon: Icons.arrow_forward,
                      onTap: () {
                        Get.to(const Choice());
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
