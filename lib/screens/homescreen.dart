import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:project/screens/detectioncategory.dart';

import 'package:project/screens/motivation_screen.dart';
import 'package:project/screens/musicplayer.dart';
import 'package:project/widgets/leftcardwidget.dart';
import 'package:project/widgets/rightcardwidget.dart';
import '../constants.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  Future<void> _launchUrl() async {
    if (!await launchUrl(Uri.parse("https://discord.gg/b8FAscdJtC"))) {
      throw Exception('Could not launch');
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xffABC4AA),
        appBar: AppBar(
          backgroundColor: Color(0xffD8F3DC),
          toolbarHeight: 0,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(25.0),
                  child: SizedBox(
                    height: screenHeight * 0.20,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              'assets/logo1.png',
                              height: screenHeight * 0.10,
                            ),
                            CircleAvatar(
                              backgroundImage: NetworkImage(
                                  'https://images.pexels.com/photos/1553783/pexels-photo-1553783.jpeg?auto=compress&cs=tinysrgb&w=600'),
                              radius: 35,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Text(
                                  'Hey Hola',
                                  style: h1,
                                ),
                                Text(
                                  'How are you today ?',
                                  style: h2,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      LeftCard(
                        heading: 'Detection',
                        title: 'Take control of your mental health',
                        text:
                            'Depression can affect anyone. Don\'t let it go undetected.',
                        images: 'img2',
                        screenHeight: screenHeight,
                        myFunction: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetectionScreen(),
                            ),
                          );
                        },
                      ),
                      RightCard(
                        heading: 'Music Meditation',
                        title: 'Breathe in calm, breathe out stress',
                        text:
                            'Stressed? Anxious?                            Find your calm with daily meditation.',
                        images: 'meditate',
                        screenHeight: screenHeight,
                        myFunction: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MediationMusic(),
                            ),
                          );
                        },
                      ),
                      LeftCard(
                        heading: 'Moody Quoty',
                        text: 'Quotes define you',
                        title: 'Positive quote is like big push to better you',
                        images: 'audio',
                        screenHeight: screenHeight,
                        myFunction: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MotivationScreen()),
                          );
                        },
                      ),
                      Container(
                        height: screenHeight * 0.25,
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Color(0xffECF2FF),
                        ),
                        child: Center(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 18.0),
                                child: Text(
                                  "Fact Box",
                                  style: head,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        left: 25,
                                        right: 25,
                                      ),
                                      child: Text(
                                        "Type of content you watch has a lot to offer to your depression",
                                        style: textregular,
                                      ),
                                    ),
                                  ),
                                  Lottie.network(
                                      "https://assets3.lottiefiles.com/packages/lf20_ik4jyixs.json",
                                      height: screenHeight * 0.2,
                                      width: screenWidth * 0.3),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: screenHeight * 0.35,
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Color(0xffF7F7F7),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Community",
                              style: head,
                            ),
                            Padding(
                              padding: EdgeInsets.all(18.0),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(25),
                                  child: Image.network(
                                    "https://images.pexels.com/photos/3856027/pexels-photo-3856027.jpeg?auto=compress&cs=tinysrgb&w=600",
                                    fit: BoxFit.cover,
                                    height: screenHeight * 0.2,
                                    width: screenWidth * 0.9,
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Text(
                                  "Your struggles with depression matter to us.",
                                  style: textregular),
                            ),
                            GestureDetector(
                              onTap: () {
                                print("I got clicked");
                                _launchUrl();
                              },
                              child: const Center(
                                child: Text(
                                  "Join Us",
                                  style: TextStyle(
                                      fontFamily: 'Product',
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff11698E)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.10,
                        child: Column(
                          children: [
                            Text(
                              'Top 15 at HACK 36 2023',
                              style: TextStyle(fontFamily:'Product',fontSize: 15,fontWeight: FontWeight.w300),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/copyright.png',
                                  height: 20,
                                ),
                                SizedBox(
                                  width: 7,
                                ),
                                Text(
                                  'MindEvoke',
                                  style: TextStyle(
                                      fontFamily: 'Product',
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff064420)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
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
