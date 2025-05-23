import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'General Round/GeneralRound.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF001C42),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(
            'bg.jpg', // Replace with your image path
            fit: BoxFit.fill,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(30, 0, 0, 50),
                child: CircularButton(),
              ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.end,
              //     children: [
              //       Center(
              //         child:
              //       ),
              //       SizedBox(
              //         width: 20,
              //       ),
              //     ],
              //   ),
              // ),
              // SizedBox(
              //   height: 50,
              // ),
            ],
          ),
        ],
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
          // color: Color(0xFF235B90),
          color: Colors.deepPurple),
      child: InkWell(
        onTap: () {
          Get.to(GeneralRound());
        },
        child: Icon(
          Icons.arrow_right,
          color: Colors.white,
          size: 80.0,
        ),
      ),
    );
  }
}
