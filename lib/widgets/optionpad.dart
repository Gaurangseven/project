import 'package:flutter/material.dart';
import 'package:project/constants.dart';

class optionPad extends StatelessWidget {
  const optionPad({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
    required this.text,
  });

  final double screenHeight;
  final double screenWidth;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      height: screenHeight * 0.08,
      width: screenWidth * 0.70,
      decoration: BoxDecoration(
          color: Color(0xffEAF6F6), borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            width: 20,
          ),
          Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
                color: Colors.green, borderRadius: BorderRadius.circular(50)),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            text,
            style: titlefont,
          )
        ],
      ),
    );
  }
}
