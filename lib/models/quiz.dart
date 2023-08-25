// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class Quiz {
  final String question;
  final String answer;
  final List<String> options;
  final String? selectedOption;
  final String arImage;
  Quiz({
    required this.question,
    required this.answer,
    required this.options,
    this.selectedOption,
    required this.arImage,
  });

  Quiz copyWith({
    String? question,
    String? answer,
    List<String>? options,
    String? selectedOption,
    String? arImage,
  }) {
    return Quiz(
      question: question ?? this.question,
      answer: answer ?? this.answer,
      options: options ?? this.options,
      selectedOption: selectedOption ?? this.selectedOption,
      arImage: arImage ?? this.arImage,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'question': question,
      'answer': answer,
      'options': options,
      'selectedOption': selectedOption,
      'arImage': arImage,
    };
  }

  factory Quiz.fromMap(Map<String, dynamic> map) {
    return Quiz(
      question: map['question'] as String,
      answer: map['answer'] as String,
      options: List<String>.from((map['options'] as List<String>)),
      selectedOption: map['selectedOption'] != null
          ? map['selectedOption'] as String
          : null,
      arImage: map['arImage'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Quiz.fromJson(String source) =>
      Quiz.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Quiz(question: $question, answer: $answer, options: $options, selectedOption: $selectedOption, arImage: $arImage)';
  }

  @override
  bool operator ==(covariant Quiz other) {
    if (identical(this, other)) return true;

    return other.question == question &&
        other.answer == answer &&
        listEquals(other.options, options) &&
        other.selectedOption == selectedOption &&
        other.arImage == arImage;
  }

  @override
  int get hashCode {
    return question.hashCode ^
        answer.hashCode ^
        options.hashCode ^
        selectedOption.hashCode ^
        arImage.hashCode;
  }
}
