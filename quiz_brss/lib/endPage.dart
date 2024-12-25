import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_brss/FirstPage.dart';

class endPage extends StatefulWidget {
  const endPage({super.key});

  @override
  State<endPage> createState() => _endPageState();
}

class _endPageState extends State<endPage> {
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
            Center(
              child: Text(
                ' The END',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 90.0,
                  fontFamily: 'sans',
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Positioned(
              bottom: 20.0,
              right: 20.0,
              child: CircularButton(),
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
        color: Colors.white,
      ),
      child: InkWell(
        onTap: () {
          print("HELLO");
          Get.to(FirstPage());
        },
        child: Icon(
          Icons.home_outlined,
          color: Colors.green,
          size: 80.0,
        ),
      ),
    );
  }
}
