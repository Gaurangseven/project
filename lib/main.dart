import 'package:flutter/material.dart';
import 'package:project/screens/audiojournel.dart';
import 'package:project/screens/detectioncategory.dart';
import 'package:project/screens/homescreen.dart';
import 'package:project/screens/musicplayer.dart';
import 'package:project/screens/phqquestionscreen.dart';
import 'package:project/screens/resultscreen.dart';
import 'package:project/screens/screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}
