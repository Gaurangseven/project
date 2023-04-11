import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:project/screens/detectioncategory.dart';
import '../constants.dart';

class LeftCard extends StatelessWidget {
  const LeftCard({
    super.key,
    required this.heading,
    required this.title,
    required this.text,
    required this.images, required this.screenHeight, required this.myFunction,
  });
  final Function myFunction;
  final String heading;
  final String title;
  final String text;
  final String images;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: const Color(0xffF8F9FA),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20,),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    heading,
                    style: head,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    title,
                    style: titlefont,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    text,
                    style: textregular,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (kDebugMode) {
                          print("shola");
                         myFunction();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        // minimumSize: const Size(180, 40),
                          backgroundColor: const Color(0xff2B845B)),
                      child: const Text("Start")),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(65),
                      bottomLeft: Radius.circular(65),
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10))),
              height: screenHeight*0.27,
              child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(65),
                      bottomLeft: Radius.circular(65),
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  child: Image.asset(
                    'assets/$images.jpg',

                    fit: BoxFit.cover,
                  )),
            ),
          )
        ],
      ),
    );
  }
}
