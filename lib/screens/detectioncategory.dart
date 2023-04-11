import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:project/screens/audiojournel.dart';
import 'package:project/screens/phqquestionscreen.dart';

import '../constants.dart';

class DetectionScreen extends StatelessWidget {
  const DetectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff183A1D),
        title: Row(
          children:  [
            Text("MindEvoke",style: textregular,),
          ],
        ),
      ),
      backgroundColor: Color(0xffABC4AA),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xff40916C),Color(0xff2B3467), Color(0xff40916C)],
            ),
          ),
          child: Center(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  height: screenHeight * 0.40,
                  width: screenWidth * 0.70,
                  decoration: BoxDecoration(
                      color: Color(0xff142F43),
                      borderRadius: BorderRadius.circular(30)),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          "PHQ Test",
                          style: TextStyle(fontFamily:'Product',fontSize: 18,fontWeight: FontWeight.bold,color: Color(0xffECF2FF)),
                        ),
                      ),
                      Center(
                        child: Lottie.network(
                            'https://assets8.lottiefiles.com/packages/lf20_1ef7g2lw.json',
                            height: screenHeight * 0.27),
                      ),
                      Text(
                        "Standardized Test",
                        style: TextStyle(fontFamily:'Product',fontSize: 16,fontWeight: FontWeight.normal,color: Colors.white),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            if (kDebugMode) {
                              print("shola");
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const PhqTest()),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              // minimumSize: const Size(180, 40),
                              backgroundColor: const Color(0xff2B845B)),
                          child: const Text("Start")),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  height: screenHeight * 0.40,
                  width: screenWidth * 0.70,
                  decoration: BoxDecoration(
                      color: Color(0xff142F43),
                      borderRadius: BorderRadius.circular(30)),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0,bottom: 0),
                        child: Text(
                          "Audio Journel",
                          style: TextStyle(fontFamily:'Product',fontSize: 18,fontWeight: FontWeight.bold,color: Color(0xffECF2FF)),
                        ),
                      ),
                      Center(
                        child: Lottie.network(
                            'https://assets6.lottiefiles.com/packages/lf20_2aeiRxOcfs.json',
                            height: screenHeight * 0.27),
                      ),
                      Text(
                        " Serenity AI ",
                        style: TextStyle(fontFamily:'Product',fontSize: 16,fontWeight: FontWeight.normal,color: Colors.white),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            if (kDebugMode) {
                              print("shola");
                            }
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const AudioJournel()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                              // minimumSize: const Size(180, 40),
                              backgroundColor: const Color(0xff2B845B)),
                          child: const Text("Start")),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
