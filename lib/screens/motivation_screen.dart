import 'package:flutter/material.dart';
import '../constants.dart';
import '../quotesList.dart';

class MotivationScreen extends StatefulWidget {
  const MotivationScreen({Key? key}) : super(key: key);

  @override
  State<MotivationScreen> createState() => _MotivationScreenState();
}

int quoteno = 0;

class _MotivationScreenState extends State<MotivationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        toolbarHeight: 60,
        backgroundColor: Color(0xff569DAA),
        title: Text(
          "Moody Quoty",
          style: TextStyle(
              fontFamily: 'Product', fontSize: 19, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xff87CBB9),
                Color(0xff569DAA),
                Color(0xff19A7CE)
              ]),
        ),
        child: Center(
          child: Column(
            children: [
              Expanded(
                flex: 9,
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        quotes[quoteno],
                        style: h1,
                      ),
                      Text(
                        author[quoteno],
                        style: h1,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    margin: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: Color(0xffF9F5EB),
                        borderRadius: BorderRadius.circular(50)),
                    child: Center(
                        child: Text(
                      "Next",
                      style: TextStyle(
                          fontFamily: 'Product',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff40916C)),
                    )),
                    height: 60,
                    width: 140,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
