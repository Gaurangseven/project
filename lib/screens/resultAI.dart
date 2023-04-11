import 'package:flutter/material.dart';

class ResultSerenity extends StatefulWidget {
  const ResultSerenity({Key? key, required this.result}) : super(key: key);

  final String result;


  @override
  State<ResultSerenity> createState() => _ResultSerenityState();
}
  late String message="good";






class _ResultSerenityState extends State<ResultSerenity> {

  @override
  void initState() {
    message=widget.result;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text(message),
        ),
      ),
    );
  }
}
