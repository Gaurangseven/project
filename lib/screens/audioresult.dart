import 'package:flutter/material.dart';

class AudioResult extends StatelessWidget {
  const AudioResult({Key? key, required this.moodkaisahai}) : super(key: key);
  final String moodkaisahai;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: SafeArea(
        child: Center(
          child: Container(
            child: Text(moodkaisahai),
          ),
        ),
      ),
    );
  }
}
