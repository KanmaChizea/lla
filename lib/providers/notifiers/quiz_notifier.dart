import 'dart:convert';
import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lla/models/quiz.dart';
import 'package:lla/models/quiz_state.dart';

class QuizNotifier extends StateNotifier<QuizState> {
  QuizNotifier() : super(QuizState.none());

  int _totalScore = 0;
  int get totalScore => _totalScore;

  Future getQuiz(String language) async {
    _totalScore = 0;
    final jsonString = await rootBundle.loadString('questions.json');
    final decodedJson = json.decode(jsonString);
    final quizList =
        (decodedJson['questions'] as List).map((e) => Quiz.fromMap(e)).toList();
    state = QuizState(
        questions: quizList, language: language, currentQuestionNo: 0);
  }

  void processAnswer(int selectedOption) {
    //set the selectedOption
    final newQuizList = [...state.questions];
    final selectedOptionText =
        newQuizList[state.currentQuestionNo].options[selectedOption];
    newQuizList[state.currentQuestionNo] = newQuizList[state.currentQuestionNo]
        .copyWith(selectedOption: selectedOptionText);
    if (selectedOptionText == newQuizList[state.currentQuestionNo].answer) {
      _totalScore++;
    }
    //increase currentQuestion
    final nextQuestion = state.currentQuestionNo + 1;
    state =
        state.copyWith(questions: newQuizList, currentQuestionNo: nextQuestion);
  }
}
