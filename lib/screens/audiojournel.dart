import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:project/screens/audioresult.dart';
import 'package:project/screens/resultAI.dart';
import 'package:project/screens/resultscreen.dart';
import 'package:simple_ripple_animation/simple_ripple_animation.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:permission_handler/permission_handler.dart';
import 'package:record_mp3/record_mp3.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:simple_ripple_animation/simple_ripple_animation.dart';

import '../constants.dart';

class AudioJournel extends StatefulWidget {
  const AudioJournel({Key? key}) : super(key: key);

  @override
  State<AudioJournel> createState() => _AudioJournelState();
}

class _AudioJournelState extends State<AudioJournel> {
  String? selectedAudio;
  String message = "Double tap to start recording";
  String mood = "Not sure";
  String statusText = "";
  bool isComplete = false;
  String recordFilePath = '';
  int i = 1;
  bool boolanimate = false;
  bool stopbool = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    //recorder.closeRecorder();
    super.dispose();
  }

  Future<bool> checkPermission() async {
    if (!await Permission.microphone.isGranted) {
      PermissionStatus status = await Permission.microphone.request();
      if (status != PermissionStatus.granted) {
        return false;
      }
    }
    return true;
  }

  void startRecord() async {
    i++;
    bool hasPermission = await checkPermission();
    if (hasPermission) {
      statusText = "Recording...";
      recordFilePath = await getFilePath();
      isComplete = false;
      RecordMp3.instance.start(recordFilePath, (type) {
        statusText = "Record error--->$type";
        setState(() {
          selectedAudio = recordFilePath;
        });
      });
      print("Recording in Progressssssssssssssss");
      print(recordFilePath);
    } else {
      statusText = "No microphone permission";
    }
    setState(() {});
  }

  void stopRecord() {
    bool s = RecordMp3.instance.stop();
    if (s) {
      statusText = "Record complete";
      isComplete = true;
      setState(() {
        selectedAudio = recordFilePath;
      });
    }
    print("Recording Stopped");
  }

  Future<String> getFilePath() async {
    Directory storageDirectory = await getApplicationDocumentsDirectory();
    String sdPath = storageDirectory.path + "/record";
    var d = Directory(sdPath);
    if (!d.existsSync()) {
      d.createSync(recursive: true);
    }
    return sdPath + "/testaudio${i}.mp3";
  }

  //File selector
  selectfile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      String filepath = result.files.single.path!;
      setState(() {
        selectedAudio = filepath;
      });
      return filepath;
    } else {
      // User canceled the picker
    }
  }

  //File Uploader
  Future<void> sendAudioFile(String url, String filePath) async {
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.files.add(await http.MultipartFile.fromPath('file', filePath));
    request.headers.addAll({'Content-Type': 'audio/mp3'});
    var response = await request.send();
    final respStr = await response.stream.bytesToString();
    print(respStr);
    if (kDebugMode) {
      print(response.statusCode);
    }

    if (response.statusCode == 200) {
      setState(() {
        mood = respStr;
      });
      // var data = jsonDecode(response.body);
      if (kDebugMode) {
        print(
            "Succesfully sent file Succesfully sent file Succesfully sent file Succesfully sent file Succesfully sent file");
      }
      // Handle successful response
    } else {
      // Handle error response
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff1c1c27),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xff1c1c27),
          title: Padding(
            padding: const EdgeInsets.only(top: 18.0, left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/back.png',
                  height: 35,
                ),
                Image.asset(
                  'assets/report.png',
                  height: 35,
                )
              ],
            ),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xff1c1c27),
                    Color(0xff191a23),
                    Color(0xff1a1b24),
                    Color(0xff1b1f29),
                    Color(0xff1a1b24)
                  ]),
            ),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    // Future.delayed(Duration(seconds: 3), () {
                    //   // Do something
                    //   sendAudioFile("https://pythonmodelapi.pythonanywhere.com/",
                    //       selectedAudio!);
                    //   //Sending Audio via Http Request
                    // });
                  },
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Speaking to Serenity AI",
                        style: TextStyle(
                            fontFamily: 'Product',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Go ahead I'm listening",
                        style: TextStyle(
                            fontFamily: 'Product',
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      ),
                      Lottie.network(
                          "https://assets8.lottiefiles.com/packages/lf20_ofa3xwo7.json",
                          height: screenHeight * 0.45,
                          animate: boolanimate),
                    ],
                  ),
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        selectfile();
                      },
                      child: RippleAnimation(
                        color: Colors.deepOrange,
                        delay: const Duration(milliseconds: 300),
                        repeat: true,
                        minRadius: 0,
                        ripplesCount: 6,
                        duration: const Duration(milliseconds: 6 * 300),
                        child: GestureDetector(
                          onTap: () {
                            startRecord();

                            // sendAudioFile(
                            //     "https://pythonmodelapi.pythonanywhere.com/",
                            //     selectedAudio!);
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) =>
                            //           AudioResult(moodkaisahai: mood)),
                            // );
                            setState(() {
                              stopbool = true;
                              boolanimate = true;
                            });
                            if (kDebugMode) {
                              print('I got Clicked');
                            }
                          },
                          child: Lottie.network(
                              'https://assets9.lottiefiles.com/packages/lf20_kujkzll7.json',
                              height: screenHeight * 0.2,
                              animate: boolanimate),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 5.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            mood,
                            style: const TextStyle(
                                fontFamily: 'Product',
                                fontSize: 30,
                                fontWeight: FontWeight.normal,
                                color: Colors.grey),
                          ),
                          Visibility(
                            visible: stopbool,
                            child: GestureDetector(
                              onTap: () {
                                stopRecord();
                                boolanimate = false;
                                Future.delayed(Duration(milliseconds: 500), () {
                                  // Do something
                                  sendAudioFile(
                                      "https://pythonmodelapi.pythonanywhere.com/",
                                      selectedAudio!);
                                  //Sending Audio via Http Request
                                });
                                Future.delayed(Duration(seconds: 5), () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ResultSerenity(result: mood),
                                    ),
                                  );
                                });
                              },
                              child: Lottie.network(
                                  "https://assets1.lottiefiles.com/packages/lf20_jc07xo0r.json",
                                  height: 100),
                            ),
                          ),
                          //Image.asset('assets/remove.png',height: 25,)
                        ],
                      ),
                    )
                  ],
                ),
                // Expanded(
                //   flex: 1,
                //   child: Container(
                //     margin: EdgeInsets.all(35),
                //     height: screenHeight * 0.3,
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //       children: [
                //         GestureDetector(
                //             onTap: () {
                //               startRecord();
                //             },
                //             child: Image.asset("assets/record.png")),
                //         GestureDetector(
                //             onTap: () {
                //               stopRecord();
                //             },
                //             child: Image.asset("assets/stop.png")),
                //       ],
                //     ),
                //   ),
                // ),
                // Text(
                //   mood,
                //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
