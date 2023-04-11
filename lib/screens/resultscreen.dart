import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:lottie/lottie.dart";
import "package:project/screens/homescreen.dart";
import "package:project/widgets/leftcardwidget.dart";
import "package:project/widgets/rightcardwidget.dart";

import "../constants.dart";
import "audiojournel.dart";
import "musicplayer.dart";

class ResultScreen extends StatefulWidget {
  const ResultScreen({Key? key, required this.score}) : super(key: key);

  final int score;

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}



class _ResultScreenState extends State<ResultScreen> {
  late final String message;
  void messageDisplay() {
    if (widget.score < 4 || widget.score > 0) {
      message = "Not Depressed";
    } else if (widget.score <= 9 || widget.score > 5) {
      message = "Mild Depression";
    } else if (widget.score <= 14 || widget.score > 10) {
      message = "Moderate Depression";
    } else if (widget.score <= 19 || widget.score > 15) {
      message = "Moderately Severe Depression";
    } else if (widget.score <= 27 || widget.score > 20) {
      message = "Severe Depression";
    } else {
      message = "Fine";
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    messageDisplay();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff95D5B2),
        body: Padding(
          padding: EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.arrow_back_ios),
                    SizedBox(
                      width: 105,
                    ),
                    Text(
                      "Analysis",
                      style: h1,
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.all(30),
                  height: screenHeight * 0.45,
                  width: screenWidth * 0.90,
                  decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(30)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          "Hey you",
                          style: titlefont,
                        ),
                      ),
                      Center(
                        child: Lottie.network(
                            'https://assets2.lottiefiles.com/packages/lf20_tijmpky4.json',
                            height: screenHeight * 0.27),
                      ),
                      Text(
                        message,
                        style: h1,
                      ),
                    ],
                  ),
                ),
                LeftCard(
                    heading: "Meditate",
                    title: 'Breathe in calm, breathe out stress',
                    text:
                        'Stressed? Anxious?  Find your calm with daily meditation.',
                    images: 'meditate',
                    screenHeight: screenHeight,
                    myFunction: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>  MediationMusic(),
                        ),
                      );
                    }),
                RightCard(
                  heading: "Hangout",
                  title: 'Join Discord of friend ',
                  text: "Friends are the family we choose for ourselves,get membership",
                  images: 'friends',
                  screenHeight: screenHeight,
                  myFunction: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
