import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lla/providers/providers.dart';
import 'package:lla/screens/quiz_question.dart';

class StartQuiz extends ConsumerWidget {
  const StartQuiz({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(quizProvider, (previous, next) {
      if (next.currentQuestionNo == next.questions.length) {
        Navigator.of(context).pushReplacementNamed('/quiz_complete');
      }
    });
    final currentQuestion = ref.watch(quizProvider).currentQuestionNo;
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async => false,
        child: SafeArea(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: currentQuestion < ref.watch(quizProvider).questions.length
                ? QuizQuestion(
                    key: ValueKey(currentQuestion),
                    quiz: ref.watch(quizProvider).questions[currentQuestion],
                  )
                : Container(),
          ),
        ),
      ),
    );
  }
}
