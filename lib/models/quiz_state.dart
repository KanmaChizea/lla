import 'package:flutter/foundation.dart';

import 'package:lla/models/quiz.dart';

class QuizState {
  final List<Quiz> questions;
  final String language;
  final int currentQuestionNo;
  QuizState({
    required this.questions,
    required this.language,
    required this.currentQuestionNo,
  });

  QuizState copyWith({
    List<Quiz>? questions,
    String? language,
    int? currentQuestionNo,
  }) {
    return QuizState(
      questions: questions ?? this.questions,
      language: language ?? this.language,
      currentQuestionNo: currentQuestionNo ?? this.currentQuestionNo,
    );
  }

  factory QuizState.none() {
    return QuizState(questions: [], language: '', currentQuestionNo: 0);
  }

  @override
  String toString() =>
      'QuizState(questions: $questions, language: $language, currentQuestionNo: $currentQuestionNo)';

  @override
  bool operator ==(covariant QuizState other) {
    if (identical(this, other)) return true;

    return listEquals(other.questions, questions) &&
        other.language == language &&
        other.currentQuestionNo == currentQuestionNo;
  }

  @override
  int get hashCode =>
      questions.hashCode ^ language.hashCode ^ currentQuestionNo.hashCode;
}
