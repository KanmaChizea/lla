// ignore_for_file: non_constant_identifier_names, file_names

import 'package:flutter/material.dart';

import '../utilities/constants.dart';

  Padding QuizOptionButton(
      int index, Size size, VoidCallback onpressedQ, String buttonText) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: onpressedQ,
        style: kQuizButtonStyle,
        child: SizedBox(
          width: size.width * 0.7,
          height: size.height * 0.07,
          child: Center(
            child: Text(
              buttonText,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.blue,
              ),
            ),
          ),
        ),
      ),
    );
  }
