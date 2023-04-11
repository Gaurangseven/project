import 'package:flutter/material.dart';

import 'package:audioplayers/audioplayers.dart';
import 'package:lottie/lottie.dart';

import '../constants.dart';

class MediationMusic extends StatefulWidget {
  const MediationMusic({Key? key}) : super(key: key);

  @override
  State<MediationMusic> createState() => _MediationMusicState();
}

class _MediationMusicState extends State<MediationMusic> {
  final player = AudioPlayer();
  int no = 0;
  List<String> imgUrl = [

    "https://assets6.lottiefiles.com/packages/lf20_kvwtrk4n.json",
    "https://assets5.lottiefiles.com/private_files/lf30_zzItmF.json",
    "https://assets5.lottiefiles.com/packages/lf20_iombyzfq.json",
    "https://assets5.lottiefiles.com/packages/lf20_ndzS1Z.json",
    "https://assets6.lottiefiles.com/packages/lf20_DyXIVc.json",
    "https://assets5.lottiefiles.com/private_files/lf30_7iqz36ms.json",
    "https://assets5.lottiefiles.com/packages/lf20_NWL56CVs6W.json",


  ];

  void play() {
    player.play(AssetSource('$no.mp3'));
  }

  void stop() {
    player.pause();
  }

  void change() {
    if (no < 5) {
      setState(() {
        no = no + 1;
      });
    } else {
      no = 0;
    }
    // player.stop();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    player.dispose();

  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 5,shadowColor: Colors.black26,
        toolbarHeight: 75,
        centerTitle: true,
        title: Text(
          "Musilify",
          style: TextStyle(
              fontFamily: 'Product',
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.black),
        ),
        backgroundColor: Color(0xffF7F9FF),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Container(
                  height: screenHeight * 0.7,
                  width: screenWidth * 0.9,
                  decoration: BoxDecoration(
                      color: Color(0xffFBFBFB),
                      borderRadius: BorderRadius.circular(25)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child:
                        Lottie.network(imgUrl[no], height: screenHeight * 0.7),
                  )),
              Container(
                decoration: BoxDecoration(
                    color: Color(0xffEEEEEE),
                    borderRadius: BorderRadius.circular(75)),
                height: screenHeight * 0.1,
                width: screenWidth * 0.8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        print('Click hua hai');
                        play();
                      },
                      child: Image.asset(
                        'assets/play.png',
                        height: 40,
                        width: 100,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        stop();
                      },
                      child: Image.asset(
                        'assets/stop.png',
                        height: 40,
                        width: 100,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        change();
                        play();
                      },
                      child: Image.asset(
                        'assets/exchange.png',
                        height: 40,
                        width: 100,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
