// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';

Container QuizQuestionDisplay(Size size, String quizQuestion) {
  return Container(
    width: size.width * 0.9,
    height: size.height * 0.35,
    padding: const EdgeInsets.all(16.0),
    margin: const EdgeInsets.symmetric(horizontal: 16.0),
    decoration: BoxDecoration(
      color: Colors.blue,
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: Center(
      child: Text(
        quizQuestion,
        //questions[totalQuestions].toString(),
        style: const TextStyle(
          fontSize: 24,
          color: Colors.white,
        ),
      ),
    ),
  );
}
