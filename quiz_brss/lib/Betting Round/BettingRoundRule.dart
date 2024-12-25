import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_brss/Betting%20Round/Betting%20Round.dart';
import 'package:quiz_brss/Puzzle%20Round/PuzzleChoice.dart';

import '../Widgets/CircularButton2.dart';

class BettingRoundRule extends StatefulWidget {
  const BettingRoundRule({super.key});

  @override
  State<BettingRoundRule> createState() => _BettingRoundRuleState();
}

class _BettingRoundRuleState extends State<BettingRoundRule> {
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
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Text(
                  'Round 3: Betting Round: ',
                  style: TextStyle(
                    fontSize: 36.0,
                    fontFamily: 'sans',
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  '1. There will be 1 question to each team\n\n'
                  '2. All the participants will be given one minute to answer the question\n\n'
                  '3. Group on their turn must bet for the marks 1-20 before showing the question,\n\n     If their answer is correct they will be awarded by two times their betting marks,\n\n     If the answer is wrong betting marks will be deducted\n\n',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontFamily: 'sans',
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.left,
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
                        Get.back();
                      },
                    ),
                    SizedBox(width: 20),
                    CircularButton2(
                      icon: Icons.arrow_forward,
                      onTap: () {
                        Get.to(BettingRound());
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
