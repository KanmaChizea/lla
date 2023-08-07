// ignore_for_file: file_names

import 'package:flutter/material.dart';

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
    return Container();
  }
}
