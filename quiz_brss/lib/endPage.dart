import 'package:flutter/cupertino.dart';
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
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // First Text: Thank you for your participation!
                Text(
                  'Thank you for your participation!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50.0, // Larger font for the thank you message
                    fontFamily: 'sans',
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20), // Space between the messages

                // Second Text: Motivational Message
                Text(
                  'Remember, learning is a journey—keep moving forward, and great things will come.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize:
                        30.0, // Slightly smaller font for the motivational message
                    fontFamily: 'sans',
                    fontStyle: FontStyle.italic,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                    height:
                        20), // Space between the motivational message and the next message

                // Optional: Third Text (encouraging message)
                Text(
                  'We hope you learned something new!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0, // Size similar to the quote
                    fontFamily: 'sans',
                    fontWeight: FontWeight.normal,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            )),
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
