import 'package:flutter/material.dart';
import '../constants.dart';

class NextQuote extends StatelessWidget{
  const NextQuote({Key? key,}) : super(key:key);

  @override
  Widget build(BuildContext context){
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color:Color(0xffEDE9D5),
        borderRadius: BorderRadius.circular(50.0),
      ),
      padding: const EdgeInsets.symmetric(vertical:10.0),
      child: Text(
        'Next quote',
        textAlign: TextAlign.center,style: textregular,
      )
    );
  }
}