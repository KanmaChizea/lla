// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

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

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'questions': questions.map((x) => x.toMap()).toList(),
      'language': language,
      'currentQuestionNo': currentQuestionNo,
    };
  }

  factory QuizState.none() {
    return QuizState(questions: [], language: '', currentQuestionNo: 0);
  }

  factory QuizState.fromMap(Map<String, dynamic> map) {
    return QuizState(
      questions: List<Quiz>.from(
        (map['questions'] as List<int>).map<Quiz>(
          (x) => Quiz.fromMap(x as Map<String, dynamic>),
        ),
      ),
      language: map['language'] as String,
      currentQuestionNo: map['currentQuestionNo'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory QuizState.fromJson(String source) =>
      QuizState.fromMap(json.decode(source) as Map<String, dynamic>);

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
