import 'package:flutter/material.dart';

ButtonStyle kQuizButtonStyle = ButtonStyle(
  backgroundColor: MaterialStateProperty.all(Colors.white),
  padding: MaterialStateProperty.all(const EdgeInsets.all(4)),
  textStyle: MaterialStateProperty.all(
    const TextStyle(fontSize: 20),
  ),
);

const kMediumSizedBoxSpace = SizedBox(height: 20.0);

const kPrimaryColor = Colors.indigo;
