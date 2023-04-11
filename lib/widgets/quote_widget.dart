import 'package:flutter/material.dart';
import '../constants.dart';

class QuoteWidget extends StatelessWidget{
  const QuoteWidget({Key? key,
  required this.content,
  required this.author,
  }): super(key:key);

  final String content;
  final String author;

  @override
  Widget build(BuildContext context){
    return Container(
      alignment: Alignment.centerLeft,
      child: Column(
        children: [
          Text(
            content,
            style:const TextStyle(
              fontFamily: "Product",
              fontSize: 24,
              color:Color(0xffF8F5E4),
            ),
            ),
            const SizedBox(height:20.0),
            Text('- '+ author,
            style:const TextStyle(
              fontFamily: "Product",
              fontSize: 20,
              color:Colors.white,
            fontStyle: FontStyle.italic,
            ),
            ),
        ],
      ),
    );
  }
}