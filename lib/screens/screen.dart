import "package:flutter/material.dart";
import "package:project/constants.dart";

class Hola extends StatelessWidget {
  const Hola({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 300,
              ),
              Text('Morning',style: titlefont,),
              Text("Morning",style: head,)
            ],
          ),
        ),
      ),
    );
  }
}
