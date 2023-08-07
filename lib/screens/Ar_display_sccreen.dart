// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:lla/components/LLA_app_bar.dart';

class ARDisplayScreen extends StatefulWidget {
  const ARDisplayScreen(
      { 
        required this.answer,
        required this.isCorrect, super.key,});

  final bool isCorrect;
  final String answer;

  @override
  State<ARDisplayScreen> createState() => _ARDisplayScreenState();
}



class _ARDisplayScreenState extends State<ARDisplayScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LLAAppBar('AR Dispaly', true),
      body: Column(children: [
        Text(
          widget.isCorrect ? 'you got the answer correctly' : 'you got the answer wrongly',
          style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
        ),
        //TODO: Display some AR model based on the correct answer
      ],),
    );
  }
}
