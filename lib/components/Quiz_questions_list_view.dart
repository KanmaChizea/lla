// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:lla/screens/Ar_display_sccreen.dart';

import '../models/options_model.dart';
import '../models/questionsArModel_models.dart';
import '../models/questions_model.dart';
import '../utilities/utilities.dart';
import 'Quiz_option_button.dart';

List<QuestionsModel> questions = Utilities.questionsContentList();
List<OptionsModel> options = Utilities.optionsContentList();
List<QuestionsARModels> questionARModels =
    Utilities.questionsArModelContentList();

SizedBox QuizQuestionsListView(Size size, int tQuestions, int itemCounts) {
  return SizedBox(
    height: size.height * 0.45,
    child: ListView.builder(
      itemCount: itemCounts,
      itemBuilder: (context, index) {
        return QuizOptionButton(
          index,
          size,
          () {
            //? check if the answer is correct
            bool allQuestionsAnswered = checkAnswer(
                options[tQuestions].option[index],
                questions[tQuestions].answer);

            //? route them to the AR display Screen
            if (allQuestionsAnswered) {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>  ARDisplayScreen(
                          isCorrect: true,
                          answer: questions[tQuestions].answer,
                        )),
              );
            } else {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ARDisplayScreen(
                          isCorrect: false,
                          answer: questions[tQuestions].answer,
                        )),
              );
            }
          },
          options[tQuestions].option[index],
        );
      },
    ),
  );
}

bool checkAnswer(String option, String answer) {
  if (option == answer) {
    return true;
  }
  return false;
}
