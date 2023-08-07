// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:lla/components/LLA_app_bar.dart';

import '../models/questionsArModel_models.dart';
import '../utilities/utilities.dart';

class ARDisplayScreen extends StatefulWidget {
  const ARDisplayScreen({
    required this.answer,
    required this.index,
    required this.isCorrect,
    super.key,
  });

  final bool isCorrect;
  final String answer;
  final int index;

  @override
  State<ARDisplayScreen> createState() => _ARDisplayScreenState();
}

class _ARDisplayScreenState extends State<ARDisplayScreen> {
  List<QuestionsARModels> questionARModels =
      Utilities.questionsArModelContentList();

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: LLAAppBar('A R View', true),
      body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Text(
          widget.isCorrect
              ? 'you got the answer correctly'
              : 'you got the answer wrongly',
          style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
        ),
      
      ]),
    );
  }
}