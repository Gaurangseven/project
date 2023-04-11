import "package:flutter/material.dart";
import "package:project/phqquestions.dart";
import "package:project/screens/resultscreen.dart";

import "../constants.dart";
import "../widgets/optionpad.dart";
import "audiojournel.dart";

class PhqTest extends StatefulWidget {
  const PhqTest({Key? key}) : super(key: key);

  @override
  State<PhqTest> createState() => _PhqTestState();
}

int Score = 0;
int questionno = 0;

class _PhqTestState extends State<PhqTest> {
  void updateQuestion() {
    if (questionno < 8) {
      if (mounted) {
        setState(() {
          questionno++;
        }); // perform operation or update state
      }
    } else if (questionno == 8) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ResultScreen(score: Score)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xff95D5B2),
        body: SafeArea(
          child: Center(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: screenHeight * 0.10,
                    child: Row(
                       mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        Text(
                          "Questionare",
                          style: h1,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                            child: Text(
                              "Question $questionno/8",
                              style: h1,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(19.0),
                            child: Center(
                                child: Text(
                              "Over the last two weeks, how often have you been bothered by any of the following problems?",
                              style: titlefont,
                            )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10.0, right: 10, bottom: 20),
                            child: Center(
                                child: Text(
                              phqquestion[questionno],
                              style: questions,
                            )),
                          ),
                          GestureDetector(
                            onTap: () {
                              print(questionno);
                              updateQuestion();
                              setState(() {
                                Score = Score + 1;
                              });
                            },
                            child: optionPad(
                              screenHeight: screenHeight,
                              screenWidth: screenWidth,
                              text: "Not at all",
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              updateQuestion();
                              setState(() {
                                Score = Score + 2;
                              });
                            },
                            child: optionPad(
                              screenHeight: screenHeight,
                              screenWidth: screenWidth,
                              text: "Several Days",
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              updateQuestion();
                              print(Score);
                              setState(() {
                                Score = Score + 3;
                              });
                            },
                            child: optionPad(
                              screenHeight: screenHeight,
                              screenWidth: screenWidth,
                              text: "More than half the day",
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              updateQuestion();
                              print(Score);
                              setState(() {
                                Score = Score + 4;
                              });
                            },
                            child: optionPad(
                              screenHeight: screenHeight,
                              screenWidth: screenWidth,
                              text: "Nearly every day",
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
